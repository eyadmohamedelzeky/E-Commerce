
import 'package:e_commerce/core/constants/app_images.dart';
import 'package:e_commerce/core/extensions/spacing_extension.dart';
import 'package:e_commerce/core/widget/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestForYou extends StatelessWidget {
  const BestForYou({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder:
            (context, index) => ProductCard(
              isHaveButton: true,
              image: AppImages.splash,
              price: '500 LE',
              productName: 'Best For You',
              rating: '4.5',
              offerTitle: '15% OFF',
            ),
        separatorBuilder: (context, index) => 5.pw,
        itemCount: 5,
      ),
    );
  }
}
