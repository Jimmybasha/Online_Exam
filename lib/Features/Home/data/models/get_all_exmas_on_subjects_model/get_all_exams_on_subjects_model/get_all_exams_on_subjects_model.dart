import 'exam.dart';
import 'metadata.dart';

class GetAllExamsOnSubjectsModel {
  String? message;
  Metadata? metadata;
  List<Exam>? exams;

  GetAllExamsOnSubjectsModel({this.message, this.metadata, this.exams});

  factory GetAllExamsOnSubjectsModel.fromJson(Map<String, dynamic> json) {
    return GetAllExamsOnSubjectsModel(
      message: json['message'] as String?,
      metadata: json['metadata'] == null
          ? null
          : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      exams: (json['exams'] as List<dynamic>?)
          ?.map((e) => Exam.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'metadata': metadata?.toJson(),
        'exams': exams?.map((e) => e.toJson()).toList(),
      };
}
