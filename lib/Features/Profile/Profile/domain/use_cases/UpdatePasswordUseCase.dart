
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/Features/Profile/Profile/domain/repositories/ResetPasswordRepo.dart';

import '../../../../../Core/Errors/Failure.dart';

@injectable
class UpdatePasswordUseCase{
  ResetPasswordRepo resetPasswordRepo;
  UpdatePasswordUseCase(this.resetPasswordRepo);
  Future<Either<Failure,Map<String,dynamic>>> call(String currentPassword , String newPassword)async{
    return await resetPasswordRepo.resetPassword({
      "oldPassword":currentPassword,
      "password":newPassword,
      "rePassword":newPassword
    });


  }
}