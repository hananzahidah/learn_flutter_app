// To parse this JSON data, do
//
//     final allUserResponse = allUserResponseFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'all_user_response.g.dart';

AllUserResponse allUserResponseFromJson(String str) =>
    AllUserResponse.fromJson(json.decode(str));

String allUserResponseToJson(AllUserResponse data) =>
    json.encode(data.toJson());

@JsonSerializable()
class AllUserResponse {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "data")
  List<Datum>? data;

  AllUserResponse({this.message, this.data});

  factory AllUserResponse.fromJson(Map<String, dynamic> json) =>
      _$AllUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AllUserResponseToJson(this);
}

@JsonSerializable()
class Datum {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "role")
  Role? role;
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
  JenisKelamin? jenisKelamin;
  @JsonKey(name: "profile_photo")
  String? profilePhoto;
  @JsonKey(name: "onesignal_player_id")
  String? onesignalPlayerId;

  Datum({
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

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}

enum JenisKelamin {
  @JsonValue("L")
  L,
  @JsonValue("P")
  P,
}

final jenisKelaminValues = EnumValues({
  "L": JenisKelamin.L,
  "P": JenisKelamin.P,
});

enum Role {
  @JsonValue("peserta")
  PESERTA,
}

final roleValues = EnumValues({"peserta": Role.PESERTA});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
