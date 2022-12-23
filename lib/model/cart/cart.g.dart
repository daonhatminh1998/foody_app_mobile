// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cart _$CartFromJson(Map<String, dynamic> json) => Cart(
      id: json['Cart_Id'] as int? ?? 0,
      cartItem: (json['cart_detail'] as List<dynamic>)
          .map((e) => CartDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      memberId: json['Mem_Id'] as int,
    );

Map<String, dynamic> _$CartToJson(Cart instance) => <String, dynamic>{
      'Cart_Id': instance.id,
      'Mem_Id': instance.memberId,
      'cart_detail': instance.cartItem,
    };
