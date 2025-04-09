part of 'favorites_cubit.dart';

abstract class FavoritesState {}

class FavoritesInitial extends FavoritesState {}

class GetFavoritesLoading extends FavoritesState {}

class GetFavoritesLoaded extends FavoritesState {
  final List<ProductEntity> favorites;

  GetFavoritesLoaded(this.favorites);
}

class GetFavoritesError extends FavoritesState {
  final String message;

  GetFavoritesError(this.message);
}

class AddToFavoritesLoading extends FavoritesState {}

class AddToFavoritesLoaded extends FavoritesState {
  final String msg;
  final int id;
  AddToFavoritesLoaded(this.msg , this.id);
}

class AddToFavoritesError extends FavoritesState {
  final String message;

  AddToFavoritesError(this.message);
}

class RemoveFromFavoritesLoading extends FavoritesState {}

class RemoveFromFavoritesLoaded extends FavoritesState {
  final String msg;
  final int id;
  RemoveFromFavoritesLoaded(this.msg , this.id);
}

class RemoveFromFavoritesError extends FavoritesState {
  final String message;

  RemoveFromFavoritesError(this.message);
}

class IsFavoriteLoading extends FavoritesState {}

class IsFavoriteLoaded extends FavoritesState {
  final bool isFavorite;

  IsFavoriteLoaded(this.isFavorite);
}

class IsFavoriteError extends FavoritesState {
  final String message;

  IsFavoriteError(this.message);
}
