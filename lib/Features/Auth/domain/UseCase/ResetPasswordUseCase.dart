import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/Features/Auth/domain/repos/AuthRepo.dart';

import '../../../../Core/Errors/Failure.dart';

@injectable
class ResetPasswordUseCase {
  AuthRepo authRepo;
  ResetPasswordUseCase(this.authRepo);

  Future<Either<Failure, Map<String, dynamic>>> call(
      String newPassword, String email) async {
    return await authRepo.resetPassword(newPassword: newPassword, email: email);
  }
}
