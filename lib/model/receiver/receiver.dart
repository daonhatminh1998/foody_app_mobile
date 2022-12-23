// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'receiver.g.dart';

@JsonSerializable()
class Receiver {
  int Re_Id;
  @JsonKey(name: 'name')
  String fullName;
  String phone;
  String address;
  int is_Default;
  int is_Chosen;
  int Mem_Id;

  Receiver({
    this.Re_Id = 0,
    required this.fullName,
    required this.phone,
    required this.address,
    this.is_Default = 0,
    this.is_Chosen = 0,
    required this.Mem_Id,
  });

  factory Receiver.fromJson(Map<String, dynamic> json) =>
      _$ReceiverFromJson(json);

  Map<String, dynamic> toJson() => _$ReceiverToJson(this);
}
