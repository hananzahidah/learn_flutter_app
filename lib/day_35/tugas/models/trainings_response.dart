// To parse this JSON data, do
//
//     final trainingsResponse = trainingsResponseFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'trainings_response.g.dart';

TrainingsResponse trainingsResponseFromJson(String str) =>
    TrainingsResponse.fromJson(json.decode(str));

String trainingsResponseToJson(TrainingsResponse data) =>
    json.encode(data.toJson());

@JsonSerializable()
class TrainingsResponse {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "data")
  List<Datum>? data;

  TrainingsResponse({this.message, this.data});

  factory TrainingsResponse.fromJson(Map<String, dynamic> json) =>
      _$TrainingsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TrainingsResponseToJson(this);
}

@JsonSerializable()
class Datum {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "title")
  String? title;

  Datum({this.id, this.title});

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
