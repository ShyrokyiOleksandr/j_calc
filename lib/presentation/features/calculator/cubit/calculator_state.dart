import 'package:j_calc/domain/history_item.dart';

class CalculatorState {
  final String input;
  final double result;
  final Exception? error;

  CalculatorState({required this.input, required this.result, this.error});

  factory CalculatorState.initial() {
    return CalculatorState(input: '0', result: 0, error: null);
  }

  CalculatorState copyWith({
    String? input,
    double? result,
    List<HistoryItem>? historyItems,
    Exception? error,
    HistoryItem? deletedItem,
  }) {
    return CalculatorState(input: input ?? this.input, result: result ?? this.result, error: error);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CalculatorState &&
        other.input == input &&
        other.result == result &&
        other.error == error;
  }

  @override
  int get hashCode {
    return input.hashCode ^ result.hashCode ^ error.hashCode;
  }
}
