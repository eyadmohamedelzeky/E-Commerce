import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/constants/app_images.dart';
import 'package:e_commerce/core/routes/app_routes.dart';
import 'package:e_commerce/core/widget/custom_app_bar_auth.dart';
import 'package:e_commerce/core/widget/custom_button.dart';
import 'package:e_commerce/features/auth/controller/auth_cubit.dart';
import 'package:e_commerce/features/auth/controller/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';

class VerficationCodeWithPhone extends StatefulWidget {
  const VerficationCodeWithPhone({super.key});

  @override
  State<VerficationCodeWithPhone> createState() =>
      _VerficationCodeWithPhoneState();
}

class _VerficationCodeWithPhoneState extends State<VerficationCodeWithPhone> {
  final formKey = GlobalKey<FormState>();
  
@override

  void initState() {
    super.initState();
    context.read<AuthController>().initTimer();
    context.read<AuthController>().codeControllerWithPhone?.clear();

  }
  @override
  void dispose() {
    super.dispose();
    context.read<AuthController>().timer?.cancel();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: SingleChildScrollView(
              child: BlocBuilder<AuthController, AuthState>(
                builder: (context, authState) {
                  final authController = AuthController.get(context);
                  return BlocBuilder<AuthController, AuthState>(
                    builder: (context, authState) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20.h),
                          CustomAppBarAuthcation(title: 'Verification Code'),
                          SizedBox(height: 50.h),
                          Center(
                            child: SvgPicture.asset(
                              AppImages.verficationCodeWithEmail,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Text.rich(
                            TextSpan(
                              text: 'Please enter the 4 digit code sent to:',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textColor,
                              ),
                              children: [
                                TextSpan(
                                  text:
                                      authController.emailControllerForLogin.text,
                                  style: TextStyle(
                                    color: AppColors.blue,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20.h),
                          Center(
                            child: Pinput(
                              length: 4,
                              controller:
                                  authController.codeControllerWithPhone,
                              keyboardType: TextInputType.number,
                              validator: (pin) {
                                if (pin == null || pin.isEmpty) {
                                  return 'Please enter the 4 digit code';
                                }
                                return null;
                              },
                              defaultPinTheme: PinTheme(
                                width: 65.w,
                                height: 65.h,
                                textStyle: TextStyle(
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primaryColor,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.blue),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              focusedPinTheme: PinTheme(
                                width: 65.w,
                                height: 65.h,
                                textStyle: TextStyle(
                                  fontSize: 20.sp,
                                  color: AppColors.primaryColor,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.blue),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              errorPinTheme: PinTheme(
                                width: 65.w,
                                height: 65.h,
                                textStyle: TextStyle(
                                  fontSize: 20.sp,
                                  color: Colors.black,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.redColor),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 20.h),
                         Center(
                           child: TextButton(
                             onPressed:authController. start == 0 ? () {
                               authController. startTimer(); // Restart timer
                             } : null, // Disable button if timer is running
                             child: Text(
                              authController.  start == 0 ? "Resend Code" : authController. formattedTime,
                               style: TextStyle(
                                 color: AppColors.textColor,
                                 fontSize: 16.sp,
                               ),
                             ),
                           ),
                         ),


                          SizedBox(height: 30.h),
                          CustomButton(
                            buttonTitle: 'Verify Code',
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                Navigator.pushNamed(
                                  context,
                                  AppRoutes.newPasswordScreen,
                                );
                              }
                            },
                          ),
                          SizedBox(height: 20.h),

                          Center(
                            child: TextButton(
                              onPressed: () {
                                //! Resend Code
                              },
                              child: Text(
                                'Resend Code',
                                style: TextStyle(
                                  color: AppColors.textColor,
                                  fontSize: 16.sp,
                                ),
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
