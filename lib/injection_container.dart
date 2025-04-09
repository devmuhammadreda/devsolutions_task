import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'core/services/hive_service.dart';
import 'core/services/network_service.dart/api_basehelper.dart';
import 'features/favorites/favorites_inject.dart';
import 'features/favorites/presentation/cubit/favorites_cubit.dart';
import 'features/home/home_inject.dart';
import 'features/nav_screen/nav_screen_inject.dart';

final GetIt sl = GetIt.instance;

abstract class ServiceLocator {
  static Future<void> init() async {
    sl.allowReassignment = true;
    initNavScreenInjection();
    initHomeInjection();
    _injectDioHelper();
    _injectHiveService();
    initFavoritesInjection();
  }
}

void _injectDioHelper() {
  final ApiBaseHelper helper = ApiBaseHelper();
  sl.registerLazySingleton<ApiBaseHelper>(() => helper);
}

ApiBaseHelper get dioHelper => sl<ApiBaseHelper>();
void _injectHiveService() {
  final HiveService hiveService = HiveService();
  sl.registerFactory<HiveService>(() => hiveService);
}

HiveService get hiveService => sl<HiveService>();
List<BlocProvider<Cubit<Object>>> appProviders() =>
    <BlocProvider<Cubit<Object>>>[
      BlocProvider<FavoritesCubit>(
        create: (_) => sl<FavoritesCubit>()..getFavorites(),
      ),
    ];
