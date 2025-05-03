
import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/constants/app_fonts.dart';
import 'package:e_commerce/core/widget/custom_circle_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBarAuthcation extends StatelessWidget {
  const CustomAppBarAuthcation({super.key, this.title});
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: CustomCircleAvatar(
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back_ios_new_outlined, size: 28.sp),
            ),
          ),
        ),
        SizedBox(width: 10.w),
        Text(
          title ?? '',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            fontFamily: AppFonts.poppins,
            color: AppColors.textColor,
          ),
        ),
      ],
    );
  }
}
