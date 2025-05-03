import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/widget/custom_circle_avatar.dart';
import 'package:e_commerce/features/home/controller/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBarWithImage extends StatelessWidget {
  const CustomAppBarWithImage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: CustomCircleAvatar(
            child: IconButton(
              onPressed: () {
                if (context.read<HomeCubit>().currentIndex == 1) {
                  context.read<HomeCubit>().changeCurrentIndex(0);
                } else {
                  Navigator.pop(context);
                }
              },
              icon: Icon(Icons.arrow_back_ios_new_outlined, size: 28.sp),
            ),
          ),
        ),

        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20.sp,
            color: AppColors.primaryColor,
          ),
        ),
        Container(
          width: 60.w,
          padding: EdgeInsets.all(3.w),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.blue, width: 2.w),
          ),
          child: CircleAvatar(radius: 30.r, child: Icon(Icons.person)),
        ),
      ],
    );
  }
}
