import '../../../../core/widgets/custom_error_widget.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../cubit/favorites_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/empty_widget.dart';
import '../../../home/presentation/widgets/product_widget.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoritesCubit, FavoritesState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = context.read<FavoritesCubit>();
        if (state is GetFavoritesLoading) {
          return LoadingWidget();
        }
        if (state is GetFavoritesError) {
          return CustomErrorWidget(
            error: state.message,
            onPressed: () async {
              await cubit.getFavorites();
            },
          );
        }
        if (cubit.favorites.isEmpty) {
          return EmptyWidget(msg: 'No favorites yet');
        }
        return RefreshIndicator(
          onRefresh: () async {
            await cubit.getFavorites();
          },
          child: GridView.builder(
            itemCount: cubit.favorites.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            padding: EdgeInsets.all(20.sp),
            itemBuilder: (context, index) {
              final product = cubit.favorites[index];
              return ProductWidget(
                product: product,
                heroTag: 'favorite_${product.id}',
              );
            },
          ),
        );
      },
    );
  }
}
