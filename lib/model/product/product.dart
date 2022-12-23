// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';
part 'product.g.dart';

//product to show store
@JsonSerializable()
class Product {
  @JsonKey(name: 'ProDe_Id')
  int productID;
  @JsonKey(name: 'Pro_Name')
  String productName;
  @JsonKey(name: 'Pro_Price')
  double productPrice;
  @JsonKey(name: 'Pro_Unit')
  String unit;
  @JsonKey(name: 'Pro_Avatar')
  String image;
  @JsonKey(name: 'shortDes')
  String shortDescription;
  @JsonKey(name: 'longDes')
  String longDescription;
  @JsonKey(name: 'is_Published')
  int isPublished;
  @JsonKey(name: 'Pro_Id')
  int productTypeId;

  Product({
    this.productID = 0,
    required this.productName,
    required this.productPrice,
    required this.image,
    required this.unit,
    required this.shortDescription,
    required this.longDescription,
    required this.isPublished,
    required this.productTypeId,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
