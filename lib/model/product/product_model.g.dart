// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      id: json['id'] as int?,
      image: json['image'] as String?,
      initialPrice: (json['initialPrice'] as num?)?.toDouble(),
      productId: json['productId'] as String?,
      productName: json['productName'] as String?,
      productPrice: (json['productPrice'] as num?)?.toDouble(),
      quantity: json['quantity'] as int?,
      unitType: json['unitType'] as String?,
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productId': instance.productId,
      'productName': instance.productName,
      'initialPrice': instance.initialPrice,
      'productPrice': instance.productPrice,
      'quantity': instance.quantity,
      'unitType': instance.unitType,
      'image': instance.image,
    };
