
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/Features/Auth/data/Models/user_model.dart';
import 'package:online_exam/Features/Auth/domain/UseCase/LoginUseCase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginUseCase) : super(LoginInitial());
  final LoginUseCase loginUseCase;
  Future<void> loginUser(
      {required String email, required String password}) async {
    emit(LoginLoading());
    var result = await loginUseCase.call(email: email, password: password);
    result.fold((failure) {
      emit(LoginFailure(errorMessage: failure.errorMessage));
    }, (user) {
      emit(LoginSuccess(userModel: user));
    });
  }
}
