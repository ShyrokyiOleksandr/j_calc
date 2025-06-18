import 'package:j_calc/domain/entities/history_item.dart';

abstract interface class HistoryRepository {
  Future<List<HistoryItem>> getHistory();

  Future<void> saveHistory(List<HistoryItem> history);

  Future<void> clearHistory();
}
