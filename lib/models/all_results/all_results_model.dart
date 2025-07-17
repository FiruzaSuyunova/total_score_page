import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:total_score_page/core/entity/player_model.dart';
import 'package:total_score_page/core/entity/winner_model.dart';

import '../../presentation/screens/hover_user_tile.dart';

part 'all_results_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AllResults {
  final int id;
  final String userId;
  final String fullName;
  final String? avatar;
  final int score;
  final bool isMe;
  final int? timeSpent;

  AllResults({
    required this.id,
    required this.userId,
    required this.fullName,
    this.avatar,
    required this.score,
    required this.isMe,
    this.timeSpent,
  });


  PlayerModel toEntity() {
    return PlayerModel(
      id: id,
      name: fullName,
      imageUrl: avatar ?? '',
      time: timeSpent ?? 0,
      percent: score,
    );
  }

  WinnerModel toEntityWithWinnerModel() {
    return WinnerModel(
      name: fullName,
      imageUrl: avatar ?? '',
      time: timeSpent ?? 0,
      rank: null,
      percent: score,
    );
  }




  factory AllResults.fromJson(Map<String, dynamic> json) =>
      _$AllResultsFromJson(json);

  Map<String, dynamic> toJson() => _$AllResultsToJson(this);
}