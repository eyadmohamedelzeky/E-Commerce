
import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    super.key,
    this.child
  });
final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.blue, width: 1.w),
      ),
      child: CircleAvatar(
        backgroundColor: AppColors.whiteColor,
        radius: 25.r,
        child: child,
      ),
    );
  }
}
