import '../../../../core/extensions/build_context.dart';
import '../../../../core/theme/colors_manager.dart';
import '../../../../core/utils/router.dart';
import '../../../../core/widgets/app_spacer.dart';
import '../../../../core/widgets/progress_button.dart';
import '../../../../gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../nav_screen/presentation/pages/nav_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: context.screenWidth,
        height: context.screenHeight,
        padding: EdgeInsets.all(20.sp),
        decoration: BoxDecoration(gradient: ColorsManager.onboardingGradient),
        child: Column(
          children: [
            AppSpacer(),
            Expanded(child: Assets.images.authImage.image()),
            AppSpacer(),
            AppProgressButton(
              onPressed: (anim) {},
              text: "LOG IN",
              backgroundColor: Colors.white,
              textColor: ColorsManager.primary,
            ),
            AppSpacer(),
            AppProgressButton(
              onPressed: (anim) {
                MagicRouter.navigateTo(NavScreen());
              },
              text: "SKIP",
              isOutlined: true,
              borderColor: Colors.transparent,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
