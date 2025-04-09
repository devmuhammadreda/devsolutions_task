import 'dart:developer';

import 'package:devsolutions_task/core/theme/text_styles.dart';
import 'package:devsolutions_task/core/widgets/app_spacer.dart';
import 'package:devsolutions_task/core/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/global/enums.dart';
import '../../../../core/theme/colors_manager.dart';
import '../../../../core/widgets/progress_button.dart';
import '../../../home/domain/entities/product_entity.dart';
import '../../domain/entities/payment_method_entity.dart';
import '../widgets/checkout_invoice_widget.dart';
import '../widgets/checkout_product_widget.dart';
import '../widgets/new_payment_methods.dart';
import '../widgets/payment_methods_widget.dart';
import '../widgets/shipping_method_widget.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({
    super.key,
    required this.product,
    required this.heroTag,
  });
  final ProductEntity product;
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(ColorsManager.lightGrey),
          ),
        ),
        title: Text(
          "Checkout",
          style: TextStyles.semiBold16.copyWith(color: ColorsManager.grey),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CheckoutProductWidget(heroTag: heroTag, product: product),
            AppSpacer(),
            HeaderWidget(title: "Shipping method"),
            AppSpacer(),
            ShippingMethodWidget(
              initVal: ShippingMethod.homeDelivery,
              onChanged: (value) {
                log("Shipping method changed to: $value");
              },
            ),
            AppSpacer(),
            HeaderWidget(title: "Select your payment method"),
            AppSpacer(),
            PaymentMethodsWidget(
              initId: paymentMethods.first.id,
              onSelectPaymentMethod: (value) {
                log("Selected payment method ID: $value");
              },
            ),
            AppSpacer(),
            HeaderWidget(title: "+ Add new"),
            AppSpacer(),
            NewPaymentMethods(),
            AppSpacer(),
            CheckoutInvoiceWidget(),
            AppSpacer(),
            Divider(
              color: ColorsManager.grey.withValues(alpha: .4),
              thickness: 1,
            ),
            AppSpacer(),
            AppProgressButton(
              onPressed: (anim) {},
              text: "Finalize Purchase",
              backgroundColor: ColorsManager.primary,
            ),
            AppSpacer(),
          ],
        ),
      ),
    );
  }
}
