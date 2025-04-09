// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:bot_toast/bot_toast.dart';
import 'package:devsolutions_task/core/widgets/loading_widget.dart';
import 'package:devsolutions_task/features/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:devsolutions_task/core/extensions/build_context.dart';
import 'package:devsolutions_task/core/theme/colors_manager.dart';
import 'package:devsolutions_task/core/theme/text_styles.dart';
import 'package:devsolutions_task/core/utils/router.dart';
import 'package:devsolutions_task/core/widgets/app_spacer.dart';
import 'package:devsolutions_task/gen/assets.gen.dart';

import '../../../../core/widgets/network_image.dart';
import '../../../product_details/presentation/pages/product_details_screen.dart';
import '../../domain/entities/product_entity.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({
    super.key,
    required this.product,
    required this.heroTag,
  });
  final ProductEntity product;
  final String heroTag;

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _checkFavoriteStatus();
  }

  Future<void> _checkFavoriteStatus() async {
    final favoritesCubit = context.read<FavoritesCubit>();
    try {
      final isFav = await favoritesCubit.isProductInFavorites(
        widget.product.id,
      );
      if (mounted) {
        setState(() {
          _isFavorite = isFav;
        });
      }
    } catch (e) {
      log('Error checking favorite status: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoritesCubit, FavoritesState>(
      listener: (context, state) async {
        final favoritesCubit = context.read<FavoritesCubit>();

        if (state is AddToFavoritesLoading) {
          showLoading();
        }
        if (state is AddToFavoritesLoaded) {
          if (state.id == widget.product.id) {
            await _checkFavoriteStatus();
          }
          hideLoading();
          BotToast.showText(text: state.msg);
          favoritesCubit.getFavorites();
        }
        if (state is AddToFavoritesError) {
          hideLoading();
          BotToast.showText(text: state.message);
        }
        if (state is RemoveFromFavoritesLoading) {
          showLoading();
        }
        if (state is RemoveFromFavoritesLoaded) {
          if (state.id == widget.product.id) {
            await _checkFavoriteStatus();
          }

          hideLoading();
          BotToast.showText(text: state.msg);
          favoritesCubit.getFavorites();
        }
        if (state is RemoveFromFavoritesError) {
          hideLoading();
          BotToast.showText(text: state.message);
        }
      },
      builder: (context, state) {
        final favoritesCubit = context.read<FavoritesCubit>();

        return GestureDetector(
          onTap: () {
            MagicRouter.navigateTo(
              ProductDetailsScreen(
                product: widget.product,
                heroTag: widget.heroTag,
              ),
            );
          },
          child: Container(
            width: context.screenWidth / 2.8,
            decoration: BoxDecoration(
              color: ColorsManager.lightGrey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      flex: 6,
                      child: Hero(
                        tag: widget.heroTag,
                        transitionOnUserGestures: true,
                        child: MainNetworkImage(
                          imageUrl: widget.product.image ?? '',
                          width: context.screenWidth,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppSpacer(heightRatio: 0.1),
                            Flexible(
                              child: Text(
                                widget.product.title ?? '',
                                maxLines: 1,
                                style: TextStyles.medium10,
                              ),
                            ),
                            AppSpacer(heightRatio: 0.1),
                            Flexible(
                              flex: 2,
                              child: Text(
                                widget.product.description ?? '',
                                maxLines: 2,
                                style: TextStyles.medium10,
                              ),
                            ),
                            AppSpacer(heightRatio: 0.1),
                            Flexible(
                              child: Text(
                                "\$ ${widget.product.price.toString()}",
                                style: TextStyles.semiBold12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    if (_isFavorite) {
                      favoritesCubit.removeFromFavorites(widget.product.id);
                    } else {
                      favoritesCubit.addToFavorites(widget.product);
                    }
                  },
                  icon:
                      _isFavorite == true
                          ? Icon(
                            Icons.favorite,
                            color: ColorsManager.primary,
                            size: 15.sp,
                          )
                          : Assets.icons.heart.svg(
                            colorFilter: ColorFilter.mode(
                              ColorsManager.primary,
                              BlendMode.srcIn,
                            ),
                          ),
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      ColorsManager.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
