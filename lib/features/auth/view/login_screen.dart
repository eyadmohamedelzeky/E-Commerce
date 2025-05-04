import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/constants/app_constants.dart';
import 'package:e_commerce/core/constants/app_images.dart';
import 'package:e_commerce/core/helper/hive_helper.dart';
import 'package:e_commerce/core/routes/app_routes.dart';
import 'package:e_commerce/core/widget/custom_button.dart';
import 'package:e_commerce/core/widget/custom_text_form_field.dart';
import 'package:e_commerce/features/auth/controller/auth_cubit.dart';
import 'package:e_commerce/features/auth/controller/auth_state.dart';
import 'package:e_commerce/features/auth/model/login_response_model.dart';
import 'package:e_commerce/features/auth/view/widgets/login_with_soical.dart';
import 'package:e_commerce/features/auth/view/widgets/remeber_me_and_forget_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

    Future<void> checkLoginStatus(BuildContext context) async {
    final userJson = await HiveHelper.getFromHive(key: AppConstants.loginModel);

    if (userJson != null) {
      final model = LoginResponseModel.fromJson(Map<String, dynamic>.from(userJson));
      updateUerModel(model);
      Navigator.pushReplacementNamed(context, AppRoutes.homeLayout);
    } else {
      // Navigator.pushReplacementNamed(context, AppRoutes.login);
    }
  }
  @override
  void initState() {
    super.initState();
    checkLoginStatus(context);

  }
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: SafeArea(
          child: BlocConsumer<AuthController, AuthState>(
            listener: (context, authState) {
              if (authState is LoginSuccessState) {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.homeLayout,
                  (route) => false,
                );
              }
              if(authState is LoginErrorState){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(authState.error!),
                  ),
                );
              }
            },
            builder: (context, authState) {
              final authController = AuthController.get(context);
              return Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Image.asset(
                          AppImages.splash,
                          width: 200.w,
                          height: 200.h,
                        ),
                        SizedBox(height: 40.h),
                        CustomTextFormField(
                          controller: authController.emailControllerForLogin,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                          hintText: 'username or Email',
                          prefixIcon: SizedBox(
                            width: 30.w,
                            height: 30.h,
                            child: SvgPicture.asset(
                              AppImages.email,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                        SizedBox(height: 8.h),
                        CustomTextFormField(
                          controller: authController.passwordControllerForLogin,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (password) {
                            if (password == null || password.trim().isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          obscureText: authController.isVisiableForLogin,
                          hintText: 'password',
                          suffixIcon: IconButton(
                            onPressed: authController.toggleVisiableForLogin,
                            icon:
                                authController.isVisiableForLogin
                                    ? Icon(
                                      Icons.visibility_off,
                                      color: AppColors.blackColor,
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
                        SizedBox(height: 5.h),
                        RemeberMeAndForgetPassword(
                          authController: authController,
                        ),
                        SizedBox(height: 10.h),
                       authState is LoginLoadingState ? CircularProgressIndicator() : CustomButton(
                          buttonTitle: 'Login',
                          onPressed: () async{
                            if (formKey.currentState!.validate()) {
                             await authController.login();
                            }
                          },
                        ),
                        SizedBox(height: 10.h),
                        Text("Or Continue With"),
                        SizedBox(height: 10.h),
                        LoginWithSoical(),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Are you new in Marketi "),
                            GestureDetector(
                              onTap: () {
                                AppConstants.navigatorKey.currentState!
                                    .pushNamed(AppRoutes.signUp);
                              },
                              child: Text(
                                'register?',
                                style: TextStyle(color: AppColors.blue),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
