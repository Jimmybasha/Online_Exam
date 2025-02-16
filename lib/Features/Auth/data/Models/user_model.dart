import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final String? rePassword;
  final String? phone;

  const UserModel({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.rePassword,
    this.phone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        username: json['username'] as String?,
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        email: json['email'] as String?,
        password: json['password'] as String?,
        rePassword: json['rePassword'] as String?,
        phone: json['phone'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'username': username,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'password': password,
        'rePassword': rePassword,
        'phone': phone,
      };

  @override
  List<Object?> get props {
    return [
      username,
      firstName,
      lastName,
      email,
      password,
      rePassword,
      phone,
    ];
  }
}
