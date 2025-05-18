// ignore_for_file: public_member_api_docs, sort_constructors_first

class CalculatorState {
  // Calculator input
  final String input;

  // Calculation result
  final double result;

  CalculatorState({required this.input, required this.result});

  factory CalculatorState.initial() {
    return CalculatorState(input: '0', result: 0);
  }

  CalculatorState copyWith({String? input, double? result}) {
    return CalculatorState(input: input ?? this.input, result: result ?? this.result);
  }

  @override
  bool operator ==(covariant CalculatorState other) {
    if (identical(this, other)) return true;

    return other.input == input && other.result == result;
  }

  @override
  int get hashCode {
    return input.hashCode ^ result.hashCode;
  }
}
