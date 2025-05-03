
import 'package:e_commerce/core/widget/custom_category_or_brand.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Category extends StatelessWidget {
  const Category({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 20,
        itemBuilder:
            (context, index) =>
                CustomCategoryOrBrand(name: 'Pampers'),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 10.h,
          childAspectRatio: 0.7,
        ),
      ),
    );
  }
}
