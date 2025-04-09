// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:devsolutions_task/core/theme/text_styles.dart';
import 'package:devsolutions_task/core/widgets/app_spacer.dart';
import 'package:devsolutions_task/core/widgets/progress_button.dart';
import 'package:flutter/material.dart';

import 'package:devsolutions_task/core/extensions/build_context.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/colors_manager.dart';
import '../../../../core/widgets/network_image.dart';
import '../../../home/domain/entities/product_entity.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({
    super.key,
    required this.product,
    required this.heroTag,
  });
  final ProductEntity product;
  final String heroTag;

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
          IconButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(ColorsManager.lightGrey),
            ),
            onPressed: () {},
            icon: const Icon(Icons.favorite_border),
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
              tag: heroTag,
              transitionOnUserGestures: true,
              child: MainNetworkImage(
                imageUrl: product.image ?? '',
                width: context.screenWidth,
                fit: BoxFit.contain,
                height: context.screenHeight * 0.4,
              ),
            ),
            AppSpacer(heightRatio: .5),
            Text(
              product.title ?? '',
              style: TextStyles.semiBold20.copyWith(
                color: ColorsManager.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            AppSpacer(heightRatio: .5),
            Text(
              "(${product.category ?? ''})",
              style: TextStyles.medium16.copyWith(
                color: ColorsManager.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            AppSpacer(heightRatio: .5),
            Text(
              product.description ?? '',
              style: TextStyles.regular14.copyWith(
                color: ColorsManager.black,
                fontWeight: FontWeight.w400,
              ),
            ),
            AppSpacer(heightRatio: .5),
            RichText(
              text: TextSpan(
                text: "\$ ${product.price.toString()}",
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
                  product.rating?.rate.toString() ?? '',
                  style: TextStyles.semiBold18.copyWith(
                    color: ColorsManager.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "(${product.rating?.count.toString() ?? ''})",
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
            AppProgressButton(onPressed: (anim) {}, text: "Buy Now"),
          ],
        ),
      ),
    );
  }
}
