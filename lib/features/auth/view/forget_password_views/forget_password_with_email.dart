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

class ForgetPasswordWithEmail extends StatefulWidget {
  const ForgetPasswordWithEmail({super.key});

  @override
  State<ForgetPasswordWithEmail> createState() =>
      _ForgetPasswordWithEmailState();
}

class _ForgetPasswordWithEmailState extends State<ForgetPasswordWithEmail> {
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
              child: Builder(
                builder: (context) {
                  return BlocBuilder<AuthController, AuthState>(
                    builder: (context, authState) {
                      final authController = AuthController.get(context);
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20.h),
                          CustomAppBarAuthcation(title: 'Forget Password'),
                          SizedBox(height: 50.h),
                          Center(
                            child: SvgPicture.asset(
                              AppImages.forgetPasswordEmail,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            'Please enter your phone number to receive a verification code',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textColor,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            'Email',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: AppColors.primaryColor,
                              fontFamily: AppFonts.poppins,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          CustomTextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (usernameOrEmail) {
                              if (usernameOrEmail!.isEmpty) {
                                return 'Please enter your username or email';
                              }
                              if (!authController.emailRegex.hasMatch(
                                usernameOrEmail,
                              )) {
                                return "Please enter valid email";
                              }

                              return null;
                            },
                            hintText: 'You@gmail.com',
                            controller:
                                authController.forgetPasswordEmailController,
                          ),
                          SizedBox(height: 30.h),
                          CustomButton(
                            buttonTitle: 'Send Code',
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                              Navigator.pushNamed(
                                  context,
                                  AppRoutes.verficationCodeWithEmail,
                                );
                              }
                            },
                          ),
                        ],
                      );
                    },
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
