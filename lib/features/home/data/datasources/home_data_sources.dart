import '../../../../core/global/api_keys.dart';

import '../../../../core/services/network_service.dart/api_basehelper.dart';
import '../../domain/entities/product_entity.dart';
import '../models/products_model.dart';

abstract class HomeDataBaseSources {
  Future<List<ProductEntity>> getHomeData();
}

class HomeDataSources extends HomeDataBaseSources {
  final ApiBaseHelper helper;
  HomeDataSources({required this.helper});

  @override
  Future<List<ProductEntity>> getHomeData() async {
    final response = await helper.request(
      method: HttpMethod.get,
      url: APIKeys.getProducts,
    );

    try {
      final List<dynamic> data = response as List<dynamic>;

      return data
          .map(
            (product) =>
                ProductsModel.fromJson(
                  product as Map<String, dynamic>,
                ).toEntity(),
          )
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
