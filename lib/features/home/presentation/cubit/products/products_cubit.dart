import 'package:dartz/dartz.dart';
import 'package:devsolutions_task/features/home/domain/entities/product_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecase/base_usecase.dart';
import '../../../domain/usecases/get_all_products_use_case.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.getAllProductsUseCase) : super(ProductsInitial());

  GetAllProductsUseCase getAllProductsUseCase;

  Future<void> getAllProducts() async {
    emit(ProductsLoading());
    Either<Failure, List<ProductEntity>> result = await getAllProductsUseCase
        .call(NoParameters());
    result.fold(
      (failure) => emit(ProductsError(failure.message)),
      (products) => emit(ProductsLoaded(products)),
    );
  }
}
