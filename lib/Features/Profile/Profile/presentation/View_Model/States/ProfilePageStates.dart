sealed class ProfilePageState {}

class ProfilePageInitState extends ProfilePageState {}

class ProfilePageLoadingState extends ProfilePageState {}

class ProfilePageFailureState extends ProfilePageState {
  String error;
  ProfilePageFailureState(this.error);
}

class ProfilePageSuccessState extends ProfilePageState {
  Map<String, dynamic> user;
  ProfilePageSuccessState(this.user);
}
