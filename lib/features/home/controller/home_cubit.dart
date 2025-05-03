import 'package:e_commerce/features/cart/view/cart_screen.dart';
import 'package:e_commerce/features/favourite/view/favourite_screen.dart';
import 'package:e_commerce/features/home/controller/home_state.dart';
import 'package:e_commerce/features/home/view/home_screen.dart';
import 'package:e_commerce/features/menu/view/menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  List<Widget> pages = [
    HomeScreen(),
    CartScreen(),
    FavouriteScreen(),
    MenuScreen(),
  ];
  static HomeCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  changeCurrentIndex(int index) {
    currentIndex = index;
    emit(ChangeIndex());
  }
  bool isFavourite = false;
  Future<void> addToFavourite()async{
    isFavourite = !isFavourite;
    emit(AddToFavouriteState());
  }

}
