import 'package:j_calc/domain/history_item.dart';

class HistoryState {
  final List<HistoryItem> historyItems;
  final Exception? error;

  HistoryState({required this.historyItems, this.error});

  factory HistoryState.initial() {
    return HistoryState(historyItems: [], error: null);
  }

  HistoryState copyWith({List<HistoryItem>? historyItems, Exception? error}) {
    return HistoryState(historyItems: historyItems ?? this.historyItems, error: error);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HistoryState &&
        other.error == error &&
        _listEquals(other.historyItems, historyItems);
  }

  bool _listEquals(List<HistoryItem> a, List<HistoryItem> b) {
    if (a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }

  @override
  int get hashCode {
    return error.hashCode ^ historyItems.hashCode;
  }
}
