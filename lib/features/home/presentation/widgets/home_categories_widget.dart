// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:devsolutions_task/core/widgets/app_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'category_item_widget.dart';

class HomeCategoriesWidget extends StatefulWidget {
  const HomeCategoriesWidget({super.key, this.onCategorySelected});
  final Function(String category)? onCategorySelected;
  @override
  State<HomeCategoriesWidget> createState() => _HomeCategoriesWidgetState();
}

class _HomeCategoriesWidgetState extends State<HomeCategoriesWidget> {
  int selectedIndex = 0;
  List<String> categories = [
    'All',
    'Electronics',
    'Fashion',
    'Home & Garden',
    'Sports',
    'Toys',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.sp,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView.separated(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => AppSpacer(widthRatio: 0.5),
        itemBuilder: (context, index) {
          return CategoryItemWidget(
            category: categories[index],
            isSelected: selectedIndex == index,
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              widget.onCategorySelected?.call(categories[index]);
            },
          );
        },
      ),
    );
  }
}
