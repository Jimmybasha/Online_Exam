import 'user.dart';

class UserInfoModel {
  String? message;
  User? user;

  UserInfoModel({this.message, this.user});

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
        message: json['message'] as String?,
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'user': user?.toJson(),
      };
}
