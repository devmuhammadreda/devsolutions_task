import 'package:devsolutions_task/core/extensions/build_context.dart';
import 'package:devsolutions_task/core/theme/colors_manager.dart';
import 'package:devsolutions_task/core/theme/text_styles.dart';
import 'package:devsolutions_task/core/widgets/app_spacer.dart';
import 'package:devsolutions_task/core/widgets/main_shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductShimmerWidget extends StatelessWidget {
  const ProductShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth / 2.8,
      decoration: BoxDecoration(
        color: ColorsManager.lightGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: MainShimmerWidget(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 6,
                  child: Container(
                    width: context.screenWidth,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppSpacer(heightRatio: 0.1),
                        Flexible(
                          child: Container(
                            height: TextStyles.medium10.fontSize,
                            width: context.screenWidth * 0.3,
                            color: Colors.white,
                          ),
                        ),
                        AppSpacer(heightRatio: 0.1),
                        Flexible(
                          flex: 2,
                          child: Column(
                            children: [
                              Container(
                                height: TextStyles.medium10.fontSize,
                                width: context.screenWidth * 0.4,
                                color: Colors.white,
                              ),
                              SizedBox(height: 4.sp),
                              Container(
                                height: TextStyles.medium10.fontSize,
                                width: context.screenWidth * 0.35,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                        AppSpacer(heightRatio: 0.1),
                        Flexible(
                          child: Container(
                            height: TextStyles.semiBold12.fontSize,
                            width: context.screenWidth * 0.2,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: Container(width: 24.sp, height: 24.sp, color: Colors.white),
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(ColorsManager.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
