import 'package:devsolutions_task/core/theme/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewPaymentMethods extends StatelessWidget {
  const NewPaymentMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      crossAxisAlignment: WrapCrossAlignment.start,
      alignment: WrapAlignment.start,
      children: [
        NewPaymentMethodItem(
          icon: Icons.credit_card,
          onTap: () {
            // Handle add new payment method action
          },
        ),
        NewPaymentMethodItem(
          icon: Icons.account_balance_wallet,
          onTap: () {
            // Handle add new payment method action
          },
        ),
        NewPaymentMethodItem(
          icon: Icons.paypal,
          onTap: () {
            // Handle add new payment method action
          },
        ),
      ],
    );
  }
}

class NewPaymentMethodItem extends StatelessWidget {
  const NewPaymentMethodItem({
    super.key,
    required this.icon,
    required this.onTap,
  });
  final IconData icon;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12.r),
      ),
      padding: EdgeInsets.symmetric(vertical: 14.5.sp, horizontal: 22.sp),
      child: GestureDetector(
        onTap: onTap,
        child: Icon(icon, color: ColorsManager.subPrimary),
      ),
    );
  }
}
