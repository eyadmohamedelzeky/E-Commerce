import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/constants/app_images.dart';
import 'package:e_commerce/core/routes/app_routes.dart';
import 'package:e_commerce/core/widget/custom_app_bar_auth.dart';
import 'package:e_commerce/core/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CongratulationsScreen extends StatefulWidget {
  const CongratulationsScreen({super.key});

  @override
  State<CongratulationsScreen> createState() => _CongratulationsScreenState();
}

class _CongratulationsScreenState extends State<CongratulationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),

          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20.h),
                CustomAppBarAuthcation(),
                SizedBox(height: 50.h),
                Center(
                        child: SvgPicture.asset(
                          AppImages.congratulations,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        'Congratulations',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.blackColor,
                        ),
                      ),
                      SizedBox(height: 40.h),

                      Text(
                        'You have updated the password. please login again with your latest password',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColor,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      CustomButton(
                        buttonTitle: 'Log In',
                        onPressed: () {
                          
                          Navigator.pushNamed(
                              context,
                              AppRoutes.login,
                            );
                        },
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
