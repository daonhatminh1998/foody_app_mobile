// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest {
  String username;
  String name;
  String email;
  String password;
  String confirmPassword;
  RegisterRequest(
      {required this.username,
      required this.name,
      this.email = "",
      required this.password,
      required this.confirmPassword});

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}
