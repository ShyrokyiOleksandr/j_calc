import 'package:j_calc/data/data_sources/local_data_source.dart';
import 'package:j_calc/domain/entities/history_item.dart';
import 'package:j_calc/domain/repositories/history_repository.dart';

class HistoryRepositoryImpl implements HistoryRepository {
  final LocalDataSource _localDataSource;

  HistoryRepositoryImpl({required LocalDataSource localDataSource})
    : _localDataSource = localDataSource;

  @override
  Future<List<HistoryItem>> getHistory() async {
    return await _localDataSource.getHistory();
  }

  @override
  Future<void> saveHistory(List<HistoryItem> history) {
    return _localDataSource.saveHistory(history);
  }

  @override
  Future<void> clearHistory() async {
    return await _localDataSource.clearHistory();
  }
}
