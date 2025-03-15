import 'package:online_exam/Features/Home/data/models/check_answers_model/check_answer_model/check_answer_model.dart';

abstract class CheckAnswersDataSource {
  Future<CheckAnswerModel> checkAnswers({required Map<String, dynamic> data});
}
