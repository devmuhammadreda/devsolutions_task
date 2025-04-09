import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../cubit/nav_screen_cubit.dart';
import '../widgets/bottom_nav_widget.dart';
import '../widgets/nav_app_bar_widget.dart';

class NavScreen extends StatelessWidget {
  const NavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavScreenCubit>(
      create: (context) => sl<NavScreenCubit>(),
      child: BlocBuilder<NavScreenCubit, NavScreenState>(
        builder: (context, state) {
          return Scaffold(
            bottomNavigationBar: BottomNavWidget(),
            appBar: NavAppBarWidget(),
            body:
                context.read<NavScreenCubit>().screens[context
                    .read<NavScreenCubit>()
                    .index],
          );
        },
      ),
    );
  }
}
