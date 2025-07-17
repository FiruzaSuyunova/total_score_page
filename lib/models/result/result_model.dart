import 'package:json_annotation/json_annotation.dart';

import '../all_results/all_results_model.dart';
import '../my_result/my_results_model.dart';

part 'result_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Results {
  final int remainingTime;
  final MyResults? myResult;
  final List<AllResults> allResults;

  Results({
    required this.remainingTime,
    this.myResult,
    required this.allResults,
  });


  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);

  Map<String, dynamic> toJson() => _$ResultsToJson(this);
}




