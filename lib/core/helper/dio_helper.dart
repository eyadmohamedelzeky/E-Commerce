// ignore_for_file: unnecessary_null_comparison
// import 'dart:developer';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/constants/api_constants.dart';
import 'package:e_commerce/core/constants/app_constants.dart';
import 'package:e_commerce/core/helper/hive_helper.dart';
import 'package:e_commerce/features/auth/model/login_response_model.dart';

class DioHelper {
  static Dio? dio;
  // var user;
  // static init() {
  //   dio = Dio(
  //     BaseOptions(
  //       baseUrl: ApiConstants.baseUrl,
  //       receiveDataWhenStatusError: true,
  //       validateStatus: (validateStatus) => true,
  //       headers: {
  //         "content-type": 'application/json; charset=utf-8',
  //       },
  //       connectTimeout: ApiConstants.timeOutDuration,
  //       receiveTimeout: ApiConstants.timeOutDuration,
  //       sendTimeout: ApiConstants.timeOutDuration,
  //       responseType: ResponseType.json,
  //       // setRequestContentTypeWhenNoPayload: true,
  //     ),
  //   );
  // }
  static Future<void> init() async {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: ApiConstants.timeOutDuration,
        receiveTimeout: ApiConstants.timeOutDuration,
        sendTimeout: ApiConstants.timeOutDuration,
        responseType: ResponseType.json,
        headers: {"content-type": 'application/json; charset=utf-8'},
      ),
    );

    dio!.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final userJson = await HiveHelper.getFromHive(
            key: AppConstants.loginModel,
          );
          final token =
              userJson != null
                  ? LoginResponseModel.fromJson(
                    Map<String, dynamic>.from(userJson),
                  ).token
                  : null;

          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          options.headers['Accept'] = 'application/json';

          return handler.next(options);
        },
      ),
    );
  }

  static Future<Response?> getData({path, queryParameters}) async {
    //     var user =await HiveHelper.getFromHive(key: AppConstants.loginModel);
    // var myUserModel=LoginResponseModel.fromJson(Map<String, dynamic>.from(user));
    try {
      return await dio!.get(
        path,
        queryParameters: queryParameters,
        options: Options(
          validateStatus: (_) => true,
          // headers: {
          //   // 'Authorization':
          //       // 'Bearer ${(myUserModel != null && myUserModel != null) ? myUserModel.token : ""}',
          //   // 'Accept': 'application/json',
          // },
        ),
      );
    } on SocketException catch (_) {
    } on DioException catch (_) {
      // String errorMsg = _handleResponse(e.response!);
      // BotToast.showText(text: errorMsg);
    }
    return null;
  }

  static Future<Response?> postData({path, data}) async {
    try {
      // log('userModel is ${myUserModel!.employeeToken}');
      return await dio?.post(
        path,
        data: data,
        options: Options(
          validateStatus: (_) => true,
          contentType: 'application/json',
          // headers: {
          //   // 'Authorization':
          //   //     'Bearer ${(myUserModel != null && myUserModel!.employeeToken != null) ? myUserModel!.employeeToken : ""}',
          //   'Accept': 'application/json',
          // },
          followRedirects: false,
        ),
      );
    } on SocketException catch (_) {
      // log(e.message);
    } on DioException catch (_) {
      // log(e.message.toString());
      // log(e.response.toString());
      // log(e.response?.statusCode.toString() ?? "");
      // String errorMsg = _handleResponse(e.response!);
      // BotToast.showText(text: errorMsg);
    }
    return null;
  }

  static String handleResponse(Response response) {
    if (response == null) {
      var jsonResponse = 'connection error';
      return jsonResponse;
    }
    switch (response.statusCode) {
      case 400:
        var jsonResponse = 'UnAuth';
        return jsonResponse;
      case 401:
        var jsonResponse = 'UnAuth';
        return jsonResponse;
      case 403:
        var jsonResponse = 'UnAuth';
        return jsonResponse;
      case 404:
        var jsonResponse = 'Not found';
        return jsonResponse;
      case 422:
        var jsonResponse = 'some fileds required! or error with entry data';
        return jsonResponse;
      case 500:
        var jsonResponse = 'server error';
        return jsonResponse;
      default:
        var jsonResponse = 'server error';
        return jsonResponse;
    }
  }
}
