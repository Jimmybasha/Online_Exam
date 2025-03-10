import 'package:online_exam/Features/Home/data/models/get_all_questions_on_exam/questions_model.dart';

class GetAllQuestionsOnExamModel {
  final String message;
  final List<QuestionModel> questions;

  GetAllQuestionsOnExamModel({
    required this.message,
    required this.questions,
  });

  factory GetAllQuestionsOnExamModel.fromJson(Map<String, dynamic> json) {
    return GetAllQuestionsOnExamModel(
      message: json['message'],
      questions: List<QuestionModel>.from(
        json['questions'].map((x) => QuestionModel.fromJson(x)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'questions': List<dynamic>.from(questions.map((x) => x.toJson())),
    };
  }
}
