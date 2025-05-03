import 'package:e_commerce/features/home/controller/home_cubit.dart';
import 'package:e_commerce/features/home/controller/home_state.dart';
import 'package:e_commerce/features/home/view/widgets/custom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, homeState) {
        final homeCubit = HomeCubit.get(context);
        return Scaffold(
          bottomNavigationBar: CustomNavBar(homeCubit: homeCubit),
          body: homeCubit.pages[homeCubit.currentIndex],
        );
      },
    );
  }
}
