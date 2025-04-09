import 'package:devsolutions_task/core/theme/colors_manager.dart';
import 'package:devsolutions_task/core/theme/text_styles.dart';
import 'package:devsolutions_task/core/widgets/app_spacer.dart';
import 'package:flutter/material.dart';

class CheckoutInvoiceWidget extends StatelessWidget {
  const CheckoutInvoiceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InvoiceItem(title: "Subtotal", value: "\$100.00"),
        AppSpacer(heightRatio: .5),
        InvoiceItem(title: "Shipping", value: "\$10.00"),
        AppSpacer(heightRatio: .5),
        InvoiceItem(title: "Tax", value: "\$5.00"),
        AppSpacer(heightRatio: .5),
        InvoiceItem(title: "Total", value: "\$115.00"),
      ],
    );
  }
}

class InvoiceItem extends StatelessWidget {
  const InvoiceItem({super.key, required this.title, required this.value});
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyles.semiBold16.copyWith(color: ColorsManager.black),
          ),
        ),
        Text(
          value,
          style: TextStyles.medium14.copyWith(color: ColorsManager.subPrimary),
        ),
      ],
    );
  }
}
