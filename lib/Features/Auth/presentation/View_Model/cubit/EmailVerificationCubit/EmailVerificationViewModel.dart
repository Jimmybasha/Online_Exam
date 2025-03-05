
import 'package:flutter/cupertino.dart';
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

   static void onOtpChange(String value, int index,BuildContext context,String otpCode,List<FocusNode> focusNodes) {

      if (value.isNotEmpty && index < 5) {
        FocusScope.of(context).requestFocus(focusNodes[index + 1]);
      } else if (value.isEmpty && index > 0) {
        FocusScope.of(context).requestFocus(focusNodes[index - 1]);
      }

      if (otpCode.length == 6) {
        print("OTP Entered: $otpCode"); // Debugging print statement
        context.read<EmailVerificationViewModel>().verifyPassword(otpCode);
      }
    }

}