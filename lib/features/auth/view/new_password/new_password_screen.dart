import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/constants/app_fonts.dart';
import 'package:e_commerce/core/constants/app_images.dart';
import 'package:e_commerce/core/routes/app_routes.dart';
import 'package:e_commerce/core/widget/custom_app_bar_auth.dart';
import 'package:e_commerce/core/widget/custom_button.dart';
import 'package:e_commerce/core/widget/custom_text_form_field.dart';
import 'package:e_commerce/features/auth/controller/auth_cubit.dart';
import 'package:e_commerce/features/auth/controller/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() =>
      _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: BlocBuilder<AuthController, AuthState>(
                builder: (context, authState) {
                  final authController = AuthController.get(context);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h),
                      CustomAppBarAuthcation(title: 'Create New Password'),
                      SizedBox(height: 50.h),
                      Center(
                        child: SvgPicture.asset(
                          AppImages.newPassword,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        'New password must be different from last password',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColor,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Text(
                    'Password',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.primaryColor,
                      fontFamily: AppFonts.poppins,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  CustomTextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller:
                        authController.newPasswordController,
                    validator: (password) {
                      if (password!.isEmpty || password.trim().isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    obscureText: authController.isVisiableNewPassword,
                    hintText: 'password',
                    suffixIcon: IconButton(
                      onPressed: authController.toggleVisiableForNewPassword,
                      icon:
                          authController.isVisiableNewPassword
                              ? Icon(
                                Icons.visibility_off,
                                color: AppColors.primaryColor,
                              )
                              : Icon(Icons.visibility),
                    ),
                    prefixIcon: SizedBox(
                      width: 30.w,
                      height: 30.h,
                      child: SvgPicture.asset(
                        AppImages.passwordLock,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
              
                  SizedBox(height: 10.h),
                  Text(
                    'Confirm Password',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.primaryColor,
                      fontFamily: AppFonts.poppins,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  CustomTextFormField(
                    controller:
                        authController.confirmNewPasswordController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (confrimPassword) {
                      if (confrimPassword!.isEmpty ||
                          confrimPassword.trim().isEmpty) {
                        return 'Please enter your confrim password';
                      } else if (authController
                              .newPasswordController
                              ?.text !=
                          authController
                              .confirmNewPasswordController
                              ?.text) {
                        return 'Password does not match';
                      }
                      return null;
                    },
                    obscureText:
                        authController
                            .isVisiableNewPasswordConfrim,
                    hintText: 'confirm password',
                    suffixIcon: IconButton(
                      onPressed:
                          authController
                              .toggleVisiableForConfirmPassword,
                      icon:
                          authController
                                  .isVisiableNewPasswordConfrim
                              ? Icon(
                                Icons.visibility_off,
                                color: AppColors.primaryColor,
                              )
                              : Icon(Icons.visibility),
                    ),
                    prefixIcon: SizedBox(
                      width: 30.w,
                      height: 30.h,
                      child: SvgPicture.asset(
                        AppImages.passwordLock,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                      SizedBox(height: 30.h),
                      CustomButton(
                        buttonTitle: 'Save Password',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                          Navigator.pushNamed(
                              context,
                              AppRoutes.congratulations,
                            );
                          }
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
