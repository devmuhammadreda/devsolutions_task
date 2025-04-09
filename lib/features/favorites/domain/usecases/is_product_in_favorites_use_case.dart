import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../repositories/favorites_base_repo.dart';
class IsProductInFavoritesUseCase extends BaseUseCase<bool, int?> {
  final FavoritesBaseRepo favoritesBaseRepo;

  IsProductInFavoritesUseCase({required this.favoritesBaseRepo});

  @override
  Future<Either<Failure, bool>> call(int? params) =>
      favoritesBaseRepo.isProductInFavorites(params);
}
