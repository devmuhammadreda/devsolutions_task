import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

import '../../../home/domain/entities/product_entity.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/repositories/favorites_base_repo.dart';
import '../datasources/favorites_data_source.dart';

class FavoritesRepo extends FavoritesBaseRepo {
  final FavoritesDataSource favoritesDataSource;
  FavoritesRepo({required this.favoritesDataSource});

  @override
  Future<Either<Failure, Unit>> addToFavorites(ProductEntity product) async {
    try {
      return right(await favoritesDataSource.addToFavorites(product));
    } on CacheException catch (error) {
      return left(CacheFailure.formCacheException(error));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getFavorites() async {
    try {
      return right(await favoritesDataSource.getFavoriteProducts());
    } on CacheException catch (error) {
      return left(CacheFailure.formCacheException(error));
    }
  }

  @override
  Future<Either<Failure, bool>> isProductInFavorites(int? id) async {
    if (id == null) return right(false);
    try {
      return right(await favoritesDataSource.isFavorite(id));
    } on CacheException catch (error) {
      return left(CacheFailure.formCacheException(error));
    }
  }

  @override
  Future<Either<Failure, Unit>> removeFromFavorites(int? id) async {
    if (id == null) return right(unit);
    try {
      return right(await favoritesDataSource.removeFromFavorites(id));
    } on CacheException catch (error) {
      return left(CacheFailure.formCacheException(error));
    }
  }
}
