// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'change_password.g.dart';

@JsonSerializable()
class ChangePassword {
  String password;
  String newPassword;
  String confirmPassword;
  ChangePassword(
      {required this.password,
      required this.newPassword,
      required this.confirmPassword});

  factory ChangePassword.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordFromJson(json);
  Map<String, dynamic> toJson() => _$ChangePasswordToJson(this);
}
