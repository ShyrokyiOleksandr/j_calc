import 'package:j_calc/presentation/features/calculator/widgets/calculator_history_item.dart';

class CalculatorState {
  final String input;
  final double result;
  final List<HistoryItem> historyItems;
  final Exception? error;
  final HistoryItem? deletedItem;

  CalculatorState({
    required this.input,
    required this.result,
    required this.historyItems,
    this.error,
    this.deletedItem,
  });

  factory CalculatorState.initial() {
    return CalculatorState(input: '0', result: 0, historyItems: [], error: null, deletedItem: null);
  }

  CalculatorState copyWith({
    String? input,
    double? result,
    List<HistoryItem>? historyItems,
    Exception? error,
    HistoryItem? deletedItem,
  }) {
    return CalculatorState(
      input: input ?? this.input,
      result: result ?? this.result,
      historyItems: historyItems ?? this.historyItems,
      error: error,
      deletedItem: deletedItem,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CalculatorState &&
        other.input == input &&
        other.result == result &&
        other.error == error &&
        other.deletedItem == deletedItem &&
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
    return input.hashCode ^
        result.hashCode ^
        error.hashCode ^
        historyItems.hashCode ^
        (deletedItem?.hashCode ?? 0);
  }
}
