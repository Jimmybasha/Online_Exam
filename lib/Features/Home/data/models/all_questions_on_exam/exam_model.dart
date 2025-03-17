class ExamModel {
  final String? id;
  final String? title;
  final num? duration;
  final String? subject;
  final int? numberOfQuestions;
  final bool? active;
  final DateTime? createdAt;

  ExamModel({
    this.id,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
  });

  factory ExamModel.fromJson(Map<String, dynamic> json) {
    return ExamModel(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      duration: json['duration'] as num?,
      subject: json['subject'] as String?,
      numberOfQuestions: json['numberOfQuestions'],
      active: json['active'],
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'duration': duration,
      'subject': subject,
      'numberOfQuestions': numberOfQuestions,
      'active': active,
      'createdAt': createdAt?.toIso8601String(),
    };
  }

  String examCategory(String examTitle) {
    final lowerTitle = examTitle.toLowerCase();

    if (lowerTitle.contains('html') ||
        lowerTitle.contains('c++') ||
        lowerTitle.contains('flutter') ||
        lowerTitle.contains('java') ||
        lowerTitle.contains('python') ||
        lowerTitle.contains('javascript') ||
        lowerTitle.contains('dart')) {
      return 'Programming';
    } else {
      return 'Unknown';
    }
  }
}
