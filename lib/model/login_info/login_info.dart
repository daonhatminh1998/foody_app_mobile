// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'login_info.g.dart';

@JsonSerializable()
class LoginInfo {
  @JsonKey(name: 'Mem_Id')
  int id;
  @JsonKey(name: 'name')
  String fullName;
  String username;
  @JsonKey(name: 'bgimg')
  String bgImg;
  String avatar;
  String email;
  // String phone;
  @JsonKey(name: "api_token")
  String token;
  @JsonKey(name: "created_at")
  String createdAt;
  @JsonKey(name: 'updated_at')
  String updatedAt;

  LoginInfo({
    this.id = 0,
    required this.username,
    this.createdAt = "",
    this.updatedAt = "",
    this.bgImg = "",
    this.avatar = "",
    required this.email,
    // required this.phone,
    required this.fullName,
    required this.token,
  });

  factory LoginInfo.fromJson(Map<String, dynamic> json) =>
      _$LoginInfoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginInfoToJson(this);
}
