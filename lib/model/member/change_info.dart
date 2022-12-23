// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'change_info.g.dart';

@JsonSerializable()
class ChangeInfo {
  String name;
  String email;
  String avatar;
  String bgimg;
  ChangeInfo(
      {this.name = "", this.email = "", this.avatar = "", this.bgimg = ""});

  factory ChangeInfo.fromJson(Map<String, dynamic> json) =>
      _$ChangeInfoFromJson(json);
  Map<String, dynamic> toJson() => _$ChangeInfoToJson(this);
}
