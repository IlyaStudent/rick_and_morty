import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/error/failure.dart';
import 'package:rick_and_morty/features/main_page/domain/entities/person_entity.dart';
import 'package:rick_and_morty/features/main_page/domain/usecases/get_all_persons.dart';
import 'package:rick_and_morty/features/main_page/presentation/bloc/person_list_cubit/person_list_state.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHED_FAILURE_MESSAGE = 'Cache Failure';

class PersonListCubit extends Cubit<PersonState> {
  final GetAllPersons getAllPersons;

  PersonListCubit({required this.getAllPersons}) : super(PersonEmpty());

  int page = 1;

  void loadPerson() async {
    if (state is PersonLoading) return;

    final currentState = state;

    var oldPersons = <PersonEntity>[];
    if (currentState is PersonLoaded) {
      oldPersons = currentState.personList;
    }

    emit(PersonLoading(oldPersons, isFirstFetch: page == 1));

    final failureOrPerson = await getAllPersons(PagePersonParams(page: page));

    failureOrPerson.fold(
      (error) => emit(PersonError(message: _mapFailureToMessage(error))),
      (person) {
        page++;
        final persons = (state as PersonLoading).oldPersonList;
        persons.addAll(person);
        print("List length: ${persons.length}");
        emit(PersonLoaded(persons));
      },
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure _:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure _:
        return CACHED_FAILURE_MESSAGE;
      default:
        return "Unexpected error";
    }
  }
}
