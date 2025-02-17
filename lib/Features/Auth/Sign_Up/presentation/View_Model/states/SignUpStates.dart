

import 'package:online_exam/Core/ApiManager/ApiResult.dart';

sealed class SignUpState{}

class SignUpLoadingState extends SignUpState{}

class SignUpInitState extends SignUpState{}

class SignUpSuccessState extends SignUpState{
  String message;
  SignUpSuccessState(this.message);
}

class SignUpFailureState extends SignUpState{
String err;
SignUpFailureState(this.err);
}
