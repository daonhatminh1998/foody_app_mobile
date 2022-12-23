// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'product_detail.g.dart';

// detail of each item in cart include product id and quantity for order

@JsonSerializable()
class ProductDetail {
  int productDetailId;
  String name;
  int quantity;
  double price;
  String img;

  ProductDetail({
    required this.productDetailId,
    required this.name,
    required this.quantity,
    required this.price,
    required this.img,
  });

  @override
  int get hashCode => productDetailId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductDetail &&
          runtimeType == other.runtimeType &&
          productDetailId == other.productDetailId;

  factory ProductDetail.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailToJson(this);
}
