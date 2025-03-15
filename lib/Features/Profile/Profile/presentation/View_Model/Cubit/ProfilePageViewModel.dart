import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/Features/Profile/Profile/domain/use_cases/UpdateProfileDataUseCase.dart';
import 'package:online_exam/Features/Profile/Profile/presentation/View_Model/States/ProfilePageStates.dart';

class ProfilePageViewModel extends Cubit<ProfilePageState> {
  UpdateProfileDataUseCase updateProfileDataUseCase;
  ProfilePageViewModel(this.updateProfileDataUseCase)
      : super(ProfilePageInitState());

  Future<void> updateProfile(Map<String, dynamic> userdata) async {
    emit(ProfilePageLoadingState());
    var result = await updateProfileDataUseCase.call(userdata);
    result.fold(
      (failure) {
        emit(ProfilePageFailureState(failure.errorMessage));
      },
      (user) {
        emit(ProfilePageSuccessState(user));
      },
    );
  }
}
