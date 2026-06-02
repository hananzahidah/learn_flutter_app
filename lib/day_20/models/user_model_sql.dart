import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModelSql {
  final int? id;
  final String email;
  final String password;
  final String fullName;
  final String? phone;
  final String role;
  UserModelSql({
    this.id,
    required this.email,
    required this.password,
    required this.fullName,
    this.phone,
    required this.role,
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
      email: map['email'] as String,
      password: map['password'] as String,
      fullName: map['fullName'] as String,
      phone: map['phone'] != null ? map['phone'] as String : null,
      role: map['role'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModelSql.fromJson(String source) =>
      UserModelSql.fromMap(json.decode(source) as Map<String, dynamic>);
}
