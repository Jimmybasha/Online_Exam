import 'package:dartz/dartz.dart';
import 'package:online_exam/Core/Errors/Failure.dart';
import 'package:online_exam/Features/Home/data/models/get_all_questions_on_exam/get_all_questions_on_exam_model.dart';

abstract class QuestionsRepo {
  Future<Either<Failure, AllQuestionsOnExamModel>> getAllQuestionsOnExam({required String examId});
}
