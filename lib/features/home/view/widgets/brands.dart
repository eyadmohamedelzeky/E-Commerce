import 'package:e_commerce/core/extensions/spacing_extension.dart';
import 'package:e_commerce/core/widget/custom_category_or_brand.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Brands extends StatelessWidget {
  const Brands({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.h,
      child: ListView.separated(
        separatorBuilder: (context, index) => 5.pw,
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) => CustomCategoryOrBrand(),
      ),
    );
  }
}
