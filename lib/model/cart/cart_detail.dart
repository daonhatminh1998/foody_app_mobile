import 'package:json_annotation/json_annotation.dart';

part 'cart_detail.g.dart';

@JsonSerializable()
class CartDetail {
  @JsonKey(name: 'CartDe_Id')
  int cartDetailId;
  @JsonKey(name: 'CartDe_Quantity')
  int quantity;
  @JsonKey(name: 'ProDe_Id')
  int productId;
  @JsonKey(name: 'Cart_Id')
  int cartId;

  CartDetail({
    this.cartDetailId = 0,
    required this.productId,
    required this.quantity,
    required this.cartId,
  });

  factory CartDetail.fromJson(Map<String, dynamic> json) =>
      _$CartDetailFromJson(json);

  Map<String, dynamic> toJson() => _$CartDetailToJson(this);
}
