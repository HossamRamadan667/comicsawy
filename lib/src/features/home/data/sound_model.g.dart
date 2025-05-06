// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sound_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SoundModel _$SoundModelFromJson(Map<String, dynamic> json) => SoundModel(
      category: json['category'] as String,
      name: json['name'] as String,
      uri: json['uri'] as String,
    )..id = json['id'] as String?;

Map<String, dynamic> _$SoundModelToJson(SoundModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'name': instance.name,
      'uri': instance.uri,
    };
