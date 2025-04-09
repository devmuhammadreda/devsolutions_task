import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../../../home/domain/entities/product_entity.dart';
import '../repositories/favorites_base_repo.dart';

class AddToFavoritesUseCase extends BaseUseCase<Unit, ProductEntity> {
  final FavoritesBaseRepo favoritesBaseRepo;

  AddToFavoritesUseCase({required this.favoritesBaseRepo});

  @override
  Future<Either<Failure, Unit>> call(ProductEntity params) =>
      favoritesBaseRepo.addToFavorites(params);
}
