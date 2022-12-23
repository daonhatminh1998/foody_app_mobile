// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginInfo _$LoginInfoFromJson(Map<String, dynamic> json) => LoginInfo(
      id: json['Mem_Id'] as int? ?? 0,
      username: json['username'] as String,
      createdAt: json['created_at'] as String? ?? "",
      updatedAt: json['updated_at'] as String? ?? "",
      bgImg: json['bgimg'] as String? ?? "",
      avatar: json['avatar'] as String? ?? "",
      email: json['email'] as String,
      fullName: json['name'] as String,
      token: json['api_token'] as String,
    );

Map<String, dynamic> _$LoginInfoToJson(LoginInfo instance) => <String, dynamic>{
      'Mem_Id': instance.id,
      'name': instance.fullName,
      'username': instance.username,
      'bgimg': instance.bgImg,
      'avatar': instance.avatar,
      'email': instance.email,
      'api_token': instance.token,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
