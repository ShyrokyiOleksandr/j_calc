import 'package:j_calc/domain/repositories/history_repository.dart';

class ClearHistoryUseCase {
  final HistoryRepository _historyRepository;

  ClearHistoryUseCase({required HistoryRepository historyRepository})
    : _historyRepository = historyRepository;

  Future<void> execute() async {
    await _historyRepository.clearHistory();
  }
}
