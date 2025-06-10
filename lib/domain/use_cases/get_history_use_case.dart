import 'package:j_calc/domain/entities/history_item.dart';
import 'package:j_calc/domain/repositories/history_repository.dart';

class GetHistoryUseCase {
  final HistoryRepository _historyRepository;

  GetHistoryUseCase({required HistoryRepository historyRepository})
    : _historyRepository = historyRepository;

  Future<List<HistoryItem>> execute() async {
    return await _historyRepository.getHistory();
  }
}
