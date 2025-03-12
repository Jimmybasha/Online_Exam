import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/Core/Errors/Failure.dart';
import 'package:online_exam/Features/Profile/Profile/data/data_sources/ProfileRemoteDataSource.dart';
import 'package:online_exam/Features/Profile/Profile/domain/repositories/ProfileRepo.dart';

@Injectable(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo{
  ProfileRemoteDataSource profileRemoteDataSource;
  ProfileRepoImpl(this.profileRemoteDataSource);
  @override
  Future<Either<Failure, Map<String,dynamic>>> updateProfile(Map<String,dynamic> userData)async {
    // TODO: implement updateProfile
    try{
    var resp =  await profileRemoteDataSource.updateProfileData(userData);
      return right(resp);
    }catch(e){
      if(e is DioException){
        return left(ServerFailure.fromDioException(e));
      }else {
        log("error in ProfileRepoImpl: ${e.toString()}");
        return left(ServerFailure(errorMessage: 'Something went wrong'));
      }
    }
  }

}