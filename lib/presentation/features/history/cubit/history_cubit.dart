import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:j_calc/presentation/features/calculator/cubit/calculator_state.dart';
import 'package:j_calc/domain/history_item.dart';
import 'package:j_calc/presentation/features/history/cubit/history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit() : super(HistoryState.initial());

  void clear() {
    emit(state.copyWith(historyItems: []));
  }

  void deleteHistoryItem(int index) {
    final updatedHistory = List<HistoryItem>.from(state.historyItems);

    try {
      updatedHistory.removeAt(index);
    } catch (e) {
      emit(state.copyWith(error: e as Exception));
    }
    updatedHistory.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    emit(state.copyWith(historyItems: updatedHistory));
  }

  void addItem(HistoryItem item) {
    final updatedHistory = List<HistoryItem>.from(state.historyItems);
    updatedHistory.add(item);
    updatedHistory.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    emit(state.copyWith(historyItems: updatedHistory));
  }
}
