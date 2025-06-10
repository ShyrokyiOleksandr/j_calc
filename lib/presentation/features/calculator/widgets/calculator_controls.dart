import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:j_calc/domain/entities/history_item.dart';
import 'package:j_calc/presentation/features/calculator/cubit/calculator_cubit.dart';
import 'package:j_calc/presentation/features/calculator/widgets/calculator_button.dart';
import 'package:j_calc/presentation/features/calculator/widgets/calculator_button_row.dart';
import 'package:j_calc/presentation/features/history/cubit/history_cubit.dart';

class CalculatorControls extends StatelessWidget {
  const CalculatorControls({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CalculatorButton(
                symbol: 'C',
                onPressed: () {
                  context.read<CalculatorCubit>().clear();
                },
              ),
              CalculatorButton(
                symbol: '←',
                onPressed: () {
                  context.read<CalculatorCubit>().backspace();
                },
              ),
              CalculatorButton(symbol: '('),
              CalculatorButton(symbol: ')'),
            ],
          ),
          CalculatorButtonRow(symbols: ['7', '8', '9', '×']),
          CalculatorButtonRow(symbols: ['4', '5', '6', '÷']),
          CalculatorButtonRow(symbols: ['1', '2', '3', '+']),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CalculatorButton(symbol: '0'),
              CalculatorButton(symbol: '.'),
              CalculatorButton(
                symbol: '=',
                onPressed: () {
                  context.read<CalculatorCubit>().composeDigit('=');
                  context.read<CalculatorCubit>().calculate();
                  final calculatorState = context.read<CalculatorCubit>().state;
                  final historyItem = HistoryItem(
                    expression: calculatorState.input.replaceFirst('\n', ""),
                    timestamp: DateTime.now(),
                  );
                  context.read<HistoryCubit>().addItem(historyItem);
                },
              ),
              CalculatorButton(symbol: '-'),
            ],
          ),
        ],
      ),
    );
  }
}
