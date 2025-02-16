import 'User.dart';

/// user : {"username":"elevates11233","firstName":"Elevate","lastName":"Tech","email":"admins133@1elevate.com","phone":"01094155711","role":"user","isVerified":false,"_id":"67b1fb5586a024f06ea273ee","createdAt":"2025-02-16T14:51:01.414Z"}

class UserSignUpModel {
  UserSignUpModel({
      this.user,});

  UserSignUpModel.fromJson(dynamic json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

}