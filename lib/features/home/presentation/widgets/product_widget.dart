// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
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

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    required this.product,
    required this.heroTag,
  });
  final ProductEntity product;
  final String heroTag;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        MagicRouter.navigateTo(
          ProductDetailsScreen(product: product, heroTag: heroTag),
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
                    tag: heroTag,
                    transitionOnUserGestures: true,
                    child: MainNetworkImage(
                      imageUrl: product.image ?? '',
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
                            product.title ?? '',
                            maxLines: 1,
                            style: TextStyles.medium10,
                          ),
                        ),
                        AppSpacer(heightRatio: 0.1),
                        Flexible(
                          flex: 2,
                          child: Text(
                            product.description ?? '',
                            maxLines: 2,
                            style: TextStyles.medium10,
                          ),
                        ),
                        AppSpacer(heightRatio: 0.1),
                        Flexible(
                          child: Text(
                            "\$ ${product.price.toString()}",
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
              onPressed: () {},
              icon: Assets.icons.heart.svg(
                colorFilter: ColorFilter.mode(
                  ColorsManager.primary,
                  BlendMode.srcIn,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(ColorsManager.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
