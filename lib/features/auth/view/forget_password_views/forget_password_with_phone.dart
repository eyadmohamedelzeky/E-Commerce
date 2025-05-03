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

class ForgetPasswordWithPhone extends StatefulWidget {
  const ForgetPasswordWithPhone({super.key});

  @override
  State<ForgetPasswordWithPhone> createState() =>
      _ForgetPasswordWithPhoneState();
}

class _ForgetPasswordWithPhoneState extends State<ForgetPasswordWithPhone> {
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
                    builder: (context, state) {
                      final authController = AuthController.get(context);
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20.h),
                          CustomAppBarAuthcation(title: 'Forget Password'),
                          SizedBox(height: 50.h),
                          Center(
                            child: SvgPicture.asset(
                              AppImages.forgetPasswordPhone,
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
                            'Phone Number',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: AppColors.primaryColor,
                              fontFamily: AppFonts.poppins,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 5.h,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue.shade100),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.phone_android, size: 20),
                                SizedBox(width: 8.w),
                                Expanded(
                                  flex: 2,
                                  child: DropdownButtonFormField<String>(
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Please select dial code';
                                      }
                                      return null;
                                    },
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    value:
                                        authController
                                            .selectedDialCodeForForgetPassword,
                                    isExpanded: true,
                                    decoration: InputDecoration.collapsed(
                                      hintText: '',
                                    ),
                                    items:
                                        authController.countryCodes
                                            .map(
                                              (code) => DropdownMenuItem(
                                                value: code['dial_code'],
                                                child: Text(code['dial_code']!),
                                              ),
                                            )
                                            .toList(),
                                    onChanged: (val) {
                                      authController
                                          .setSelectedDialCodeForForgetPassword(
                                            val!,
                                          );
                                    },
                                  ),
                                ),
                                SizedBox(width: 8.w),

                                Expanded(
                                  flex: 5,
                                  child: CustomTextFormField(
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    enableBorder: false,
                                    keyboardType: TextInputType.phone,
                                    controller:
                                        authController
                                            .phoneControllerForForgetPassword,
                                    hintText: '1501142409',
                                    validator: (phone) {
                                      if (phone!.isEmpty ||
                                          phone.trim().isEmpty) {
                                        return 'Enter phone number';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 30.h),
                          CustomButton(
                            buttonTitle: 'Send Code',
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                Navigator.pushNamed(
                                  context,
                                  AppRoutes.verficationCodeWithPhone,
                                );
                                // authController.forgetPasswordWithPhone(context);
                              }
                            },
                          ),
                          SizedBox(height: 20.h),
                          Center(
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  AppRoutes.forgetPasswordWithEmail,
                                );
                              },
                              child: Text(
                                'Try Another Way',
                                style: TextStyle(
                                  color: AppColors.blue,
                                  fontSize: 18.sp,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
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
