

sealed class ForgetPasswordState{


}



class ForgetPasswordInitState extends ForgetPasswordState{}

class ForgetPasswordLoadingState extends ForgetPasswordState{}

class ForgetPasswordSuccessState extends ForgetPasswordState{
  // {
  //     "message": "success",
  //     "info": "OTP sent to your email"
  // }
  Map<String,dynamic> res;

  ForgetPasswordSuccessState(this.res);
}

class ForgetPasswordFailureState extends ForgetPasswordState{
  String err;
  ForgetPasswordFailureState(this.err);
}



