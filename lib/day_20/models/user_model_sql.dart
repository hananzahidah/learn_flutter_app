import 'dart:convert';

class UserModelSql {
  final int? id;
  final String? email;
  final String? password;
  final String? fullName;
  final String? phone;
  final String? role;
  UserModelSql({
    this.id,
    this.email,
    this.password,
    this.fullName,
    this.phone,
    this.role,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'password': password,
      'fullName': fullName,
      'phone': phone,
      'role': role,
    };
  }

  factory UserModelSql.fromMap(Map<String, dynamic> map) {
    return UserModelSql(
      id: map['id'] != null ? map['id'] as int : null,
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      fullName: map['fullName'] != null ? map['fullName'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      role: map['role'] != null ? map['role'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModelSql.fromJson(String source) =>
      UserModelSql.fromMap(json.decode(source) as Map<String, dynamic>);
}
