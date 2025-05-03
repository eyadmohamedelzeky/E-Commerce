import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/constants/app_fonts.dart';
import 'package:e_commerce/core/constants/app_images.dart';
import 'package:e_commerce/core/extensions/spacing_extension.dart';
import 'package:e_commerce/core/widget/custom_app_bar_with_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBarWithImage(title: 'Cart'), //! need To Handle back Button
                20.ph,
                Text(
                  'Products on Cart',
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: AppColors.primaryColor,
                    fontFamily: AppFonts.poppins,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                20.ph,
                Container(
                  padding: EdgeInsets.all(12.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(
                      color: AppColors.lightBlueColor,
                      width: 1.w,
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 120.h,
                        child: Image.asset(
                          AppImages.pampers,
                          fit: BoxFit.contain,
                        ),
                      ),
                      10.pw,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Pampers Swaddlers',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: AppColors.primaryColor,
                                      fontFamily: AppFonts.poppins,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.favorite_border,
                                    size: 20.sp,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '84 Diapers',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: AppColors.lightGrey,
                                fontFamily: AppFonts.poppins,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            10.ph,
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Price: 345.00 EGP',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Text(
                                  '★ 4.9',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            10.ph,
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    width: 40.w,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffD9E6FF),
                                      borderRadius: BorderRadius.circular(15.r),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '-',
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          color: AppColors.lightBlueColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                5.pw,
                                Expanded(
                                  child: Container(
                                    width: 60.w,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                      color: AppColors.whiteColorSecondry,
                                      borderRadius: BorderRadius.circular(15.r),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '1',
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          color: AppColors.blue,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                5.pw,
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    width: 40.w,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffD9E6FF),
                                      borderRadius: BorderRadius.circular(15.r),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '+',
                                        style: TextStyle(
                                          color: AppColors.lightBlueColor,
                                          fontSize: 18.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
