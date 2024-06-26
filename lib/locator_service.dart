import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:rick_and_morty/core/networking/network_info.dart';
import 'package:rick_and_morty/features/main_page/data/datasources/person_local_data_source.dart';
import 'package:rick_and_morty/features/main_page/data/datasources/person_remote_data_source.dart';
import 'package:rick_and_morty/features/main_page/data/repositories/person_repository_impl.dart';
import 'package:rick_and_morty/features/main_page/domain/repositories/person_repository.dart';
import 'package:rick_and_morty/features/main_page/domain/usecases/get_all_persons.dart';
import 'package:rick_and_morty/features/main_page/domain/usecases/search_person.dart';
import 'package:rick_and_morty/features/main_page/presentation/bloc/person_list_cubit/person_list_cubit.dart';
import 'package:rick_and_morty/features/main_page/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  // BLoC & Cubit
  sl.registerFactory(() => PersonListCubit(getAllPersons: sl<GetAllPersons>()));
  sl.registerFactory(() => PersonSearchBloc(searchPerson: sl<SearchPerson>()));

  // UseCase
  sl.registerLazySingleton(() => GetAllPersons(sl()));
  sl.registerLazySingleton(() => SearchPerson(sl()));

  // Repository
  sl.registerLazySingleton<PersonRepository>(() => PersonRepositoryImpl(
        remoteDataSource: sl(),
        localDataSource: sl(),
        networkInfo: sl(),
      ));
  sl.registerLazySingleton<PersonLocalDataSource>(
      () => PersonLocalDataSourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<PersonRemoteDataSource>(
      () => PersonRemoteDataSourceImpl(client: sl()));

  // Core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(sl()),
  );

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
