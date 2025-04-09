import 'dart:developer';

import 'package:devsolutions_task/core/extensions/build_context.dart';
import 'package:devsolutions_task/core/extensions/widget.dart';
import 'package:devsolutions_task/core/widgets/app_spacer.dart';
import 'package:devsolutions_task/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/header_widget.dart';
import '../../home_inject.dart';
import '../widgets/home_categories_widget.dart';
import '../widgets/hot_sales_widget.dart';
import '../widgets/recently_viewed_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: homeCubits(),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Assets.images.homeHeader.image(
              height: 196.sp,
              width: context.screenWidth,
              fit: BoxFit.cover,
            ),
            HomeCategoriesWidget(
              onCategorySelected: (category) {
                log('Selected category: $category');
              },
            ),
            AppSpacer(heightRatio: 0.5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderWidget(title: "Hot sales"),
                AppSpacer(heightRatio: 0.3),
                HotSalesWidget(),
                AppSpacer(heightRatio: 0.5),
                HeaderWidget(title: "Recently viewed"),
                AppSpacer(heightRatio: 0.3),
                RecentlyViewedWidget(),
                AppSpacer(),
              ],
            ).paddingSymmetric(horizontal: 20.sp),
          ],
        ),
      ),
    );
  }
}
