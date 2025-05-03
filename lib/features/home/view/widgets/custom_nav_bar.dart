
import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/features/home/controller/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    super.key,
    required this.homeCubit,
  });

  final HomeCubit homeCubit;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.r),
        topRight: Radius.circular(20.r),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
          border: Border(
            top: BorderSide(
              color: AppColors.blue.withOpacity(.5),
              width: 1,
            ), // Add top border
          ),
        ),
        child: BottomNavigationBar(
          iconSize: 25.sp,
          unselectedIconTheme: const IconThemeData(
            color: AppColors.lightGrey,
          ),
          selectedItemColor: AppColors.blue,
          unselectedItemColor: AppColors.lightGrey,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          currentIndex: homeCubit.currentIndex,
          onTap: (value) {
            homeCubit.changeCurrentIndex(value);
          },
          type:
              BottomNavigationBarType
                  .fixed, // Use 'fixed' to respect container shape
          backgroundColor:
              Colors.transparent, // Transparent to show Container color
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: 'Menu',
            ),
          ],
        ),
      ),
    );
  }
}
