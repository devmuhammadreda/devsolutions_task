import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../repositories/favorites_base_repo.dart';

class RemoveFromFavoritesUseCase extends BaseUseCase<Unit, int?> {
  final FavoritesBaseRepo favoritesBaseRepo;

  RemoveFromFavoritesUseCase({required this.favoritesBaseRepo});

  @override
  Future<Either<Failure, Unit>> call(int? params) =>
      favoritesBaseRepo.removeFromFavorites(params);
}
