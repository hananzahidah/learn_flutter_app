// To parse this JSON data, do
//
//     final detailTrainingResponse = detailTrainingResponseFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'detail_training_response.g.dart';

DetailTrainingResponse detailTrainingResponseFromJson(String str) =>
    DetailTrainingResponse.fromJson(json.decode(str));

String detailTrainingResponseToJson(DetailTrainingResponse data) =>
    json.encode(data.toJson());

@JsonSerializable()
class DetailTrainingResponse {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "data")
  Data? data;

  DetailTrainingResponse({this.message, this.data});

  factory DetailTrainingResponse.fromJson(Map<String, dynamic> json) =>
      _$DetailTrainingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DetailTrainingResponseToJson(this);
}

@JsonSerializable()
class Data {
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
  @JsonKey(name: "units")
  List<dynamic>? units;
  @JsonKey(name: "activities")
  List<dynamic>? activities;

  Data({
    this.id,
    this.title,
    this.description,
    this.participantCount,
    this.standard,
    this.duration,
    this.createdAt,
    this.updatedAt,
    this.units,
    this.activities,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
