// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangeInfo _$ChangeInfoFromJson(Map<String, dynamic> json) => ChangeInfo(
      name: json['name'] as String? ?? "",
      email: json['email'] as String? ?? "",
      avatar: json['avatar'] as String? ?? "",
      bgimg: json['bgimg'] as String? ?? "",
    );

Map<String, dynamic> _$ChangeInfoToJson(ChangeInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'avatar': instance.avatar,
      'bgimg': instance.bgimg,
    };
