import 'package:dartz/dartz.dart';
import 'package:devsolutions_task/core/usecase/base_usecase.dart';

import '../../../../core/error/failures.dart';
import '../entities/product_entity.dart';
import '../repositories/home_base_repo.dart';

class GetAllProductsUseCase
    extends BaseUseCase<List<ProductEntity>, NoParameters> {
  final HomeBaseRepo homeBaseRepo;

  GetAllProductsUseCase({required this.homeBaseRepo});

  @override
  Future<Either<Failure, List<ProductEntity>>> call(NoParameters params) =>
      homeBaseRepo.getAllProducts();
}
