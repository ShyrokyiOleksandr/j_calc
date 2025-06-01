import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:j_calc/presentation/features/calculator/cubit/calculator_state.dart';

enum CalculatorOperation { add, subtract, multiply, divide }

class CalculatorCubit extends Cubit<CalculatorState> {
  CalculatorCubit() : super(CalculatorState.initial());

  void composeDigit(String newSymbol) {
    if (state.input == '0') {
      emit(state.copyWith(input: newSymbol));
      return;
    }

    final operators = ['×', '÷', '+', '-', '.', '='];

    final lastChar = state.input.isNotEmpty ? state.input[state.input.length - 1] : '';
    if (operators.contains(newSymbol) && operators.contains(lastChar)) {
      emit(state.copyWith(error: Exception('Cannot enter an operator after an operator')));
      emit(state.copyWith(error: null));
      return;
    }

    if (lastChar == '=') {
      emit(state.copyWith(error: Exception('Cannot enter an operator after an equal sign')));
      emit(state.copyWith(error: null));
      return;
    }

    emit(state.copyWith(input: state.input + newSymbol));
  }

  void clear() {
    emit(state.copyWith(input: '0', result: 0, error: null));
  }

  void backspace() {
    if (state.input.length > 1) {
      emit(state.copyWith(input: state.input.substring(0, state.input.length - 1)));
    } else {
      clear();
    }
  }

  void calculate() {
    String input = state.input;
    input = input.replaceAll('×', '*').replaceAll('÷', '/');

    double? result;
    try {
      result = _evaluateExpression(input);
    } catch (e) {
      emit(state.copyWith(error: Exception(e.toString()), result: 0));
      emit(state.copyWith(error: null));
      return;
    }
    emit(state.copyWith(input: "${state.input}\n${result.toStringAsFixed(2)}", result: result));
  }

  // Simple expression evaluator (supports +, -, *, /, decimals)
  double _evaluateExpression(String input) {
    // Remove spaces
    input = input.replaceAll(' ', '');
    // Tokenize
    final tokens = _tokenize(input);
    // Convert to Reverse Polish Notation (RPN) using Shunting Yard algorithm
    final rpn = _toRPN(tokens);
    // Evaluate RPN
    return _evalRPN(rpn);
  }

  List<String> _tokenize(String expr) {
    final regex = RegExp(r'(\d+\.\d+|\d+|[+\-*/()])');
    final result = regex.allMatches(expr).map((m) => m.group(0)!).toList();
    return result;
  }

  List<String> _toRPN(List<String> tokens) {
    final output = <String>[];
    final ops = <String>[];
    final precedence = {'+': 1, '-': 1, '*': 2, '/': 2};
    for (final token in tokens) {
      if (double.tryParse(token) != null) {
        output.add(token);
      } else if ('+-*/'.contains(token)) {
        while (ops.isNotEmpty &&
            '*/+-'.contains(ops.last) &&
            precedence[ops.last]! >= precedence[token]!) {
          output.add(ops.removeLast());
        }
        ops.add(token);
      } else if (token == '(') {
        ops.add(token);
      } else if (token == ')') {
        while (ops.isNotEmpty && ops.last != '(') {
          output.add(ops.removeLast());
        }
        if (ops.isNotEmpty && ops.last == '(') {
          ops.removeLast();
        }
      }
    }
    while (ops.isNotEmpty) {
      output.add(ops.removeLast());
    }
    return output;
  }

  double _evalRPN(List<String> rpn) {
    final stack = <double>[];
    for (final token in rpn) {
      if (double.tryParse(token) != null) {
        stack.add(double.parse(token));
      } else {
        final b = stack.removeLast();
        final a = stack.removeLast();
        switch (token) {
          case '+':
            stack.add(a + b);
            break;
          case '-':
            stack.add(a - b);
            break;
          case '*':
            stack.add(a * b);
            break;
          case '/':
            stack.add(a / b);
            break;
        }
      }
    }
    return stack.single;
  }
}
