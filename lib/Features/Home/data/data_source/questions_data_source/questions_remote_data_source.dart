import 'package:online_exam/Features/Home/data/models/all_questions_on_exam/all_questions_on_exam_model.dart';

abstract class QuestionsRemoteDataSource {
  Future<AllQuestionsOnExamModel> getAllQuestionsOnExam({required String examId});
}