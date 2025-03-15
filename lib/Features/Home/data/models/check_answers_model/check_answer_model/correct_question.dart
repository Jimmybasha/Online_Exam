import 'answers.dart';

class CorrectQuestion {
  String? qid;
  String? question;
  String? correctAnswer;
  Answers? answers;

  CorrectQuestion({
    this.qid,
    this.question,
    this.correctAnswer,
    this.answers,
  });

  factory CorrectQuestion.fromJson(Map<String, dynamic> json) {
    return CorrectQuestion(
      qid: json['QID'] as String?,
      question: json['Question'] as String?,
      correctAnswer: json['correctAnswer'] as String?,
      answers: json['answers'] == null
          ? null
          : Answers.fromJson(json['answers'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'QID': qid,
        'Question': question,
        'correctAnswer': correctAnswer,
      };
}
