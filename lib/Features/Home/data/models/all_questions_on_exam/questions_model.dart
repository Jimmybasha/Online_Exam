import 'package:online_exam/Features/Home/data/models/all_questions_on_exam/answer_model.dart';
import 'package:online_exam/Features/Home/data/models/all_questions_on_exam/exam_model.dart';

class QuestionModel {
  final String? id;
  final String? question;
  final String? type;
  final String? correct;
 
  final ExamModel? exam;
  final DateTime? createdAt;
  final List<AnswerModel>? answers;

  QuestionModel({
    this.id,
    this.question,
    this.type,
    this.correct,
   
    this.exam,
    this.createdAt,
    this.answers,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      id: json['_id'] as String?,
      question: json['question']  as String?,
      type: json['type']  as String?,
      correct: json['correct']  as String?,
      
      exam: json['exam'] != null ? ExamModel.fromJson(json['exam']) : null,
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      answers: json['answers'] != null
          ? List<AnswerModel>.from(
              json['answers'].map((x) => AnswerModel.fromJson(x)),
            )
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'question': question,
      'type': type,
      'correct': correct,

      'exam': exam?.toJson(),
      'createdAt': createdAt?.toIso8601String(),
      'answers': answers != null
          ? List<dynamic>.from(answers!.map((x) => x.toJson()))
          : null,
    };
  }
}