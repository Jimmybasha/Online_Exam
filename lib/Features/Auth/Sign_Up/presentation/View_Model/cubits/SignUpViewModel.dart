
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/Core/ApiManager/ApiResult.dart';
import 'package:online_exam/Features/Auth/Sign_Up/domain/use_cases/SignUpUseCase.dart';

import '../../../../../../Core/Errors/Failure.dart';
import '../states/SignUpStates.dart';
@injectable
class SignUpViewModel extends Cubit<SignUpState>{
  SignUpUseCase signUpUseCase;
  SignUpViewModel(this.signUpUseCase):super(SignUpInitState());

  Future<void> signUpUser(
      String username,
      String firstName,
      String lastName,
      String email,
      String password,
      String phone,
      String rePassword,
      )async{
    emit(SignUpLoadingState());
    var apiResult = await signUpUseCase.call(username, firstName, lastName, email, password, phone, rePassword);
    print("APi Result in the signUpLoadingState apiResult : ${apiResult}");

    switch(apiResult){
      case SuccessApiResult():
        print(" apiResult.Data in the SuccessApiResult :  ${apiResult.data?.user?.message??"Nothing appeared"}");
        emit(
          SignUpSuccessState(apiResult.data?.user?.message??"")
        );
      case ErrorApiResult():
        final error = apiResult.exception; // Extract error
        print(error.toString());
        String errorMessage;

        if (error is DioException) {
          errorMessage = ServerFailure.fromDioException(error).errorMessage;
        } else {
          errorMessage = "Unexpected error. Please try again.";
        }

        print("Failure: $errorMessage");
        emit(
            SignUpFailureState(errorMessage)
        );
        break;
    }

  }


}