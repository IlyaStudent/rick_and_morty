import 'package:equatable/equatable.dart';

abstract class SearchPersonEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SearchPersons extends SearchPersonEvent {
  final String personQeury;

  SearchPersons({required this.personQeury});
}
