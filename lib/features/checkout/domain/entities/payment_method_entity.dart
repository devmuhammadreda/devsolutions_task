import '../../../../core/theme/colors_manager.dart';
import 'package:flutter/material.dart';

class PaymentMethodEntity {
  final String id;
  final String name;
  final num number;
  final String type;
  final LinearGradient linearGradient;

  PaymentMethodEntity({
    required this.id,
    required this.name,
    required this.type,
    required this.linearGradient,
    required this.number,
  });
}

List<PaymentMethodEntity> paymentMethods = [
  PaymentMethodEntity(
    id: "1",
    name: "Muhammad Reda Mohammad",
    type: "Visa",
    linearGradient: ColorsManager.visaLinearGradient,
    number: 1234567890123456,
  ),
  PaymentMethodEntity(
    id: "2",
    name: "Muhammad Reda Mohammad",
    type: "MasterCard",
    linearGradient: ColorsManager.mastercardLinearGradient,
    number: 1234567890123456,
  ),
];
