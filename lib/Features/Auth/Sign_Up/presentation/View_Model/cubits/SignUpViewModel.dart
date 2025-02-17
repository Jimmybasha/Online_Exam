
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/Core/ApiManager/ApiResult.dart';
import 'package:online_exam/Features/Auth/Sign_Up/domain/use_cases/SignUpUseCase.dart';
import 'package:online_exam/main.dart';

import '../../../../../../Core/Errors/Failure.dart';
import '../../../../Login/presentation/view/LoginScreen.dart';
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
    log("APi Result in the signUpLoadingState apiResult : $apiResult");

    switch(apiResult){
      case SuccessApiResult():
        log(" apiResult.Data in the SuccessApiResult :  ${apiResult.data?.user?.message??"Nothing appeared"}");
        emit(
          SignUpSuccessState(apiResult.data?.user?.message??"")
        );

      case ErrorApiResult():
        final error = apiResult.exception; // Extract error
        log(error.toString());
        String errorMessage;

        if (error is DioException) {
          errorMessage = ServerFailure.fromDioException(error).errorMessage;
        } else {
          errorMessage = "Unexpected error. Please try again.";
        }

        log("Failure: $errorMessage");
        emit(
            SignUpFailureState(errorMessage)
        );
        break;
    }

  }

  void navigateToLogin(){
    log("Navigating to LoginScreen..."); // Debugging line
    navigatorKey.currentState?.pushNamed(LoginScreen.id);
  }


}