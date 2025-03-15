import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/Core/Errors/Failure.dart';

import 'package:online_exam/Features/Home/data/data_source/score_data_source/check_answers_remote_data_source.dart';
import 'package:online_exam/Features/Home/data/models/check_answers_model/check_answer_model/check_answer_model.dart';
import 'package:online_exam/Features/Home/domain/repos/check_answers_repo.dart';

@Injectable(as: CheckAnswersRepo)
class CheckAnswersRepoImpl implements CheckAnswersRepo {
  final CheckAnswersDataSource checkAnswersDataSource;

  CheckAnswersRepoImpl({required this.checkAnswersDataSource});
  @override
  Future<Either<Failure, CheckAnswerModel>> checkAnswers(
      {required Map<String, dynamic> data}) async {
    try {
      var response = await checkAnswersDataSource.checkAnswers(data: data);
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        log("error in CheckAnswersRepoImpl ${e.toString()}");
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
