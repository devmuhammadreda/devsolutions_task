// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:devsolutions_task/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/colors_manager.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onTap,
  });
  final String category;
  final bool isSelected;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 8.sp),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? ColorsManager.primary : ColorsManager.grey,
          ),
          color: isSelected ? ColorsManager.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(67.r),
        ),
        child: Text(
          category,
          style: TextStyles.semiBold12.copyWith(
            color: isSelected ? Colors.white : ColorsManager.grey,
          ),
        ),
      ),
    );
  }
}
