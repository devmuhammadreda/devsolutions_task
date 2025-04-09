import 'package:devsolutions_task/features/home/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'nav_screen_state.dart';

class NavScreenCubit extends Cubit<NavScreenState> {
  NavScreenCubit() : super(NavScreenInitial());

  int index = 0;

  void changeIndex(int newIndex) {
    index = newIndex;
    emit(OnChangeTapIndex());
  }

  List<Widget> screens = [HomeScreen(), Scaffold(), Scaffold(), Scaffold()];
}
