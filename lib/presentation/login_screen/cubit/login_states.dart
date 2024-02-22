abstract class LoginState {}

class LoginInitialStats extends LoginState {}

class SuccessfulLoginProcess extends LoginState {}

class LoadingLoginProcess extends LoginState {}

class FailLoginProcess extends LoginState {}

class SuccessfulGoogleLoginProcess extends LoginState {}

class FailGoogleLoginProcess extends LoginState {}

class SuccessfulForgetProcess extends LoginState {}

class FailForgetProcess extends LoginState {}
