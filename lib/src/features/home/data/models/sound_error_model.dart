import 'package:json_annotation/json_annotation.dart';

part 'sound_error_model.g.dart';

@JsonSerializable()
class SoundErrorModel {
  @JsonKey(name: 'error')
  final String? message;
  final int? code;
  SoundErrorModel({this.message, this.code});

  factory SoundErrorModel.fromJson(Map<String, dynamic> json) =>
      _$SoundErrorModelFromJson(json);
}
