import 'dart:convert';

import 'package:rick_and_morty/core/error/exception.dart';
import 'package:rick_and_morty/features/main_page/data/models/person_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PersonLocalDataSource {
  Future<List<PersonModel>> getAllPersonsFromCache();
  Future<void> personsToCache(List<PersonModel> persons);
}

const CACHED_PERSONS_LIST = "CACHED_PERSONS_LIST";

class _PersonLocalDataSource implements PersonLocalDataSource {
  final SharedPreferences sharedPreferences;

  _PersonLocalDataSource({required this.sharedPreferences});

  @override
  Future<List<PersonModel>> getAllPersonsFromCache() {
    final jsonPersonList = sharedPreferences.getStringList(CACHED_PERSONS_LIST);
    if (jsonPersonList != null && jsonPersonList.isNotEmpty) {
      return Future.value(jsonPersonList
          .map((person) => PersonModel.fromJson(json.decode(person)))
          .toList());
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> personsToCache(List<PersonModel> persons) async {
    final List<String> jsonPersonList =
        persons.map((person) => json.encode(person.toJson())).toList();
    sharedPreferences.setStringList(CACHED_PERSONS_LIST, jsonPersonList);
    // return Future.value(jsonPersonList);
  }
}
