// To parse this JSON data, do
//
//     final editPhotoResponse = editPhotoResponseFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'edit_photo_response.g.dart';

EditPhotoResponse editPhotoResponseFromJson(String str) =>
    EditPhotoResponse.fromJson(json.decode(str));

String editPhotoResponseToJson(EditPhotoResponse data) =>
    json.encode(data.toJson());

@JsonSerializable()
class EditPhotoResponse {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "data")
  Data? data;

  EditPhotoResponse({this.message, this.data});

  factory EditPhotoResponse.fromJson(Map<String, dynamic> json) =>
      _$EditPhotoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EditPhotoResponseToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "profile_photo")
  String? profilePhoto;

  Data({this.profilePhoto});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
