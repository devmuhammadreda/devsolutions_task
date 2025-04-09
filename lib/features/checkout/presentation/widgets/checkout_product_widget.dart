import 'package:devsolutions_task/core/widgets/app_spacer.dart';
import 'package:devsolutions_task/core/widgets/network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/colors_manager.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../home/domain/entities/product_entity.dart';

class CheckoutProductWidget extends StatelessWidget {
  const CheckoutProductWidget({
    super.key,
    required this.product,
    required this.heroTag,
  });
  final ProductEntity product;
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Hero(
          tag: heroTag,
          child: MainNetworkImage(
            imageUrl: product.image ?? "",
            width: 88.sp,
            height: 88.sp,
            fit: BoxFit.cover,
          ),
        ),
        AppSpacer(),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.title ?? '',
                style: TextStyles.semiBold16.copyWith(
                  color: ColorsManager.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              AppSpacer(heightRatio: .5),
              RichText(
                text: TextSpan(
                  text: "\$ ${product.price.toString()}",
                  style: TextStyles.semiBold16.copyWith(
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
            ],
          ),
        ),
      ],
    );
  }
}
