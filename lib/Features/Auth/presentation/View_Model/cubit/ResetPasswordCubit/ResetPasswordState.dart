sealed class ResetPasswordState {}

class ResetPasswordInitState extends ResetPasswordState {}

class ResetPasswordLoadingState extends ResetPasswordState {}

class ResetPasswordSuccessState extends ResetPasswordState {
  Map<String, dynamic> data;
  ResetPasswordSuccessState(this.data);
}

class ResetPasswordFailureState extends ResetPasswordState {
  String err;
  ResetPasswordFailureState(this.err);
}
