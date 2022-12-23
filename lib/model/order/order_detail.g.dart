// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDetail _$OrderDetailFromJson(Map<String, dynamic> json) => OrderDetail(
      id: json['ORDe_Id'] as int? ?? 0,
      quantity: json['ORDe_Quantity'] as int,
      price: (json['ORDe_Price'] as num).toDouble(),
      productDetailID: json['ProDe_Id'] as int,
      orderId: json['ORD_Id'] as int,
    );

Map<String, dynamic> _$OrderDetailToJson(OrderDetail instance) =>
    <String, dynamic>{
      'ORDe_Id': instance.id,
      'ORDe_Quantity': instance.quantity,
      'ORDe_Price': instance.price,
      'ProDe_Id': instance.productDetailID,
      'ORD_Id': instance.orderId,
    };
