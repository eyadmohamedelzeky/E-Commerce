import 'dart:developer';

import 'package:e_commerce/core/constants/api_constants.dart';
import 'package:e_commerce/core/helper/dio_helper.dart';
import 'package:e_commerce/features/auth/model/login_response_model.dart';

abstract class AuthService {
  static Future<LoginResponseModel> login({
    required String email,
    required String password,
  }) async {
    final response = await DioHelper.postData(
      path: ApiConstants.login,
      data: {'email': email, 'password': password},
    );
    log('login path request : ${ApiConstants.login}');
    if (response != null && response.statusCode == 200) {
      log('login path response : ${response.data}');
      return LoginResponseModel.fromJson(response.data);
    } else {
      log('login path response : ${response?.data}');

      return LoginResponseModel(message: response?.data['message']);
    }
  }
}
