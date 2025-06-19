import 'package:comicsawy/src/features/home/data/models/sound_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'upload_sound_response_model.g.dart';

@JsonSerializable()
class UploadSoundResponseModel {
  @JsonKey(name: 'name')
  final String id;

  UploadSoundResponseModel(this.id);

  factory UploadSoundResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UploadSoundResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UploadSoundResponseModelToJson(this);
}
