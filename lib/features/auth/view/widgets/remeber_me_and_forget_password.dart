import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/routes/app_routes.dart';
import 'package:e_commerce/features/auth/controller/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RemeberMeAndForgetPassword extends StatelessWidget {
  const RemeberMeAndForgetPassword({super.key, required this.authController});

  final AuthController authController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Transform.scale(
                scale: 0.8,
                child: Checkbox(
                  checkColor: AppColors.whiteColor,
                  activeColor: AppColors.blue,
                  value: authController.isRemeberMe,
                  onChanged: (isRemeberMe) {
                    authController.toggleIsRemeberMe();
                  },
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
              Text(
                'Remember Me',
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.forgetPasswordWithPhone);
              },
              child: Text(
                'Forget Password?',
                style: TextStyle(
                  color: AppColors.blue,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
