import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../../../home/domain/entities/product_entity.dart';
import '../repositories/favorites_base_repo.dart';

class GetFavoritesUseCase
    extends BaseUseCase<List<ProductEntity>, NoParameters> {
  final FavoritesBaseRepo favoritesBaseRepo;

  GetFavoritesUseCase({required this.favoritesBaseRepo});

  @override
  Future<Either<Failure, List<ProductEntity>>> call(NoParameters params) =>
      favoritesBaseRepo.getFavorites();
}
