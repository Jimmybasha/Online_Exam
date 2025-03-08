import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/Core/Errors/Failure.dart';
import 'package:online_exam/Features/Home/data/data_source/exam_data_source/exam_remote_data_source.dart';
import 'package:online_exam/Features/Home/data/models/all_exmas_on_subjects_model/get_all_exams_on_subjects_model/get_all_exams_on_subjects_model.dart';
import 'package:online_exam/Features/Home/domain/repos/exams_repo.dart';

@Injectable(as: ExamsRepo)
class ExamsRepoImpl implements ExamsRepo {
  final ExamRemoteDataSource examRemoteDataSource;

  ExamsRepoImpl({required this.examRemoteDataSource});
  @override
  Future<Either<Failure, AllExamsOnSubjectsModel>> getAllExamsOnSubjects(
      {required String subjId}) async {
    try {
      var data =
          await examRemoteDataSource.getAllExamsOnSubjects(subjId: subjId);
          log('in ExamsRepoImpl $data');
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        log('error in ExamsRepoImpl ${e.toString()}');
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
