import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:j_calc/presentation/features/calculator/cubit/calculator_state.dart';

class CalculatorCubit extends Cubit<CalculatorState> {
  CalculatorCubit() : super(CalculatorState.initial());

  void composeDigit(String s) {
    if (state.input == '0') {
      emit(state.copyWith(input: s));
    } else {
      emit(state.copyWith(input: state.input + s));
    }
  }

  void clear() {
    emit(CalculatorState.initial());
  }
}
