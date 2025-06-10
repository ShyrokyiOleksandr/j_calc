import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:j_calc/presentation/features/calculator/cubit/calculator_state.dart';
import 'package:j_calc/domain/history_item.dart';
import 'package:j_calc/presentation/features/history/cubit/history_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit() : super(HistoryState.initial()) {
    _initHistory();
  }

  Future<void> _initHistory() async {
    final loaded = await getHistory();
    emit(state.copyWith(historyItems: loaded));
  }

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
    saveHistory(updatedHistory);
    updatedHistory.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    emit(state.copyWith(historyItems: updatedHistory));
  }

  Future<void> saveHistory(List<HistoryItem> history) async {
    final prefs = await SharedPreferences.getInstance();
    // final updatedHistory = List<HistoryItem>.from(state.historyItems);
    List<String> historyList = history.map((item) => item.toJson()).toList();

    await prefs.setStringList('historyItems', historyList);
  }

  Future<List<HistoryItem>> getHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> historyList = prefs.getStringList('historyItems') ?? [];
    // final updatedHistory = List<HistoryItem>.from(state.historyItems);

    return historyList.map((item) => HistoryItem.fromJson(item)).toList();
  }

  Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    emit(state.copyWith(historyItems: []));
  }
}
