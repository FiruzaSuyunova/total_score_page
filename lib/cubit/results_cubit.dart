import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/service.dart';
import 'results_state.dart';

class ResultsCubit extends Cubit<ResultsState> {
  final ApiService apiService;

  ResultsCubit({required this.apiService}) : super(ResultsInitial());

  Future<void> fetchResults() async {
    emit(ResultsLoading());
    try {
      final result = await apiService.getModel();
      if (result != null) {
        emit(ResultsLoaded(result));
      } else {
        emit(const ResultsError("Natija topilmadi"));
      }
    } catch (e) {
      emit(ResultsError(e.toString()));
    }

  }
}
