// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trainings_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainingsResponse _$TrainingsResponseFromJson(Map<String, dynamic> json) =>
    TrainingsResponse(
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TrainingsResponseToJson(TrainingsResponse instance) =>
    <String, dynamic>{'message': instance.message, 'data': instance.data};

Datum _$DatumFromJson(Map<String, dynamic> json) =>
    Datum(id: (json['id'] as num?)?.toInt(), title: json['title'] as String?);

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
};
