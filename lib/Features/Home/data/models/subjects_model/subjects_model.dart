import 'package:equatable/equatable.dart';

class SubjectsModel extends Equatable {
  final String? id;
  final String? name;
  final String? icon;
  final DateTime? createdAt;

  const SubjectsModel({this.id, this.name, this.icon, this.createdAt});

  factory SubjectsModel.fromJson(Map<String, dynamic> json) => SubjectsModel(
        id: json['_id'] as String?,
        name: json['name'] as String?,
        icon: json['icon'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'icon': icon,
        'createdAt': createdAt?.toIso8601String(),
      };

  @override
  List<Object?> get props => [id, name, icon, createdAt];
}
