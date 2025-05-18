// ignore_for_file: public_member_api_docs, sort_constructors_first

class CalculatorState {
  // Calculator input
  final String input;

  // Parsing result
  final double firstNumber;
  final double secondNumber;
  final CalculatorOperation operation;

  // Calculation result
  final double result;

  CalculatorState({
    required this.input,
    required this.firstNumber,
    required this.secondNumber,
    required this.operation,
    required this.result,
  });

  factory CalculatorState.initial() {
    return CalculatorState(
      input: '0',
      firstNumber: 0,
      secondNumber: 0,
      operation: CalculatorOperation.add,
      result: 0,
    );
  }

  CalculatorState copyWith({
    String? input,
    double? firstNumber,
    double? secondNumber,
    CalculatorOperation? operation,
    double? result,
  }) {
    return CalculatorState(
      input: input ?? this.input,
      firstNumber: firstNumber ?? this.firstNumber,
      secondNumber: secondNumber ?? this.secondNumber,
      operation: operation ?? this.operation,
      result: result ?? this.result,
    );
  }

  @override
  bool operator ==(covariant CalculatorState other) {
    if (identical(this, other)) return true;

    return other.input == input &&
        other.firstNumber == firstNumber &&
        other.secondNumber == secondNumber &&
        other.operation == operation &&
        other.result == result;
  }

  @override
  int get hashCode {
    return input.hashCode ^
        firstNumber.hashCode ^
        secondNumber.hashCode ^
        operation.hashCode ^
        result.hashCode;
  }
}

enum CalculatorOperation { add, subtract, multiply, divide }
