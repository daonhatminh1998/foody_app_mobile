// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      orderId: json['ORD_Id'] as int? ?? 0,
      orderCode: json['ORD_Code'] as String,
      date: json['ORD_DateTime'] as String,
      name: json['ORD_Name'] as String,
      phone: json['ORD_Phone'] as String,
      address: json['ORD_Address'] as String,
      memberID: json['Mem_Id'] as int,
      adNote: json['ORD_AdNote'] as String? ?? "",
      cusNote: json['ORD_CusNote'] as String? ?? "",
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'ORD_Id': instance.orderId,
      'ORD_Code': instance.orderCode,
      'ORD_DateTime': instance.date,
      'ORD_Name': instance.name,
      'ORD_Phone': instance.phone,
      'ORD_Address': instance.address,
      'ORD_AdNote': instance.adNote,
      'ORD_CusNote': instance.cusNote,
      'Mem_Id': instance.memberID,
    };
