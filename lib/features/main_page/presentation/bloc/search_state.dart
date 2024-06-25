import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/features/main_page/domain/entities/person_entity.dart';

abstract class PersonSearchState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class PersonEmpty extends PersonSearchState {}

class PersonSearchLodaing extends PersonSearchState {}

class PersonSearchLoaded extends PersonSearchState {
  final List<PersonEntity> persons;

  PersonSearchLoaded({required this.persons});

  @override
  List<Object?> get props => [persons];
}

class PersonSearchError extends PersonSearchState {
  final String message;

  PersonSearchError({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
