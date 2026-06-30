// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'profile_response.g.dart';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

@JsonSerializable()
class ProfileModel {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "data")
  Data? data;

  ProfileModel({this.message, this.data});

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "batch_ke")
  String? batchKe;
  @JsonKey(name: "training_title")
  String? trainingTitle;
  @JsonKey(name: "batch")
  Batch? batch;
  @JsonKey(name: "training")
  Training? training;
  @JsonKey(name: "jenis_kelamin")
  dynamic jenisKelamin;
  @JsonKey(name: "profile_photo")
  String? profilePhoto;
  @JsonKey(name: "profile_photo_url")
  String? profilePhotoUrl;

  Data({
    this.id,
    this.name,
    this.email,
    this.batchKe,
    this.trainingTitle,
    this.batch,
    this.training,
    this.jenisKelamin,
    this.profilePhoto,
    this.profilePhotoUrl,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Batch {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "batch_ke")
  String? batchKe;
  @JsonKey(name: "start_date")
  DateTime? startDate;
  @JsonKey(name: "end_date")
  DateTime? endDate;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "updated_at")
  DateTime? updatedAt;

  Batch({
    this.id,
    this.batchKe,
    this.startDate,
    this.endDate,
    this.createdAt,
    this.updatedAt,
  });

  factory Batch.fromJson(Map<String, dynamic> json) => _$BatchFromJson(json);

  Map<String, dynamic> toJson() => _$BatchToJson(this);
}

@JsonSerializable()
class Training {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "description")
  dynamic description;
  @JsonKey(name: "participant_count")
  dynamic participantCount;
  @JsonKey(name: "standard")
  dynamic standard;
  @JsonKey(name: "duration")
  dynamic duration;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "updated_at")
  DateTime? updatedAt;

  Training({
    this.id,
    this.title,
    this.description,
    this.participantCount,
    this.standard,
    this.duration,
    this.createdAt,
    this.updatedAt,
  });

  factory Training.fromJson(Map<String, dynamic> json) =>
      _$TrainingFromJson(json);

  Map<String, dynamic> toJson() => _$TrainingToJson(this);
}
