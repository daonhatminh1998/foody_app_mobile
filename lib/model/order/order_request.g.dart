// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderRequest _$OrderRequestFromJson(Map<String, dynamic> json) => OrderRequest(
      Re_Id: json['Re_Id'] as int,
      ORD_CusNote: json['ORD_CusNote'] as String? ?? "",
      details: (json['details'] as List<dynamic>)
          .map((e) => Details.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderRequestToJson(OrderRequest instance) =>
    <String, dynamic>{
      'Re_Id': instance.Re_Id,
      'ORD_CusNote': instance.ORD_CusNote,
      'details': instance.details,
    };
