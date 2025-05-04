import 'package:e_commerce/bloc_observer.dart';
import 'package:e_commerce/core/helper/dio_helper.dart';
import 'package:e_commerce/core/helper/hive_helper.dart';
import 'package:e_commerce/features/app/view/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async{
   await DioHelper.init(); 
  await HiveHelper.init();
  // WidgetsFlutterBinding.ensureInitialized();
   WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
   Bloc.observer = AppBlocObserver();
  runApp(const ECommerce());
  FlutterNativeSplash.remove();
}