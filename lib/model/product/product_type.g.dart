// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductType _$ProductTypeFromJson(Map<String, dynamic> json) => ProductType(
      productId: json['Pro_Id'] as int? ?? 0,
      productType: json['Pro_Type'] as String,
    );

Map<String, dynamic> _$ProductTypeToJson(ProductType instance) =>
    <String, dynamic>{
      'Pro_Id': instance.productId,
      'Pro_Type': instance.productType,
    };
