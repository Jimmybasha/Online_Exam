import 'package:online_exam/Features/Home/data/models/all_questions_on_exam/questions_model.dart';

class AllQuestionsOnExamModel {
  final List<QuestionModel> questions;

  AllQuestionsOnExamModel({
    required this.questions,
  });

  factory AllQuestionsOnExamModel.fromJson(Map<String, dynamic> json) {
    return AllQuestionsOnExamModel(
      questions: List<QuestionModel>.from(
        json['questions'].map((x) => QuestionModel.fromJson(x)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'questions': List<dynamic>.from(questions.map((x) => x.toJson())),
    };
  }
}
