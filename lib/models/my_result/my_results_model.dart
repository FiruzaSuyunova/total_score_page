import 'package:json_annotation/json_annotation.dart';

part 'my_results_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MyResults {
  final int id;
  final String userId;
  final String fullName;
  final String? avatar;
  final int score;
  final bool isMe;
  final int? timeSpent;

  MyResults({
    required this.id,
    required this.userId,
    required this.fullName,
    this.avatar,
    required this.score,
    required this.isMe,
    this.timeSpent,
  });

  factory MyResults.fromJson(Map<String, dynamic> json) =>
      _$MyResultsFromJson(json);

  Map<String, dynamic> toJson() => _$MyResultsToJson(this);
}
