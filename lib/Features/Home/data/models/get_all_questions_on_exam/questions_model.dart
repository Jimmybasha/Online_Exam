import 'package:online_exam/Features/Home/data/models/get_all_questions_on_exam/answer_model.dart';
import 'package:online_exam/Features/Home/data/models/get_all_questions_on_exam/exam_model.dart';
import 'package:online_exam/Features/Home/data/models/get_all_questions_on_exam/subject_model.dart';

class QuestionModel {
  final String id;
  final String question;
  final String type;
  final String correct;
  final SubjectModel subject;
  final ExamModel exam;
  final DateTime createdAt;
  final List<AnswerModel> answers;

  QuestionModel({
    required this.id,
    required this.question,
    required this.type,
    required this.correct,
    required this.subject,
    required this.exam,
    required this.createdAt,
    required this.answers,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      id: json['_id'],
      question: json['question'],
      type: json['type'],
      correct: json['correct'],
      subject: SubjectModel.fromJson(json['subject']),
      exam: ExamModel.fromJson(json['exam']),
      createdAt: DateTime.parse(json['createdAt']),
      answers: List<AnswerModel>.from(
        json['answers'].map((x) => AnswerModel.fromJson(x)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'question': question,
      'type': type,
      'correct': correct,
      'subject': subject.toJson(),
      'exam': exam.toJson(),
      'createdAt': createdAt.toIso8601String(),
      'answers': List<dynamic>.from(answers.map((x) => x.toJson())),
    };
  }
}