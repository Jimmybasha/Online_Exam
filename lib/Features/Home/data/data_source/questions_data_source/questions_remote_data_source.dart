import 'package:online_exam/Features/Home/data/models/get_all_questions_on_exam/get_all_questions_on_exam_model.dart';

abstract class QuestionsRemoteDataSource {
  Future<AllQuestionsOnExamModel> getAllQuestionsOnExam({required String examId});
}