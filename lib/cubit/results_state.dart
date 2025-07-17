import 'package:equatable/equatable.dart';
import 'package:total_score_page/models/result/result_model.dart';

abstract class ResultsState extends Equatable {
  const ResultsState();

  @override
  List<Object?> get props => [];
}

class ResultsInitial extends ResultsState {}

class ResultsLoading extends ResultsState {}

class ResultsLoaded extends ResultsState {
  final Results results;

  const ResultsLoaded(this.results);

  @override
  List<Object?> get props => [results];
}

class ResultsError extends ResultsState {
  final String message;

  const ResultsError(this.message);

  @override
  List<Object?> get props => [message];
}
