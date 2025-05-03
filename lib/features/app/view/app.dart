
import 'package:e_commerce/core/constants/app_constants.dart';
import 'package:e_commerce/core/routes/app_routes.dart';
import 'package:e_commerce/core/routes/routes_generator.dart';
import 'package:e_commerce/core/themes/themes.dart';
import 'package:e_commerce/features/auth/controller/auth_cubit.dart';
import 'package:e_commerce/features/home/controller/home_cubit.dart';
import 'package:e_commerce/features/on_boarding/controller/on_boarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ECommerce extends StatelessWidget {
  const ECommerce({super.key});
  @override
  Widget build(BuildContext context) {
     return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_ , child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => OnBoardingCubit()),
            BlocProvider(create: (context) => AuthController()..initAllController()),
            BlocProvider(create: (context) => HomeCubit()),
          ],
          child: MaterialApp(
            navigatorKey: AppConstants.navigatorKey,
            theme: AppThemes.defaultTheme,
            debugShowCheckedModeBanner: false,
           initialRoute: AppRoutes.homeLayout,
           onGenerateRoute: RouteGenerator.generateRoute,
            home: child,
          ),
        );
      },
    );
  }
}