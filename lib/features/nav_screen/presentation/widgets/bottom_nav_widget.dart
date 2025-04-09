import '../../../../core/extensions/build_context.dart';
import '../../../../core/extensions/int.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../core/theme/colors_manager.dart';
import '../cubit/nav_screen_cubit.dart';

class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavScreenCubit, NavScreenState>(
      builder: (context, state) {
        return Container(
          width: context.screenWidth,
          padding: EdgeInsets.all(14.sp),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: .2),
                blurRadius: 30,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: GNav(
            gap: 8.5,
            selectedIndex: context.read<NavScreenCubit>().index,
            onTabChange: (index) {
              context.read<NavScreenCubit>().changeIndex(index);
            },
            backgroundColor: Colors.white,
            activeColor: ColorsManager.primary,
            duration: 100.milliseconds,
            padding: EdgeInsets.all(14.sp),
            tabBackgroundColor: ColorsManager.primary.withValues(alpha: .1),
            tabs: [
              GButton(icon: Iconsax.home, text: 'Home'),
              GButton(icon: Iconsax.bag_2_copy, text: 'Cart'),
              GButton(icon: Iconsax.heart_copy, text: 'Wishlist'),
              GButton(icon: Iconsax.user, text: 'Profile'),
            ],
          ),
        );
      },
    );
  }
}
