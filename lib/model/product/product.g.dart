// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      productID: json['ProDe_Id'] as int? ?? 0,
      productName: json['Pro_Name'] as String,
      productPrice: (json['Pro_Price'] as num).toDouble(),
      image: json['Pro_Avatar'] as String,
      unit: json['Pro_Unit'] as String,
      shortDescription: json['shortDes'] as String,
      longDescription: json['longDes'] as String,
      isPublished: json['is_Published'] as int,
      productTypeId: json['Pro_Id'] as int,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'ProDe_Id': instance.productID,
      'Pro_Name': instance.productName,
      'Pro_Price': instance.productPrice,
      'Pro_Unit': instance.unit,
      'Pro_Avatar': instance.image,
      'shortDes': instance.shortDescription,
      'longDes': instance.longDescription,
      'is_Published': instance.isPublished,
      'Pro_Id': instance.productTypeId,
    };
