// ignore_for_file: unused_import, depend_on_referenced_packages

import 'package:foody_app/model/order/order.dart';
import 'package:json_annotation/json_annotation.dart';

part 'details.g.dart';

@JsonSerializable()
class Details {
  int id;
  int quantity;

  Details({
    required this.id,
    required this.quantity,
  });

  factory Details.fromJson(Map<String, dynamic> json) =>
      _$DetailsFromJson(json);

  Map<String, dynamic> toJson() => _$DetailsToJson(this);
}
