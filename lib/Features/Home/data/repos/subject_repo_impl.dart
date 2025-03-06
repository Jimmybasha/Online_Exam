import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/Core/Errors/Failure.dart';
import 'package:online_exam/Features/Home/data/data_source/subjects_remote_data_source.dart';
import 'package:online_exam/Features/Home/data/models/subjects_model/subjects_model.dart';
import 'package:online_exam/Features/Home/domain/repos/subjects_repo.dart';

@Injectable(as: SubjectsRepo)
class SubjectRepoImpl implements SubjectsRepo {
  final SubjectsRemoteDataSource subjectsRemoteDataSource;

  SubjectRepoImpl({required this.subjectsRemoteDataSource});
  @override
  Future<Either<Failure, SubjectsModel>> getAllSubjects() async {
    try {
      var data = await subjectsRemoteDataSource.getAllSubjects();
      log(data.toString());
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      log("error in SubjectRepoImpl ${e.toString()}");
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
