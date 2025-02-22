import 'package:dartz/dartz.dart';
import 'package:online_exam/Core/Errors/Failure.dart';
import 'package:online_exam/Features/Auth/data/Models/user_model.dart';


abstract class AuthRepo {
  Future<Either<Failure, UserModel>> loginUser(
      {required String email, required String password});
}
