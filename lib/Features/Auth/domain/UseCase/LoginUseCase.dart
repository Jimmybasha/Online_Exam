import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/Core/Errors/Failure.dart';
import 'package:online_exam/Features/Auth/data/Models/user_model.dart';
import 'package:online_exam/Features/Auth/domain/repos/AuthRepo.dart';
@injectable
class LoginUseCase {
  final AuthRepo authRepo;

  LoginUseCase({required this.authRepo});
  Future<Either<Failure, UserModel>> call(
      {required String email, required String password}) async {
    return await authRepo.loginUser(email: email, password: password);
  }
}
