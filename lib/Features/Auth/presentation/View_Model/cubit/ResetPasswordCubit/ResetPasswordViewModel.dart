
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/Features/Auth/domain/UseCase/ResetPasswordUseCase.dart';

import 'ResetPasswordState.dart';

class ResetPasswordViewModel extends Cubit<ResetPasswordState>{
  ResetPasswordUseCase resetPasswordUseCase;

  ResetPasswordViewModel(this.resetPasswordUseCase) :super(ResetPasswordInitState());

  Future<void>resetPassword(String newPassword,String email)async{
    emit(ResetPasswordLoadingState());
    var response = await resetPasswordUseCase.call(newPassword,email);
    response.fold(
        (error) {
          emit(ResetPasswordFailureState(error.errorMessage));
        },
        (data) {
          emit(ResetPasswordSuccessState(data));
        },);
  }


}