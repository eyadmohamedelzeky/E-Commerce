
import 'package:e_commerce/core/constants/app_images.dart';
import 'package:e_commerce/core/extensions/spacing_extension.dart';
import 'package:e_commerce/core/widget/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder:
            (context, index) => ProductCard(
              isHaveButton: false,
              image: AppImages.onboardingTwo,
              price: '500 LE',
              productName: 'Popular Product',
              rating: '4.5',
              offerTitle: '15% OFF',
            ),
        separatorBuilder: (context, index) => 5.pw,
        itemCount: 5,
      ),
    );
  }
}
