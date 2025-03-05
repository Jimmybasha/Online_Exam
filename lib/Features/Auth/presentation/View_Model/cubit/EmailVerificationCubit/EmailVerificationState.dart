sealed class EmailVerificationState{}

class EmailVerificationInitState extends EmailVerificationState{}

class EmailVerificationLoadingState extends EmailVerificationState{}


class EmailVerificationSuccessState extends EmailVerificationState{

  String status;
  EmailVerificationSuccessState(this.status);


}

class EmailVerificationFailureState extends EmailVerificationState{

  String error;

  EmailVerificationFailureState(this.error);

}