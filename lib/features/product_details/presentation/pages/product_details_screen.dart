// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:bot_toast/bot_toast.dart';
import 'package:devsolutions_task/core/theme/text_styles.dart';
import 'package:devsolutions_task/core/utils/router.dart';
import 'package:devsolutions_task/core/widgets/app_spacer.dart';
import 'package:devsolutions_task/core/widgets/progress_button.dart';
import 'package:flutter/material.dart';

import 'package:devsolutions_task/core/extensions/build_context.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/colors_manager.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../core/widgets/network_image.dart';
import '../../../../gen/assets.gen.dart';
import '../../../checkout/presentation/pages/checkout_screen.dart';
import '../../../favorites/presentation/cubit/favorites_cubit.dart';
import '../../../home/domain/entities/product_entity.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({
    super.key,
    required this.product,
    required this.heroTag,
  });
  final ProductEntity product;
  final String heroTag;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
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
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(ColorsManager.lightGrey),
          ),
        ),
        actions: [
          BlocConsumer<FavoritesCubit, FavoritesState>(
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
              return IconButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    ColorsManager.lightGrey,
                  ),
                ),
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
                          size: 20.sp,
                        )
                        : Assets.icons.heart.svg(
                          height: 20.sp,
                          width: 20.sp,
                          colorFilter: ColorFilter.mode(
                            ColorsManager.primary,
                            BlendMode.srcIn,
                          ),
                        ),
              );
            },
          ),
          AppSpacer(widthRatio: .5),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share),
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(ColorsManager.lightGrey),
            ),
          ),
          AppSpacer(widthRatio: .5),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: widget.heroTag,
              transitionOnUserGestures: true,
              child: MainNetworkImage(
                imageUrl: widget.product.image ?? '',
                width: context.screenWidth,
                fit: BoxFit.contain,
                height: context.screenHeight * 0.4,
              ),
            ),
            AppSpacer(heightRatio: .5),
            Text(
              widget.product.title ?? '',
              style: TextStyles.semiBold20.copyWith(
                color: ColorsManager.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            AppSpacer(heightRatio: .5),
            Text(
              "(${widget.product.category ?? ''})",
              style: TextStyles.medium16.copyWith(
                color: ColorsManager.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            AppSpacer(heightRatio: .5),
            Text(
              widget.product.description ?? '',
              style: TextStyles.regular14.copyWith(
                color: ColorsManager.black,
                fontWeight: FontWeight.w400,
              ),
            ),
            AppSpacer(heightRatio: .5),
            RichText(
              text: TextSpan(
                text: "\$ ${widget.product.price.toString()}",
                style: TextStyles.semiBold20.copyWith(
                  color: ColorsManager.primary,
                  fontWeight: FontWeight.w600,
                ),
                children: [
                  TextSpan(
                    text: " | Including taxes and duties",
                    style: TextStyles.medium12.copyWith(
                      color: ColorsManager.grey,
                    ),
                  ),
                ],
              ),
            ),
            AppSpacer(heightRatio: .5),
            Row(
              children: [
                const Icon(Icons.star, color: ColorsManager.star, size: 20),
                AppSpacer(widthRatio: .5),
                Text(
                  widget.product.rating?.rate.toString() ?? '',
                  style: TextStyles.semiBold18.copyWith(
                    color: ColorsManager.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "(${widget.product.rating?.count.toString() ?? ''})",
                  style: TextStyles.medium12.copyWith(
                    color: ColorsManager.grey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            AppSpacer(),
            Divider(
              color: ColorsManager.grey.withValues(alpha: .4),
              thickness: 1,
            ),
            AppSpacer(),
            AppProgressButton(
              onPressed: (anim) {},
              text: "Add to cart",
              backgroundColor: ColorsManager.subPrimary,
            ),
            AppSpacer(),
            AppProgressButton(
              onPressed: (anim) {
                MagicRouter.navigateTo(
                  CheckoutScreen(
                    product: widget.product,
                    heroTag: widget.heroTag,
                  ),
                );
              },
              text: "Buy Now",
            ),
          ],
        ),
      ),
    );
  }
}
