import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:online_exam/Features/Profile/Profile/data/models/user_info_model/user_info_model/user_info_model.dart';
import 'package:online_exam/Features/Profile/Profile/domain/use_cases/user_info_use_case.dart';

part 'user_info_state.dart';

class UserInfoCubit extends Cubit<UserInfoState> {
  UserInfoCubit(this.userInfoUseCase) : super(UserInfoInitial());
  final UserInfoUseCase userInfoUseCase;
  Future<void> getUserData() async {
    emit(UserInfoLoading());
    var result = await userInfoUseCase.call();
    result.fold(
      (failure) => emit(UserInfoFailure(errorMessage: failure.errorMessage)),
      (user) => emit(UserInfoSuccess(userInfoModel: user)),
    );
  }
}
