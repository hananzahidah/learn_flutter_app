// To parse this JSON data, do
//
//     final editResponse = editResponseFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'edit_response.g.dart';

EditResponse editResponseFromJson(String str) =>
    EditResponse.fromJson(json.decode(str));

String editResponseToJson(EditResponse data) => json.encode(data.toJson());

@JsonSerializable()
class EditResponse {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "data")
  Data? data;

  EditResponse({this.message, this.data});

  factory EditResponse.fromJson(Map<String, dynamic> json) =>
      _$EditResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EditResponseToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "role")
  String? role;
  @JsonKey(name: "email_verified_at")
  dynamic emailVerifiedAt;
  @JsonKey(name: "is_active")
  String? isActive;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "updated_at")
  DateTime? updatedAt;
  @JsonKey(name: "batch_id")
  String? batchId;
  @JsonKey(name: "training_id")
  String? trainingId;
  @JsonKey(name: "jenis_kelamin")
  dynamic jenisKelamin;
  @JsonKey(name: "profile_photo")
  String? profilePhoto;
  @JsonKey(name: "onesignal_player_id")
  String? onesignalPlayerId;

  Data({
    this.id,
    this.name,
    this.email,
    this.role,
    this.emailVerifiedAt,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.batchId,
    this.trainingId,
    this.jenisKelamin,
    this.profilePhoto,
    this.onesignalPlayerId,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
