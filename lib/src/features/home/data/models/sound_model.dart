import 'package:json_annotation/json_annotation.dart';

part 'sound_model.g.dart';

@JsonSerializable()
class SoundModel {
  @JsonKey(required: false)
  String? id;
  @JsonKey(required: false)
  bool? favorite;
  String category;
  String name;
  String uri;

  SoundModel({required this.category, required this.name, required this.uri});

  setIsFavorite(bool isFavorite) => favorite = isFavorite;
  setId(String id) => this.id = id;

  factory SoundModel.fromJson(Map<String, dynamic> json) =>
      _$SoundModelFromJson(json);

  Map<String, dynamic> toJson() => _$SoundModelToJson(this);
}
