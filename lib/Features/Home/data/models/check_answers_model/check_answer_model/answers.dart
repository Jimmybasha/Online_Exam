class Answers {
  // Add any properties your Answer class needs
  // For example, if it's just a map of data:
  final Map<String, dynamic> data;

  Answers({required this.data});

  factory Answers.fromJson(Map<String, dynamic> json) {
    return Answers(
      data: json,
    );
  }
}