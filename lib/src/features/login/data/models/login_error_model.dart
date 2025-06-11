import 'package:json_annotation/json_annotation.dart';

class LoginErrorModel {
  @JsonKey(name: 'error')
  final String? message;
  final int? code;
  LoginErrorModel({this.message, this.code});
}
