import 'metadata.dart';
import 'subject.dart';

class SubjectsModel {
  final String? message;
  final Metadata? metadata;
  final List<Subject>? subjects;

  const SubjectsModel({this.message, this.metadata, this.subjects});

  factory SubjectsModel.fromJson(Map<String, dynamic> json) => SubjectsModel(
        message: json['message'] as String?,
        metadata: json['metadata'] == null
            ? null
            : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
        subjects: (json['subjects'] as List<dynamic>?)
            ?.map((e) => Subject.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'metadata': metadata?.toJson(),
        'subjects': subjects?.map((e) => e.toJson()).toList(),
      };
}
