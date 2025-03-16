import 'correct_question.dart';
import 'wrong_question.dart';

class CheckAnswerModel {
  String? message;
  int? correct;
  int? wrong;
  String? total;
  List<WrongQuestion>? wrongQuestions;
  List<CorrectQuestion>? correctQuestions;

  CheckAnswerModel({
    this.message,
    this.correct,
    this.wrong,
    this.total,
    this.wrongQuestions,
    this.correctQuestions,
  });

  factory CheckAnswerModel.fromJson(Map<String, dynamic> json) {
    return CheckAnswerModel(
      message: json['message'] as String?,
      correct: json['correct'] as int?,
      wrong: json['wrong'] as int?,
      total: json['total'] as String?,
      wrongQuestions: (json['WrongQuestions'] as List<dynamic>?)
          ?.map((e) => WrongQuestion.fromJson(e as Map<String, dynamic>))
          .toList(),
      correctQuestions: (json['correctQuestions'] as List<dynamic>?)
          ?.map((e) => CorrectQuestion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'correct': correct,
        'wrong': wrong,
        'total': total,
        'WrongQuestions': wrongQuestions?.map((e) => e.toJson()).toList(),
        'correctQuestions': correctQuestions?.map((e) => e.toJson()).toList(),
      };
}

class QuestionResult {
  final String qid;
  final String question;
  final String correctAnswer;
  final String? incorrectAnswer;
  final Map<String, dynamic> answers;

  QuestionResult({
    required this.qid,
    required this.question,
    required this.correctAnswer,
    this.incorrectAnswer,
    required this.answers,
  });

  factory QuestionResult.fromJson(Map<String, dynamic> json) {
    return QuestionResult(
      qid: json['QID'] ?? '',
      question: json['Question'] ?? '',
      correctAnswer: json['correctAnswer'] ?? '',
      incorrectAnswer: json['inCorrectAnswer'],
      answers: json['answers'] is Map ? json['answers'] : {},
    );
  }
}
