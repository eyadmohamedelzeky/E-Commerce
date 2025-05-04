import 'dart:developer';
import 'package:hive_flutter/hive_flutter.dart';

class HiveHelper {
  // static Box<LocationLogRequestModel>? locationsBox;

  static Future<void> init() async {
    await Hive.initFlutter();
  }


  static Future<void> addToHive({required String key, required dynamic value}) async {
    try {
      Box<dynamic> boxVars = await Hive.openBox("modelBox");
      await boxVars.put(key, value);
    } catch (error) {
       log(error.toString());}
  }

  static Future<dynamic> getFromHive({required String key}) async {
    try {
      Box<dynamic> boxVars = await Hive.openBox("modelBox");
      return boxVars.get(key);
    } catch (error) {
      log(error.toString());
      return null;
    }
  }

  static Future<void> removeFromHive({required String key}) async {
    try {
      Box<dynamic> boxVars = await Hive.openBox("modelBox");
      await boxVars.delete(key);
    } catch (error) {
      log(error.toString());
    }
  }

  // static Future<void> clearAllData() async {
  //   try {
  //     await locationsBox?.clear();
  //   } catch (error) {
  //     log("Error clearing all data from Hive: $error");
  //   }
  // }
}