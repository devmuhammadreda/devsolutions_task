import 'package:dartz/dartz.dart';

import '../../../../core/services/hive_service.dart';
import '../../../home/domain/entities/product_entity.dart';

abstract class FavoritesDataSource {
  Future<Unit> addToFavorites(ProductEntity product);
  Future<Unit> removeFromFavorites(int? productId);
  Future<List<ProductEntity>> getFavoriteProducts();
  Future<bool> isFavorite(int? productId);
}

class FavoritesDataSourceImpl implements FavoritesDataSource {
  static const String _favoritesBox = 'favorites';
  final HiveService hiveService;
  FavoritesDataSourceImpl({required this.hiveService});

  @override
  Future<Unit> addToFavorites(ProductEntity product) async {
    try {
      final updatedProduct = product.copyWith(isFavorite: true);
      await hiveService.add(
        _favoritesBox,
        product.id.toString(),
        updatedProduct,
      );
      return unit;
    } catch (e) {
      throw Exception('Failed to add to favorites: $e');
    }
  }

  @override
  Future<Unit> removeFromFavorites(int? productId) async {
    try {
      await hiveService.remove(_favoritesBox, productId.toString());
      return unit;
    } catch (e) {
      throw Exception('Failed to remove from favorites: $e');
    }
  }

  @override
  Future<List<ProductEntity>> getFavoriteProducts() async {
    try {
      return await hiveService.getAll<ProductEntity>(_favoritesBox);
    } catch (e) {
      throw Exception('Failed to fetch favorite products: $e');
    }
  }

  @override
  Future<bool> isFavorite(int? productId) async {
    if (productId == null) return false;
    try {
      final product = await hiveService.get<ProductEntity>(
        _favoritesBox,
        productId.toString(),
      );
      return product?.isFavorite ?? false;
    } catch (e) {
      throw Exception('Failed to check favorite status: $e');
    }
  }
}
