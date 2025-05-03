import 'dart:async';

import 'package:e_commerce/features/auth/controller/auth_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthController extends Cubit<AuthState> {
  AuthController() : super(AuthInitial());
  static AuthController get(context) => BlocProvider.of(context);
  bool isRemeberMe = false;
  bool isVisiableForLogin = false;
  TextEditingController emailControllerForLogin = TextEditingController();
  TextEditingController passwordControllerForLogin = TextEditingController();
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  void toggleIsRemeberMe() {
    isRemeberMe = !isRemeberMe;
    emit(IsRemeberMeChanged());
  }

  void toggleVisiableForLogin() {
    isVisiableForLogin = !isVisiableForLogin;
    emit(IsVisiableChangedForLogin());
  }

  //===============================================================================
  //! For Register
  bool isVisiableForRegister = false;
  bool isVisiableForRegisterForConfrimPassword = false;
  bool isVisiableNewPassword = false;
  bool isVisiableNewPasswordConfrim = false;
  TextEditingController? emailControllerForRegister;
  TextEditingController? passwordControllerForRegister;
  TextEditingController? userNameControllerForRegister;
  TextEditingController? fullNameControllerForRegister;
  TextEditingController? confirmPasswordControllerForRegister;
  TextEditingController? phoneControllerForRegister;
  TextEditingController? phoneControllerForForgetPassword;
  TextEditingController? forgetPasswordEmailController;
  TextEditingController? codeControllerWithPhone;
  TextEditingController? codeControllerWithEmail;
  TextEditingController? newPasswordController;
  TextEditingController? confirmNewPasswordController;
  initAllController() {
    emailControllerForRegister = TextEditingController();
    passwordControllerForRegister = TextEditingController();
    userNameControllerForRegister = TextEditingController();
    fullNameControllerForRegister = TextEditingController();
    confirmPasswordControllerForRegister = TextEditingController();
    phoneControllerForRegister = TextEditingController();
    phoneControllerForForgetPassword = TextEditingController();
    forgetPasswordEmailController = TextEditingController();
    codeControllerWithPhone = TextEditingController();
    codeControllerWithEmail=TextEditingController();
    newPasswordController=TextEditingController();
    confirmNewPasswordController=TextEditingController();
    emit(InitAllControllerState());
  }

  void toggleVisiableForRegister() {
    isVisiableForRegister = !isVisiableForRegister;
    emit(IsVisiableChangedForRegister());
  }

  void toggleVisiableForRegisterConfirmPassword() {
    isVisiableForRegisterForConfrimPassword =
        !isVisiableForRegisterForConfrimPassword;
    emit(IsVisiableChangedForConfrimPasswordState());
  }
 void toggleVisiableForNewPassword() {
    isVisiableNewPassword =
        !isVisiableNewPassword;
    emit(IsVisiableChangedForNewPasswordState());
  }

  void toggleVisiableForConfirmPassword() {
    isVisiableForRegisterForConfrimPassword =
        !isVisiableForRegisterForConfrimPassword;
    emit(IsVisiableChangedForConfrimPasswordState());
  }
  final List<Map<String, String>> countryCodes = [
    {"name": "Egypt", "dial_code": "+20", "code": "EG"},
    {"name": "United States", "dial_code": "+1", "code": "US"},
    {"name": "United Kingdom", "dial_code": "+44", "code": "GB"},
    {"name": "India", "dial_code": "+91", "code": "IN"},
    {"name": "Germany", "dial_code": "+49", "code": "DE"},
    {"name": "Saudi Arabia", "dial_code": "+966", "code": "SA"},
    {"name": "France", "dial_code": "+33", "code": "FR"},
    {"name": "Canada", "dial_code": "+1", "code": "CA"},
    {"name": "Australia", "dial_code": "+61", "code": "AU"},
  ];
  String selectedDialCode = '+20'; //20
  String selectedDialCodeForForgetPassword = '+20';

  void setSelectedDialCode(String value) {
    selectedDialCode = value;
    emit(SelectedDialCodeChanged());
  }

  void setSelectedDialCodeForForgetPassword(String value) {
    selectedDialCodeForForgetPassword = value;
    emit(SelectedDialCodeChangedForForgetPassword());
  }

  Timer? timer;
  int start = 46; // Start from 46 seconds

  String get formattedTime {
    final minutes = (start ~/ 60).toString().padLeft(2, '0');
    final seconds = (start % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  void startTimer() {
    emit(TimerStartedLoadingState());
    start = 46;
    timer?.cancel();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
    emit(TimerStartedState());

      if (start == 0) {
        timer.cancel();
      } else {
        start--;
      }
    });
  }
  initTimer(){
    startTimer();
    emit(InitTimerState());
  }
}
