import 'package:dartz/dartz.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/repositories/home_base_repo.dart';

import '../datasources/home_data_sources.dart';

class HomeRepo extends HomeBaseRepo {
  HomeDataBaseSources dataBaseSources;
  HomeRepo(this.dataBaseSources);

  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProducts() async {
    try {
      return right(await dataBaseSources.getHomeData());
    } on ServerException catch (error) {
      return left(ServerFailure.formServerException(error));
    }
  }
}
