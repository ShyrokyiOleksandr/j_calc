import 'package:j_calc/domain/entities/history_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSource {
  static const String _historyItemsKey = 'historyItems';

  final SharedPreferences _sharedPreferences;

  LocalDataSource({required SharedPreferences sharedPreferences})
    : _sharedPreferences = sharedPreferences;

  Future<List<HistoryItem>> getHistory() async {
    final history = _sharedPreferences.getStringList(_historyItemsKey) ?? [];
    return history.map((item) => HistoryItem.fromJson(item)).toList();
  }

  Future<void> saveHistory(List<HistoryItem> history) async {
    List<String> historyListStr = history.map((item) => item.toJson()).toList();
    await _sharedPreferences.setStringList('historyItems', historyListStr);
  }

  Future<void> clearHistory() async {
    await _sharedPreferences.clear();
  }
}
