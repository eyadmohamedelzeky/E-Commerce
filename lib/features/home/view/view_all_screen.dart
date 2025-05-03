import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/constants/app_images.dart';
import 'package:e_commerce/core/extensions/spacing_extension.dart';
import 'package:e_commerce/core/widget/custom_app_bar_with_image.dart';
import 'package:e_commerce/core/widget/custom_category_or_brand.dart';
import 'package:e_commerce/core/widget/custom_text_form_field.dart';
import 'package:e_commerce/core/widget/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ViewAllScreen extends StatefulWidget {
  const ViewAllScreen({super.key, this.title});
  final String? title;
  @override
  State<ViewAllScreen> createState() => _ViewAllScreenState();
}

class _ViewAllScreenState extends State<ViewAllScreen> {
  Widget buildContentByTitle() {
    switch (widget.title) {
      case 'Popular Products':
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) {
            return ProductCard(
              image: AppImages.onboardingTwo,
              price: '499 LE',
              rating: '4.9',
              productName: 'Smart Watch',
            );
          },
        );

      case 'Best for You':
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            return ProductCard(
              isHaveButton: true,
              image: AppImages.splash,
              price: '500 LE',
              productName: 'Best For You',
              rating: '4.5',
              offerTitle: '15% OFF',
            );
          },
        );

      case 'Buy Again':
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            return ProductCard(
              isHaveButton: true,
              image: AppImages.onboardingOne,
              price: '500 LE',
              productName: 'Buy Again',
              rating: '4.5',
              offerTitle: '15% OFF',
            );
          },
        );

      case 'Brands':
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            // mainAxisExtent: 140,
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            // mainAxisSpacing: 5,
            childAspectRatio: 1.1,
          ),
          itemBuilder: (context, index) {
            return CustomCategoryOrBrand(name: 'Sony');
          },
        );

      case 'Category':
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            // mainAxisSpacing: 10,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            return CustomCategoryOrBrand(name: 'Pampers');
          },
        );

      default:
        return const Center(child: Text('No items found.'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                40.ph,
                CustomAppBarWithImage(title: widget.title!),
                15.ph,
                CustomTextFormField(
                  // controller: searchController,
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
                15.ph,
                buildContentByTitle(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
