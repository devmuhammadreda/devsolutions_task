import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/services/bloc_observer.dart';
import 'core/services/get_storage_helper.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  if (kDebugMode) {
    log(CacheHelper.getUserToken.toString());
  }
  runApp(MyApp());
}
