import 'package:e_commerce/core/constants/app_images.dart';
import 'package:e_commerce/core/widget/custom_circle_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LoginWithSoical extends StatelessWidget {
  const LoginWithSoical({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomCircleAvatar(
          child: SvgPicture.asset(AppImages.google),
        ),
        SizedBox(width: 10.w),
        CustomCircleAvatar(
          child:  SvgPicture.asset(AppImages.apple),
        ),
        SizedBox(width: 10.w),
        CustomCircleAvatar(
          child: SvgPicture.asset(AppImages.facebook),
        ),
      ],
    );
  }
}
