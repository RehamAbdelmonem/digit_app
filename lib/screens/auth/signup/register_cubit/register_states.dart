
abstract class RegisterStates{}
class InitializeRegisterState extends RegisterStates{}
class LoadingRegisterState extends RegisterStates{}
class SuccessesRegisterState extends RegisterStates{}
class ErrorRegisterState extends RegisterStates{
  final String error;
  ErrorRegisterState(this.error);

}
class SuccessesCreateUserState extends RegisterStates{}
class ErrorCreateUserState extends RegisterStates{
  final String error;
  ErrorCreateUserState(this.error);

}
class SuccessesCreateOwnerState extends RegisterStates{}
class ErrorCreateOwnerState extends RegisterStates{
  final String error;
  ErrorCreateOwnerState(this.error);

}

class SuccessesCreateLabState extends RegisterStates{}

class SuccessesCreateLabRatingState extends RegisterStates{}

class ErrorCreateLabState extends RegisterStates{
  final String error;
  ErrorCreateLabState(this.error);

}

class UploadImageSuccessState extends RegisterStates{}
class UploadImageErrorState extends RegisterStates{}




class ChangeVisibilityState extends RegisterStates{}
class ChangeGenderState extends RegisterStates{}

class ChooseStatusState extends RegisterStates{}


class ChangeLanguageState extends RegisterStates{}
