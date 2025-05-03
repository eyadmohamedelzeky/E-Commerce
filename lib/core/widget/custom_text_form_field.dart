import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.prefixIcon,
    this.controller,
    this.validator,
    this.suffixIcon,
    this.obscureText = false,
    this.autovalidateMode,
    this.keyboardType,
    this.enableBorder=true,
    this.contentPadding,
    this.hintStyle
  });
  final String? hintText;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final bool? obscureText;
  final AutovalidateMode? autovalidateMode;
  final TextInputType? keyboardType;
  final bool? enableBorder;
final EdgeInsetsGeometry? contentPadding;
final TextStyle? hintStyle;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      keyboardType:keyboardType ,
      autovalidateMode: autovalidateMode,
      obscureText: obscureText ?? false,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        hintStyle: hintStyle,
        contentPadding:contentPadding ,
         enabledBorder: enableBorder == true
      ? OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightBlueColor, width: 2.w),
          borderRadius: BorderRadius.circular(8.r),
        )
      : InputBorder.none,
        filled: true,
        fillColor: AppColors.whiteColor,
        enabled: true,
        errorBorder:enableBorder==true? OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.redColor),
          borderRadius: BorderRadius.circular(8.r),
        ):null,
        focusedBorder:enableBorder==true? OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightBlueColor, width: 2.w),
          borderRadius: BorderRadius.circular(8.r),
        ): null,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border:enableBorder==true? OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightBlueColor, width: 2.w),
          borderRadius: BorderRadius.circular(8.r),
        ):null,
        hintText: hintText,
      ),
    );
  }
}
