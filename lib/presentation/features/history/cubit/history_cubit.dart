import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:j_calc/presentation/features/calculator/cubit/calculator_state.dart';
import 'package:j_calc/domain/entities/history_item.dart';
import 'package:j_calc/domain/use_cases/clear_history_use_case.dart';
import 'package:j_calc/domain/use_cases/get_history_use_case.dart';
import 'package:j_calc/domain/use_cases/save_history_use_case.dart';

import 'package:j_calc/presentation/features/history/cubit/history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  final GetHistoryUseCase _getHistoryUseCase;
  final SaveHistoryUseCase _saveHistoryUseCase;
  final ClearHistoryUseCase _clearHistoryUseCase;

  HistoryCubit({
    required GetHistoryUseCase getHistoryUseCase,
    required SaveHistoryUseCase saveHistoryUseCase,
    required ClearHistoryUseCase clearHistoryUseCase,
  }) : _getHistoryUseCase = getHistoryUseCase,
       _saveHistoryUseCase = saveHistoryUseCase,
       _clearHistoryUseCase = clearHistoryUseCase,
       super(HistoryState.initial()) {
    _initHistory();
  }

  Future<void> _initHistory() async {
    final loaded = await _getHistoryUseCase.execute();
    emit(state.copyWith(historyItems: loaded));
  }

  void clear() {
    _clearHistoryUseCase.execute();
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
    _saveHistoryUseCase.execute(updatedHistory);
    updatedHistory.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    emit(state.copyWith(historyItems: updatedHistory));
  }
}
