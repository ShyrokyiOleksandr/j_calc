import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:j_calc/presentation/features/calculator/cubit/calculator_state.dart';

enum CalculatorOperation { add, subtract, multiply, divide }

class CalculatorCubit extends Cubit<CalculatorState> {
  CalculatorCubit() : super(CalculatorState.initial());

  void composeDigit(String newSymbol) {
    // Avoid useless zeros at the beginning
    if (state.input == '0') {
      emit(state.copyWith(input: newSymbol));
      return;
    }

    // Prevent entering two operators in a row
    final operators = ['×', '÷', '+', '-', '.', '='];
    final lastChar = state.input.isNotEmpty ? state.input[state.input.length - 1] : '';
    if (operators.contains(newSymbol) && operators.contains(lastChar)) {
      return;
    }

    // Avoid entering an operator after an equal sign
    if (lastChar == '=') {
      return;
    }

    emit(state.copyWith(input: state.input + newSymbol));
  }

  void clear() {
    emit(CalculatorState.initial());
  }

  void backspace() {
    if (state.input.length > 1) {
      emit(state.copyWith(input: state.input.substring(0, state.input.length - 1)));
    } else {
      emit(CalculatorState.initial());
    }
  }
}
