import '../../../../core/extensions/build_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/global/enums.dart';
import '../../../../core/global/strings.dart';
import '../../../../core/theme/colors_manager.dart';
import '../../../../core/theme/text_styles.dart';

class ShippingMethodItemWidget extends StatelessWidget {
  const ShippingMethodItemWidget({
    super.key,
    required this.shippingMethod,
    required this.isSelected,
    required this.onTap,
  });
  final ShippingMethod shippingMethod;
  final bool isSelected;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: context.screenWidth,
        padding: EdgeInsets.symmetric(vertical: 8.sp, horizontal: 10.sp),
        decoration: BoxDecoration(
          color: isSelected ? ColorsManager.white : ColorsManager.lightGrey,
          borderRadius: BorderRadius.circular(80.r),
          border: Border.all(
            color: isSelected ? ColorsManager.white : ColorsManager.lightGrey,
          ),
          boxShadow: [
            BoxShadow(
              color: ColorsManager.lightGrey.withValues(alpha: .5),
              blurRadius: 2,
              spreadRadius: 0,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          getShippingMethodText(shippingMethod),
          textAlign: TextAlign.center,
          style: TextStyles.semiBold14.copyWith(
            color: isSelected ? ColorsManager.black : ColorsManager.grey,
            fontSize: 13.sp,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
