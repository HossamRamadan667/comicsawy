// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sound_error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SoundErrorModel _$SoundErrorModelFromJson(Map<String, dynamic> json) =>
    SoundErrorModel(
      message: json['error'] as String?,
      code: json['code'] as int?,
    );

Map<String, dynamic> _$SoundErrorModelToJson(SoundErrorModel instance) =>
    <String, dynamic>{
      'error': instance.message,
      'code': instance.code,
    };
