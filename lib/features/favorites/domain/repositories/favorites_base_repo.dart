import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../home/domain/entities/product_entity.dart';

abstract class FavoritesBaseRepo {
  Future<Either<Failure, Unit>> addToFavorites(ProductEntity product);
  Future<Either<Failure, Unit>> removeFromFavorites(int? id);
  Future<Either<Failure, List<ProductEntity>>> getFavorites();
  Future<Either<Failure, bool>> isProductInFavorites(int? id);
}

