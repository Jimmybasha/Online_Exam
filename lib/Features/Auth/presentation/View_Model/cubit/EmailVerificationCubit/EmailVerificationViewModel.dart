
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/Features/Auth/domain/UseCase/VerifyCodeUseCase.dart';
import 'package:online_exam/Features/Auth/presentation/View_Model/cubit/EmailVerificationCubit/EmailVerificationState.dart';

class EmailVerificationViewModel extends Cubit<EmailVerificationState>{

    VerifyCodeUseCase verifyCodeUseCase;

    EmailVerificationViewModel(this.verifyCodeUseCase):super(EmailVerificationInitState());


    Future<void> verifyPassword(String passCode)async{

      emit(EmailVerificationLoadingState());

      var result = await  verifyCodeUseCase.call(passCode: passCode);

      result.fold(
          (error) {
            print("Verification Failed: ${error.errorMessage}"); // Debugging print statement
            emit(EmailVerificationFailureState(error.errorMessage));
          },
          (status) {
            print("Verification Success: ${status['status']}"); // Debugging print statement
            emit(EmailVerificationSuccessState(status['status']));
          },

      );

    }


}