import 'package:json_annotation/json_annotation.dart';

part 'product_type.g.dart';

@JsonSerializable()
class ProductType {
  @JsonKey(name: 'Pro_Id')
  int productId;
  @JsonKey(name: 'Pro_Type')
  String productType;

  ProductType({this.productId = 0, required this.productType});

  factory ProductType.fromJson(Map<String, dynamic> json) =>
      _$ProductTypeFromJson(json);

  Map<String, dynamic> toJson() => _$ProductTypeToJson(this);
}
