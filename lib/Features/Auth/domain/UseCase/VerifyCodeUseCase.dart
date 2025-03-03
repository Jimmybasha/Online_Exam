import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/Core/Errors/Failure.dart';
import 'package:online_exam/Features/Auth/domain/repos/AuthRepo.dart';

@injectable
class VerifyCodeUseCase {
  final AuthRepo authRepo;

  VerifyCodeUseCase({required this.authRepo});
  Future<Either<Failure, Map<String,dynamic>>> call({required String email}) async {
    return await authRepo.forgetPassword(email: email);
  }
}