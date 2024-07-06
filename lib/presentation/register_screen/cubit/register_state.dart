abstract class RegisterState {}

class RegisterInitialStats extends RegisterState {}

class SuccessfulFireAuthRegisterProcess extends RegisterState {}

class LoadingFireAuthRegisterProcess extends RegisterState {}

class FailFireAuthRegisterProcess extends RegisterState {}

class SuccessfulFireStoreRegisterProcess extends RegisterState {}

class LoadingFireStoreRegisterProcess extends RegisterState {}

class FailFireStoreRegisterProcess extends RegisterState {}

class ChangeBrancheInDropdown extends RegisterState {}
