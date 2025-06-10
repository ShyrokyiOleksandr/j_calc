import 'package:j_calc/domain/entities/history_item.dart';
import 'package:j_calc/domain/repositories/history_repository.dart';

class SaveHistoryUseCase {
  final HistoryRepository _historyRepository;

  SaveHistoryUseCase({required HistoryRepository historyRepository})
    : _historyRepository = historyRepository;

  Future<void> execute(List<HistoryItem> history) async {
    await _historyRepository.saveHistory(history);
  }
}
