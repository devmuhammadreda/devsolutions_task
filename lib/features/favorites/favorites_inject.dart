import '../../injection_container.dart';
import 'data/datasources/favorites_data_source.dart';
import 'data/repositories/favorites_repo.dart';
import 'domain/repositories/favorites_base_repo.dart';
import 'domain/usecases/add_to_favorites_use_case.dart';
import 'domain/usecases/get_favorites_use_case.dart';
import 'domain/usecases/is_product_in_favorites_use_case.dart';
import 'domain/usecases/remove_from_favorites_use_case.dart';
import 'presentation/cubit/favorites_cubit.dart';

void initFavoritesInjection() {
  sl.registerFactory(
    () => FavoritesCubit(
      addToFavoritesUseCase: sl(),
      removeFromFavoritesUseCase: sl(),
      getFavoritesUseCase: sl(),
      isFavoriteUseCase: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => AddToFavoritesUseCase(favoritesBaseRepo: sl()),
  );
  sl.registerLazySingleton(() => GetFavoritesUseCase(favoritesBaseRepo: sl()));
  sl.registerLazySingleton(
    () => IsProductInFavoritesUseCase(favoritesBaseRepo: sl()),
  );
  sl.registerLazySingleton(
    () => RemoveFromFavoritesUseCase(favoritesBaseRepo: sl()),
  );

  sl.registerLazySingleton<FavoritesBaseRepo>(
    () => FavoritesRepo(favoritesDataSource: sl()),
  );

  sl.registerLazySingleton<FavoritesDataSource>(
    () => FavoritesDataSourceImpl(hiveService: sl()),
  );
}
