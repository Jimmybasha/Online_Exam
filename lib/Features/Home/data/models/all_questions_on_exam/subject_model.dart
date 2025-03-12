// class SubjectModel {
//   final String id;
//   final String name;
//   final String icon;
//   final DateTime createdAt;

//   SubjectModel({
//     required this.id,
//     required this.name,
//     required this.icon,
//     required this.createdAt,
//   });

//   factory SubjectModel.fromJson(Map<String, dynamic> json) {
//     return SubjectModel(
//       id: json['_id'],
//       name: json['name'],
//       icon: json['icon'],
//       createdAt: DateTime.parse(json['createdAt']),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       '_id': id,
//       'name': name,
//       'icon': icon,
//       'createdAt': createdAt.toIso8601String(),
//     };
//   }
// }