import 'package:devsolutions_task/core/extensions/build_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/app_spacer.dart';
import 'product_shimmer_widget.dart';

class ProductsShimmerListView extends StatelessWidget {
  const ProductsShimmerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170.sp,
      width: context.screenWidth,
      child: ListView.separated(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => AppSpacer(widthRatio: 0.5),
        itemBuilder: (context, index) {
          return ProductShimmerWidget();
        },
      ),
    );
  }
}
