import 'package:devsolutions_task/core/services/get_storage_helper.dart';
import 'package:devsolutions_task/core/theme/colors_manager.dart';
import 'package:devsolutions_task/core/widgets/app_spacer.dart';
import 'package:devsolutions_task/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class NavAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const NavAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Expanded(
            child: CustomTextField(
              prefixIcon: Icon(
                Iconsax.search_normal_copy,
                color: ColorsManager.grey,
              ),
            ),
          ),
          AppSpacer(),
          Stack(
            children: [
              IconButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    ColorsManager.lightGrey,
                  ),
                  shape: WidgetStateProperty.all(CircleBorder()),
                ),
                padding: EdgeInsets.all(12.sp),
                onPressed: () {},
                icon: Icon(
                  Iconsax.notification_copy,
                  color: ColorsManager.grey,
                ),
              ),
              Positioned(
                right: CacheHelper.getLocale == 'ar' ? null : 5,
                left: CacheHelper.getLocale == 'ar' ? 0 : null,
                top: 5,
                child: Container(
                  padding: EdgeInsets.all(5.sp),
                  decoration: BoxDecoration(
                    color: ColorsManager.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(76.0.sp);
}
