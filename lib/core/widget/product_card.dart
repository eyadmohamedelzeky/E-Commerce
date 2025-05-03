import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/extensions/spacing_extension.dart';
import 'package:e_commerce/features/home/controller/home_cubit.dart';
import 'package:e_commerce/features/home/controller/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
    required this.image,
    required this.price,
    required this.rating,
    this.offerTitle,
    required this.productName,
    this.isHaveButton = false,
  });
  final String image;
  final String price;
  final String rating;
  final String? offerTitle;
  final String productName;
  final bool? isHaveButton;
  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Container(
        width:170.w,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Color(0xFFE6F0FF),
              ),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Center(
                    child: Image.asset(
                      width: double.infinity,
                      widget.image,
                      // AppImages.onboardingTwo,
                      height: 100,
                    ),
                  ),
                  if (widget.offerTitle != null)
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFADD8FF),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          ),
                        ),
                        child: Text(
                          widget.offerTitle!, // "15% OFF",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade900,
                          ),
                        ),
                      ),
                    ),
                  BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, homeState) {
                      final homeCubit = HomeCubit.get(context);
                      return InkWell(
                        onTap: homeCubit.addToFavourite,
                        child: CircleAvatar(
                          radius: 13.r,
                          backgroundColor: AppColors.whiteColor,
                          child:
                              homeCubit.isFavourite
                                  ? Icon(
                                    Icons.favorite,
                                    color: AppColors.blackColor,
                                  )
                                  : Icon(
                                    Icons.favorite_border,
                                    color: Colors.blue.shade900,
                                  ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.price, // "499 LE",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.star, size: 14, color: Colors.blue),
                    SizedBox(width: 2),
                    Text(
                      widget.rating,
                      style: TextStyle(fontSize: 12),
                    ), // "4.9"
                  ],
                ),
              ],
            ),
            4.ph,
            Text(
              widget.productName, // "Smart Watch",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
           if (widget.isHaveButton ?? false) 5.ph,

            if (widget.isHaveButton ?? false)
              Center(
                child: Container(
                  width: 120.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    border: Border.all(color: AppColors.blue),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Center(
                      child: Text(
                        'Add',
                        style: TextStyle(color: AppColors.blue),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
