import 'dart:developer';

import 'package:dartz/dartz.dart';
import '../../../home/domain/entities/product_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../../domain/usecases/add_to_favorites_use_case.dart';
import '../../domain/usecases/get_favorites_use_case.dart';
import '../../domain/usecases/is_product_in_favorites_use_case.dart';
import '../../domain/usecases/remove_from_favorites_use_case.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit({
    required this.addToFavoritesUseCase,
    required this.removeFromFavoritesUseCase,
    required this.getFavoritesUseCase,
    required this.isFavoriteUseCase,
  }) : super(FavoritesInitial());
  AddToFavoritesUseCase addToFavoritesUseCase;
  RemoveFromFavoritesUseCase removeFromFavoritesUseCase;
  GetFavoritesUseCase getFavoritesUseCase;
  IsProductInFavoritesUseCase isFavoriteUseCase;
  List<ProductEntity> favorites = [];

  Future<void> addToFavorites(ProductEntity product) async {
    emit(AddToFavoritesLoading());
    Either<Failure, Unit> result = await addToFavoritesUseCase.call(product);
    result.fold(
      (failure) => emit(AddToFavoritesError(failure.message)),
      (success) => emit(
        AddToFavoritesLoaded(
          "Product added to favorites successfully",
          product.id!,
        ),
      ),
    );
  }

  Future<void> removeFromFavorites(int? id) async {
    emit(RemoveFromFavoritesLoading());
    Either<Failure, Unit> result = await removeFromFavoritesUseCase.call(id);
    result.fold(
      (failure) => emit(RemoveFromFavoritesError(failure.message)),
      (success) => emit(
        RemoveFromFavoritesLoaded("Product removed from favorites", id!),
      ),
    );
  }

  Future<void> getFavorites() async {
    emit(GetFavoritesLoading());
    Either<Failure, List<ProductEntity>> result = await getFavoritesUseCase
        .call(NoParameters());
    result.fold((failure) => emit(GetFavoritesError(failure.message)), (
      success,
    ) {
      favorites = success;
      log("Favorites: $favorites");
      emit(GetFavoritesLoaded(favorites));
    });
  }

  Future<bool> isProductInFavorites(int? id) async {
    emit(IsFavoriteLoading());
    Either<Failure, bool> result = await isFavoriteUseCase.call(id);
    return result.fold((failure) => false, (isFavorite) {
      emit(IsFavoriteLoaded(isFavorite));
      return isFavorite;
    });
  }
}
