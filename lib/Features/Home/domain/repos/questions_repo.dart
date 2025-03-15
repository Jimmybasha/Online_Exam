import 'package:dartz/dartz.dart';
import 'package:online_exam/Core/Errors/Failure.dart';

import '../../data/models/all_questions_on_exam/all_questions_on_exam_model.dart';

abstract class QuestionsRepo {
  Future<Either<Failure, AllQuestionsOnExamModel>> getAllQuestionsOnExam(
      {required String examId});
}
