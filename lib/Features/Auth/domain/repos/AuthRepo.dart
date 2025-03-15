import 'package:dartz/dartz.dart';
import 'package:online_exam/Core/Errors/Failure.dart';
import 'package:online_exam/Features/Auth/data/Models/user_model/user_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserModel>> loginUser(
      {required String email, required String password});

  Future<Either<Failure, Map<String, dynamic>>> forgetPassword(
      {required String email});

  Future<Either<Failure, Map<String, dynamic>>> verifyCode(
      {required String resetCode});

  Future<Either<Failure, Map<String, dynamic>>> resetPassword(
      {required String newPassword, required String email});
}
