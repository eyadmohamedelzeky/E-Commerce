import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/constants/app_fonts.dart';
import 'package:e_commerce/core/constants/app_images.dart';
import 'package:e_commerce/core/widget/custom_button.dart';
import 'package:e_commerce/core/widget/custom_circle_avatar.dart';
import 'package:e_commerce/core/widget/custom_text_form_field.dart';
import 'package:e_commerce/features/auth/controller/auth_cubit.dart';
import 'package:e_commerce/features/auth/controller/auth_state.dart';
import 'package:e_commerce/features/auth/view/widgets/login_with_soical.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthController, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        final authController = AuthController.get(context);
        return Scaffold(
          body: Form(
            key: formKey,
            child: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 16.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h),
                      Align(
                        alignment: Alignment.topLeft,
                        child: CustomCircleAvatar(
                          child: IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(
                              Icons.arrow_back_ios_new_outlined,
                              size: 28.sp,
                            ),
                          ),
                        ),
                      ),
                      Image.asset(
                        AppImages.splash,
                        height: 150.h,
                        width: 300.w,
                      ),
                      SizedBox(height: 40.h),
                      Text(
                        'Your Name',
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
                            authController.fullNameControllerForRegister,
                        validator: (fullName) {
                          if (fullName!.isEmpty || fullName.trim().isEmpty) {
                            return 'Please enter your full name';
                          }
                          return null;
                        },
                        hintText: 'Full Name',
                        prefixIcon: SvgPicture.asset(
                          AppImages.nameIcon,
                          width: 30.w,
                          height: 30.h,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        'Username',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.primaryColor,
                          fontFamily: AppFonts.poppins,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      CustomTextFormField(
                        controller:
                            authController.userNameControllerForRegister,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (username) {
                          if (username!.isEmpty || username.trim().isEmpty) {
                            return 'Please enter your username';
                          }
                          return null;
                        },
                        hintText: 'Username',
                        prefixIcon: SvgPicture.asset(
                          AppImages.userIcon,
                          width: 30.w,
                          height: 30.h,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      SizedBox(height: 10.h),
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
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                value: authController.selectedDialCode,
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
                                  authController.setSelectedDialCode(val!);
                                },
                              ),
                            ),
                            SizedBox(width: 8.w),
                            
                            Expanded(
                              flex: 5,
                              child: CustomTextFormField(
                                enableBorder: false,
                                keyboardType: TextInputType.phone,
                                controller:
                                    authController.phoneControllerForRegister,
                                hintText: '1501142409',
                                validator: (phone) {
                                  if (phone!.isEmpty || phone.trim().isEmpty) {
                                    return 'Enter phone number';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
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
                        controller: authController.emailControllerForRegister,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (email) {
                          if (email!.isEmpty || email.trim().isEmpty) {
                            return "Please enter your email";
                          }
                          //! Experssions
                          if(!authController.emailRegex.hasMatch(email)){
                            return "Please enter valid email";
                          }
                          return null;
                        },
                        hintText: 'You@gmail.com',
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: AppColors.primaryColor,
                          size: 16.sp,
                        ),
                      ),
                      SizedBox(height: 10.h),
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
                            authController.passwordControllerForRegister,
                        validator: (password) {
                          if (password!.isEmpty || password.trim().isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        obscureText: authController.isVisiableForRegister,
                        hintText: 'password',
                        suffixIcon: IconButton(
                          onPressed: authController.toggleVisiableForRegister,
                          icon:
                              authController.isVisiableForRegister
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
                            authController.confirmPasswordControllerForRegister,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (confrimPassword) {
                          if (confrimPassword!.isEmpty ||
                              confrimPassword.trim().isEmpty) {
                            return 'Please enter your confrim password';
                          } else if (authController
                                  .passwordControllerForRegister
                                  ?.text !=
                              authController
                                  .confirmPasswordControllerForRegister
                                  ?.text) {
                            return 'Password does not match';
                          }
                          return null;
                        },
                        obscureText:
                            authController
                                .isVisiableForRegisterForConfrimPassword,
                        hintText: 'confirm password',
                        suffixIcon: IconButton(
                          onPressed:
                              authController
                                  .toggleVisiableForRegisterConfirmPassword,
                          icon:
                              authController
                                      .isVisiableForRegisterForConfrimPassword
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
                      SizedBox(height: 40.h),
                      CustomButton(
                        buttonTitle: 'Sign Up',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {}
                        },
                      ),
                       SizedBox(height: 10.h),
                        Center(child: Text("Or Continue With")),
                        SizedBox(height: 10.h),
                        LoginWithSoical(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
