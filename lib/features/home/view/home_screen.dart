import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/constants/app_images.dart';
import 'package:e_commerce/core/extensions/spacing_extension.dart';
import 'package:e_commerce/core/widget/custom_text_form_field.dart';
import 'package:e_commerce/core/widget/custom_title_for_view.dart';
import 'package:e_commerce/features/auth/controller/auth_cubit.dart';
import 'package:e_commerce/features/auth/controller/auth_state.dart';
import 'package:e_commerce/features/home/view/widgets/best_for_you.dart';
import 'package:e_commerce/features/home/view/widgets/brands.dart';
import 'package:e_commerce/features/home/view/widgets/buy_again.dart';
import 'package:e_commerce/features/home/view/widgets/category.dart';
import 'package:e_commerce/features/home/view/widgets/custom_app_bar.dart';
import 'package:e_commerce/features/home/view/widgets/popular_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: BlocConsumer<AuthController, AuthState>(
              listener: (context,authState) {},
              builder: (context,authState) {
                final authController = AuthController.get(context);
                return Column(
                  children: [
                    40.ph,
                    CustomAppBar(
                      title:authController.loginResponseModel?.name??'' ,
                    ),
                    20.ph,
                    CustomTextFormField(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.search,
                          color: AppColors.blackColor,
                          size: 40.sp,
                        ),
                      ),
                      hintText: 'What are you looking for ? ',
                      hintStyle: TextStyle(
                        color: AppColors.lightGrey,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.lightBlueColor,
                              width: 2.w,
                            ),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          height: 30.h,
                          width: 30.w,
                          child: SvgPicture.asset(
                            fit: BoxFit.scaleDown,
                            AppImages.filter,
                          ),
                        ),
                      ),
                    ),
                    20.ph,
                    Image.asset(AppImages.offer, fit: BoxFit.cover),
                    15.ph,
                    CustomTitleForView(title: 'Popular Products'),
                    PopularProducts(),
                    15.ph,
                    CustomTitleForView(title: 'Category'),
                    10.ph,
                    Category(),
                    CustomTitleForView(title: 'Best for You'),
                    10.ph,
                    BestForYou(),
                    15.ph,
                    CustomTitleForView(title: 'Brands'),
                    5.ph,
                    Brands(),
                    CustomTitleForView(title: 'Buy Again'),
                    10.ph,
                    BuyAgain(),
                  ],
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}
