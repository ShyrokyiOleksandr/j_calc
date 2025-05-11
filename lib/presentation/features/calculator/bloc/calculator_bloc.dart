import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:j_calc/presentation/features/calculator/bloc/calculator_events.dart';

class CalculatorBloc extends Bloc<CounterEvent, int> {
  CalculatorBloc() : super(0) {
    on<IncrementCounter>(_onIncrement);
    on<DecrementCounter>(_onDecrement);
    on<ResetCounter>(_onReset);
  }

  FutureOr<void> _onIncrement(IncrementCounter event, Emitter<int> emit) {
    emit(state + 1);
  }

  FutureOr<void> _onDecrement(DecrementCounter event, Emitter<int> emit) {
    emit(state - 1);
  }

  FutureOr<void> _onReset(ResetCounter event, Emitter<int> emit) {
    emit(0);
  }
}
