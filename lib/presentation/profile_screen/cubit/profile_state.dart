abstract class ProfileState {}

class InitialProfileState extends ProfileState {}

class LoadingGetFirebaseAuthCurrentUsername extends ProfileState {}

class SuccessfulGetFirebaseAuthCurrentUsername extends ProfileState {}

class FailGetFirebaseAuthCurrentUsername extends ProfileState {}

class LoadingChangeGander extends ProfileState {}

class SuccessfulChangeGander extends ProfileState {}

class FailChangeGander extends ProfileState {}
