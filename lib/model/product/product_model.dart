import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/http.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  late final int? id;
  final String? productId;
  final String? productName;
  final double? initialPrice;
  final double? productPrice;
  final int? quantity;
  final String? unitType;
  final String? image;

  ProductModel(
      {required this.id,
      required this.image,
      required this.initialPrice,
      required this.productId,
      required this.productName,
      required this.productPrice,
      required this.quantity,
      required this.unitType});

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, Object?> toJson() => _$ProductModelToJson(this);
}
