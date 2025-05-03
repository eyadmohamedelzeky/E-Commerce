
import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/constants/app_fonts.dart';
import 'package:e_commerce/core/constants/app_images.dart';
import 'package:e_commerce/core/extensions/spacing_extension.dart';
import 'package:e_commerce/core/widget/custom_app_bar_with_image.dart';
import 'package:e_commerce/core/widget/custom_button.dart';
import 'package:e_commerce/features/home/controller/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class EmptyCard extends StatelessWidget {
  const EmptyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            40.ph,
            CustomAppBarWithImage(title: 'Cart'),
            20.ph,
            SvgPicture.asset(AppImages.emptyCart),
            20.ph,
            Text(
              'Your Cart is Empty',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
            ),
            30.ph,
            Text(
              textAlign: TextAlign.center,
              'Check our big offers, fresh products and fill your cart with items',
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                fontFamily: AppFonts.poppins,
              ),
            ),
            30.ph,
            CustomButton(
              buttonTitle: 'Continue Shopping',
              onPressed: () {
                context.read<HomeCubit>().changeCurrentIndex(0);
              },
            ),
          ],
        ),
      ),
    );
  }
}
