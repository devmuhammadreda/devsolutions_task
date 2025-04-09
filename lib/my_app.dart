// ignore_for_file: public_member_api_docs, sort_constructors_first, depend_on_referenced_packages
import 'package:bot_toast/bot_toast.dart';
import 'package:devsolutions_task/core/extensions/build_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/theme/size_config.dart';
import 'core/theme/theme_manager.dart';
import 'core/utils/router.dart';
import 'features/onboarding/presentation/pages/onboarding_screen.dart';
import 'injection_container.dart';
import 'l10n/messages.dart';
import 'l10n/messages.dart' as common_messages;

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final botToastBuilder = BotToastInit();
    return MultiBlocProvider(
      providers: appProviders(),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        splitScreenMode: true,
        builder: (context, child) {
          SizeConfig().init(context);
          return MaterialApp(
            navigatorObservers: [BotToastNavigatorObserver()],
            onGenerateTitle: (context) => context.translate.appName,
            debugShowCheckedModeBanner: false,
            theme: ThemeManager.appTheme,
            navigatorKey: navigatorKey,
            onGenerateRoute: onGenerateRoute,
            themeMode: ThemeMode.light,
            locale: Locale("en", "US"),
            localizationsDelegates: const [
              ...S.localizationsDelegates,
              common_messages.S.delegate,
            ],
            supportedLocales: S.supportedLocales,
            home: OnboardingScreen(),
            builder: (context, child) {
              child = botToastBuilder(context, child!);
              return child;
            },
          );
        },
      ),
    );
  }
}
