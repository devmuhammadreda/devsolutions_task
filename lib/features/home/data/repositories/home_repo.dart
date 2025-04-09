import 'package:dartz/dartz.dart';
import 'package:devsolutions_task/core/error/exceptions.dart';
import 'package:devsolutions_task/core/error/failures.dart';
import 'package:devsolutions_task/features/home/domain/entities/product_entity.dart';
import 'package:devsolutions_task/features/home/domain/repositories/home_base_repo.dart';

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
