abstract class ProfileState {}

class InitialProfileState extends ProfileState {}

class LoadingGetFirebaseAuthCurrentUsername extends ProfileState {}

class SuccessfulGetFirebaseAuthCurrentUsername extends ProfileState {}

class FailGetFirebaseAuthCurrentUsername extends ProfileState {}

class LoadingChangePassword extends ProfileState {}

class SuccessfulChangePassword extends ProfileState {}

class FailChangePassword extends ProfileState {}

class LoadingFirebaseLogout extends ProfileState {}

class FailureFirebaseLogout extends ProfileState {}

class SuccessfulFirebaseLogout extends ProfileState {}
