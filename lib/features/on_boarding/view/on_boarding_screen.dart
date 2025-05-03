import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/constants/app_fonts.dart';
import 'package:e_commerce/core/model/on_boarding_model.dart';
import 'package:e_commerce/core/widget/custom_button.dart';
import 'package:e_commerce/features/on_boarding/controller/on_boarding_cubit.dart';
import 'package:e_commerce/features/on_boarding/controller/on_boarding_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      builder: (context, state) {
        final onBoardingCubit = OnBoardingCubit.get(context);
        return Scaffold(
          body: SafeArea(
            child: PageView.builder(
              controller: onBoardingCubit.pageController,
              onPageChanged: (index) {
                // setState(() {
                //   _currentPage = index;
                // });
                onBoardingCubit.changePage(index);
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(24.w),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(onBoardingItems[index]["image"]!),
                        SizedBox(height: 40.h),
                        Align(
                          // bottom: 100.h,
                          // left: 0,
                          // right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              onBoardingItems.length,
                              (index) => Container(
                                margin: EdgeInsets.symmetric(horizontal: 4.w),
                                width: 15.w,
                                height: 15.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      onBoardingCubit.currentIndex == index
                                          ? AppColors.primaryColor
                                          : AppColors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 40.h),
                        Text(
                          onBoardingItems[index]["title"]!,
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: AppFonts.poppins,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        SizedBox(height: 40.h),
                        Text(
                          textAlign: TextAlign.center,
                          onBoardingItems[index]["description"]!,
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppFonts.poppins,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        CustomButton(buttonTitle: onBoardingItems[onBoardingCubit.currentIndex]["buttonText"]!, onPressed:onBoardingCubit.onClickButton),
                      ],
                    ),
                  ),
                );
              },
              itemCount: onBoardingItems.length,
            ),
          ),
        );
      },
    );
  }
}
