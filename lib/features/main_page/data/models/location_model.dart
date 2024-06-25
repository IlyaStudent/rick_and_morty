import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty/features/main_page/domain/entities/location_entity.dart';

part 'location_model.g.dart';

@JsonSerializable()
class LocationModel extends LocationEntity {
  const LocationModel({required name, required url})
      : super(name: name, url: url);

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);
  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}
