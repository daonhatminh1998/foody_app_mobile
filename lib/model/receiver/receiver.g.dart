// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receiver.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Receiver _$ReceiverFromJson(Map<String, dynamic> json) => Receiver(
      Re_Id: json['Re_Id'] as int? ?? 0,
      fullName: json['name'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
      is_Default: json['is_Default'] as int? ?? 0,
      is_Chosen: json['is_Chosen'] as int? ?? 0,
      Mem_Id: json['Mem_Id'] as int,
    );

Map<String, dynamic> _$ReceiverToJson(Receiver instance) => <String, dynamic>{
      'Re_Id': instance.Re_Id,
      'name': instance.fullName,
      'phone': instance.phone,
      'address': instance.address,
      'is_Default': instance.is_Default,
      'is_Chosen': instance.is_Chosen,
      'Mem_Id': instance.Mem_Id,
    };
