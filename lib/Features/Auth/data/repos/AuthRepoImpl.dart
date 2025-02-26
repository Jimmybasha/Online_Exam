import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/Core/Errors/Failure.dart';
import 'package:online_exam/Features/Auth/data/Data_Source/AuthRemoteDataSource.dart';
import 'package:online_exam/Features/Auth/data/Models/user_model/user_model.dart';
import 'package:online_exam/Features/Auth/domain/repos/AuthRepo.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepoImpl({required this.authRemoteDataSource});
  @override
  Future<Either<Failure, UserModel>> loginUser(
      {required String email, required String password}) async {
    try {
      var user = await authRemoteDataSource.loginUser(
          email: email, password: password);
      return right(user);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        if (e.toString() == "incorrect email or password") {
          return left(
              ServerFailure(errorMessage: "incorrect email or password"));
        } else if (e.toString() == "\"email\" must be a valid email") {
          return left(ServerFailure(errorMessage: 'Invalid Email format'));
        } else {
          log("error in AuthRepoImpl: ${e.toString()}");
          return left(ServerFailure(errorMessage: 'Something went wrong'));
        }
      }
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> forgetPassword(
      {required String email}) async {
    try {
      var data = await authRemoteDataSource.forgetPassword(email: email);
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        log("error in AuthRepoImpl: ${e.toString()}");
        return left(ServerFailure(errorMessage: 'Something went wrong'));
      }
    }
  }
}
