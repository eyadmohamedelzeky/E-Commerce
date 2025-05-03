
import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/extensions/spacing_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key, required this.title,
  });
final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 60.w,
          padding: EdgeInsets.all(3.w),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.blue, width: 2.w),
          ),
          child: CircleAvatar(
            radius: 20.r,
            child: Icon(Icons.person),
          ),
        ),
        5.pw,
        Text(
          'Hi $title !',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20.sp,
            color: AppColors.primaryColor,
          ),
        ),
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.notifications_none,
            color: AppColors.blue,
            size: 40.sp,
          ),
        ),
      ],
    );
  }
}
