import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';
import 'package:rick_and_morty/core/error/exception.dart';
import 'package:rick_and_morty/features/main_page/data/models/person_model.dart';
import 'package:retrofit/retrofit.dart';

part 'person_remote_data_source.g.dart';

@RestApi(baseUrl: '')
abstract class PersonRemoteDataSource {
  factory PersonRemoteDataSource(Dio dio, {String baseUrl}) =
      _PersonRemoteDataSource;

  // https://rickandmortyapi.com/api/character/?page=19
  @GET("/character/?page={page}")
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<List<PersonModel>> getAllPersons(@Path("page") int page);

  // https://rickandmortyapi.com/api/character/?name=rick&status=alive
  @GET("/character/?name={query}")
  Future<List<PersonModel>> searchPerson(@Path("query") String query);
}
