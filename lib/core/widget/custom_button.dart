import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/constants/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.buttonTitle, this.onPressed});
  final String buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.blue,
        minimumSize: Size(double.infinity, 56.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
      child: Text(
        buttonTitle,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          fontFamily: AppFonts.poppins,
          color: AppColors.whiteColor,
        ),
      ),
    );
  }
}
