import 'package:e_commerce/core/constants/app_constants.dart';
import 'package:e_commerce/core/model/on_boarding_model.dart';
import 'package:e_commerce/core/routes/app_routes.dart';
import 'package:e_commerce/features/on_boarding/controller/on_boarding_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial());
  static OnBoardingCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  final PageController pageController = PageController();

  void changePage(int index) {
    currentIndex = index;
    emit(OnBoardingChanged());
  }

  void onClickButton() {
    if (currentIndex < onBoardingItems.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      Navigator.pushReplacementNamed(AppConstants.navigatorKey.currentContext!, AppRoutes.login);
    }
  }
}
