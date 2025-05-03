import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/constants/app_fonts.dart';
import 'package:flutter/material.dart';

abstract class AppThemes {
  static ThemeData defaultTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.whiteColor,
  fontFamily: AppFonts.poppins,
  iconTheme: IconThemeData(color: AppColors.blackColor),
);
}