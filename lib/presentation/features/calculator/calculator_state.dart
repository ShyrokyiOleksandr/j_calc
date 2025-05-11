class CalculatorState {
  bool isLoading;
  final int value;

  CalculatorState({required this.isLoading, required this.value});

  @override
  bool operator ==(covariant CalculatorState other) {
    if (identical(this, other)) return true;

    return other.isLoading == isLoading && other.value == value;
  }

  @override
  int get hashCode => isLoading.hashCode ^ value.hashCode;

  CalculatorState copyWith({bool? isLoading, Exception? error, int? value}) {
    return CalculatorState(isLoading: isLoading ?? this.isLoading, value: value ?? this.value);
  }
}
