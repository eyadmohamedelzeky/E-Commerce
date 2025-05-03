import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/constants/app_fonts.dart';
import 'package:e_commerce/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTitleForView extends StatelessWidget {
  const CustomTitleForView({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,

            fontSize: 20.sp,
            fontFamily: AppFonts.poppins,
          ),
        ),
        Spacer(),
        InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRoutes.viewAll,
              arguments: {'title': title},
            );
          },
          child: Text(
            'View All',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
              color: AppColors.blue,
              fontFamily: AppFonts.poppins,
            ),
          ),
        ),
      ],
    );
  }
}
