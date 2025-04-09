import 'package:devsolutions_task/core/extensions/build_context.dart';
import 'package:devsolutions_task/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/global/strings.dart';
import '../../domain/entities/payment_method_entity.dart';

class PaymentMethodItemWidget extends StatelessWidget {
  const PaymentMethodItemWidget({
    super.key,
    required this.paymentMethod,
    required this.isSelected,
    required this.onTap,
  });
  final PaymentMethodEntity paymentMethod;
  final bool isSelected;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: context.screenWidth / 1.4,
        height: isSelected ? 150.sp : 100.sp,
        decoration: BoxDecoration(
          gradient: paymentMethod.linearGradient,
          borderRadius: BorderRadius.circular(40.sp),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    paymentMethod.type,
                    style: TextStyles.bold20.copyWith(color: Colors.white),
                  ),
                ),
                if (isSelected)
                  Icon(Icons.check_circle, color: Colors.white, size: 30.sp),
              ],
            ),
            Text(
              paymentMethod.name,
              style: TextStyles.bold16.copyWith(color: Colors.white),
            ),
            Text(
              obscureCardNumber(paymentMethod.number.toString()),
              style: TextStyles.bold16.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
