import 'data/datasources/home_data_sources.dart';
import 'data/repositories/home_repo.dart';
import 'domain/repositories/home_base_repo.dart';
import 'presentation/cubit/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injection_container.dart';
import 'domain/usecases/get_all_products_use_case.dart';
import 'presentation/cubit/products/products_cubit.dart';

void initHomeInjection() {
  sl.registerFactory(() => HomeCubit());
  sl.registerFactory(() => ProductsCubit(sl()));

  sl.registerLazySingleton(() => GetAllProductsUseCase(homeBaseRepo: sl()));

  sl.registerLazySingleton<HomeBaseRepo>(() => HomeRepo(sl()));

  sl.registerLazySingleton<HomeDataBaseSources>(
    () => HomeDataSources(helper: sl()),
  );
}

List<BlocProvider<Cubit<Object>>> homeCubits() => <BlocProvider<Cubit<Object>>>[
  BlocProvider<HomeCubit>(create: (_) => sl<HomeCubit>()),
  BlocProvider<ProductsCubit>(
    create: (_) => sl<ProductsCubit>()..getAllProducts(),
  ),
];
