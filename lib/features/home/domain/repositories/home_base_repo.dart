import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/product_entity.dart';

abstract class HomeBaseRepo {
  Future<Either<Failure, List<ProductEntity>>> getAllProducts();
}
