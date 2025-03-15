import 'package:dartz/dartz.dart';
import 'package:online_exam/Core/Errors/Failure.dart';
import 'package:online_exam/Features/Home/data/models/check_answers_model/check_answer_model/check_answer_model.dart';

abstract class CheckAnswersRepo {
  Future<Either<Failure, CheckAnswerModel>> checkAnswers(
      {required Map<String, dynamic> data});
}
