import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/Core/Errors/Failure.dart';
import 'package:online_exam/Features/Profile/Profile/data/data_sources/ResetPasswordDataSource/ResetPasswordRemoteDataSource.dart';
import 'package:online_exam/Features/Profile/Profile/domain/repositories/ResetPasswordRepo.dart';

@Injectable(as: ResetPasswordRepo)
class ResetPasswordRepoImpl implements ResetPasswordRepo {
  ResetPasswordRemoteDataSource resetPasswordRemoteDataSource;

  ResetPasswordRepoImpl(this.resetPasswordRemoteDataSource);
  @override
  Future<Either<Failure, Map<String, dynamic>>> resetPassword(
      Map<String, dynamic> data) async {
    try {
      var resp = await resetPasswordRemoteDataSource.resetPassword(data);

      return right(resp);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        log("error in ProfileRepoImpl: ${e.toString()}");
        return left(ServerFailure(errorMessage: 'Something went wrong'));
      }
    }
  }
}
