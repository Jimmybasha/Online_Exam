import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/Features/Auth/domain/UseCase/ForgetPasswordUseCase.dart';
import 'package:online_exam/Features/Auth/presentation/View_Model/cubit/ForgetPassworCubit/ForgetPasswordState.dart';

@injectable
class ForgetPasswordViewModel extends Cubit<ForgetPasswordState> {
  ForgetPasswordUseCase forgetPasswordUseCase;

  ForgetPasswordViewModel(this.forgetPasswordUseCase)
      : super(ForgetPasswordInitState());

  Future<void> forgetPassword(String email) async {
    emit(ForgetPasswordLoadingState());

    var result = await forgetPasswordUseCase.call(email: email);

    result.fold(
      (failure) {
        emit(ForgetPasswordFailureState(failure.errorMessage));
      },
      (response) {
        emit(ForgetPasswordSuccessState(response));
      },
    );
  }
}
