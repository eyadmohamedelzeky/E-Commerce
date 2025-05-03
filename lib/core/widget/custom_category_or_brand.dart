import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/constants/app_fonts.dart';
import 'package:e_commerce/core/constants/app_images.dart';
import 'package:e_commerce/core/extensions/spacing_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCategoryOrBrand extends StatelessWidget {
  const CustomCategoryOrBrand({super.key, this.name});
final String ?name;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 170.w,
          height: 120.h,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.lightBlueColor.withOpacity(0.5),
              width: 1.w,
            ),
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Image.asset(AppImages.onboardingOne),
        ),
        5.ph,
      if(name != null)  Text(
          name!,
          style: TextStyle(
            color: AppColors.blackColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            fontFamily: AppFonts.poppins,
          ),
        ),
      ],
    );
  }
}
