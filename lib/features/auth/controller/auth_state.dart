abstract class AuthState {}

class AuthInitial extends AuthState {}
class IsRemeberMeChanged extends AuthState {}
class IsVisiableChangedForLogin extends AuthState {}
class IsVisiableChangedForRegister extends AuthState {}
class IsVisiableChangedForConfrimPasswordState extends AuthState {}
class SelectedDialCodeChanged extends AuthState {}
class SelectedDialCodeChangedForForgetPassword extends AuthState {}
// class InitAllControllersForForgetPasswordState  extends AuthState {}
// class DisposeAllControllersForForgetPasswordState extends AuthState {}
class ClearAllDataForgetPasswordControllerState extends AuthState {}
// class InitCodeControllerWithPhoneState extends AuthState {}
class InitAllControllerState extends AuthState{}
class InitTimerState extends AuthState{}
class TimerStartedState extends AuthState{}
class TimerStartedLoadingState extends AuthState{}
class IsVisiableChangedForNewPasswordState extends AuthState {}
