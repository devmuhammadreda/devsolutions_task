import '../../../../core/extensions/build_context.dart';
import '../../../../core/widgets/app_spacer.dart';
import '../../../../core/widgets/custom_error_widget.dart';
import '../cubit/products/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/product_entity.dart';
import 'product_widget.dart';
import 'products_shimmer_listview.dart';

class HotSalesWidget extends StatelessWidget {
  const HotSalesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      buildWhen:
          (previous, current) =>
              current is ProductsLoading ||
              current is ProductsLoaded ||
              current is ProductsError,
      builder: (context, state) {
        if (state is ProductsLoading) {
          return ProductsShimmerListView();
        }
        if (state is ProductsError) {
          return CustomErrorWidget(error: state.message);
        }
        if (state is ProductsLoaded) {
          List<ProductEntity>? products = state.products;
          if (products != null && products.isNotEmpty) {
            return SizedBox(
              height: 170.sp,
              width: context.screenWidth,
              child: ListView.separated(
                itemCount: products.length,
                scrollDirection: Axis.horizontal,
                separatorBuilder:
                    (context, index) => AppSpacer(widthRatio: 0.5),
                itemBuilder: (context, index) {
                  ProductEntity product = products[index];
                  return ProductWidget(product: product , heroTag: "HotSales_${product.id}");
                },
              ),
            );
          }
        }
        return SizedBox.shrink();
      },
    );
  }
}
