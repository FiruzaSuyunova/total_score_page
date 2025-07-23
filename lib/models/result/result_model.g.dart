// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Results _$ResultsFromJson(Map<String, dynamic> json) => Results(
  remainingTime: (json['remaining_time'] as num).toInt(),
  myResult: json['my_result'] == null
      ? null
      : MyResults.fromJson(json['my_result'] as Map<String, dynamic>),
  allResults: (json['all_results'] as List<dynamic>)
      .map((e) => AllResults.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ResultsToJson(Results instance) => <String, dynamic>{
  'remaining_time': instance.remainingTime,
  'my_result': instance.myResult,
  'all_results': instance.allResults,
};
