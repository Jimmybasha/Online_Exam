/// username : "elevates11233"
/// firstName : "Elevate"
/// lastName : "Tech"
/// email : "admins133@1elevate.com"
/// phone : "01094155711"
/// role : "user"
/// isVerified : false
/// _id : "67b1fb5586a024f06ea273ee"
/// createdAt : "2025-02-16T14:51:01.414Z"

class User {
  User({
      this.username, 
      this.firstName, 
      this.lastName, 
      this.email, 
      this.phone, 
      this.role, 
      this.isVerified, 
      this.id, 
      this.createdAt,
      this.message,
      this.token
    });

  User.fromJson(dynamic json) {
    username = json['username'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phone = json['phone'];
    role = json['role'];
    isVerified = json['isVerified'];
    id = json['_id'];
    createdAt = json['createdAt'];
    message = json['message'];
    token = json['token'];
  }
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? role;
  bool? isVerified;
  String? id;
  String? createdAt;
  String? message;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = username;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['email'] = email;
    map['phone'] = phone;
    map['role'] = role;
    map['isVerified'] = isVerified;
    map['_id'] = id;
    map['createdAt'] = createdAt;
    map['message']= message;
    map['token']= token;
    return map;
  }

}