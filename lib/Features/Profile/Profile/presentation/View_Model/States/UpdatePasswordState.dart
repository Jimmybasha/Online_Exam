sealed class UpdatePasswordState {}

class UpdatePasswordInitState extends UpdatePasswordState {}

class UpdatePasswordLoadingState extends UpdatePasswordState {}

class UpdatePasswordFailureState extends UpdatePasswordState {
  String error;
  UpdatePasswordFailureState(this.error);
}

class UpdatePasswordSuccessState extends UpdatePasswordState {
  Map<String, dynamic> data;
  UpdatePasswordSuccessState(this.data);
}
