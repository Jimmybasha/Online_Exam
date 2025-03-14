import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/Core/Errors/Failure.dart';
import 'package:online_exam/Features/Home/data/data_source/questions_data_source/questions_remote_data_source.dart';
import 'package:online_exam/Features/Home/domain/repos/questions_repo.dart';

import '../models/all_questions_on_exam/all_questions_on_exam_model.dart';

@Injectable(as: QuestionsRepo)
class QuestionsRepoImpl implements QuestionsRepo {
  final QuestionsRemoteDataSource questionsRemoteDataSource;

  QuestionsRepoImpl({required this.questionsRemoteDataSource});
  @override
  Future<Either<Failure, AllQuestionsOnExamModel>> getAllQuestionsOnExam(
      {required String examId}) async {
    try {
      var data =await questionsRemoteDataSource.getAllQuestionsOnExam(examId: examId);
      log('in QuestionsRepoImpl $data');
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        log('error in QuestionsRepoImpl ${e.toString()}');
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }

  }
}
