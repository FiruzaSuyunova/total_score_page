// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_results_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllResults _$AllResultsFromJson(Map<String, dynamic> json) => AllResults(
  id: (json['id'] as num).toInt(),
  userId: json['user_id'] as String,
  fullName: json['full_name'] as String,
  avatar: json['avatar'] as String?,
  score: (json['score'] as num).toInt(),
  isMe: json['is_me'] as bool,
  timeSpent: (json['time_spent'] as num?)?.toInt(),
);

Map<String, dynamic> _$AllResultsToJson(AllResults instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'full_name': instance.fullName,
      'avatar': instance.avatar,
      'score': instance.score,
      'is_me': instance.isMe,
      'time_spent': instance.timeSpent,
    };
