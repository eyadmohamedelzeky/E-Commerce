import 'package:e_commerce/bloc_observer.dart';
import 'package:e_commerce/features/app/view/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
   WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
   Bloc.observer = AppBlocObserver();
  runApp(const ECommerce());
  FlutterNativeSplash.remove();
}