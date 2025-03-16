import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/Core/Errors/Failure.dart';
import 'package:online_exam/Features/Profile/Profile/data/data_sources/user_info_data_source/user_info_remote_data_source.dart';
import 'package:online_exam/Features/Profile/Profile/data/models/user_info_model/user_info_model/user_info_model.dart';
import 'package:online_exam/Features/Profile/Profile/domain/repositories/user_info_repo.dart';

@Injectable(as: UserInfoRepo)
class UserInfoRepoImpl implements UserInfoRepo {
  final UserInfoRemoteDataSource userInfoRemoteDataSource;

  UserInfoRepoImpl({required this.userInfoRemoteDataSource});

  @override
  Future<Either<Failure, UserInfoModel>> getUserData() async {
    try {
      final user = await userInfoRemoteDataSource.getUserData();
      return Right(user);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        log("UserInfoRepoImpl: ${e.toString()}");
        return Left(ServerFailure(errorMessage: e.toString()));
      }

    }
  }
}
