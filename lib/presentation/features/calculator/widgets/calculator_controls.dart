import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:j_calc/presentation/features/calculator/cubit/calculator_cubit.dart';
import 'package:j_calc/presentation/features/calculator/widgets/calculator_button.dart';
import 'package:j_calc/presentation/features/calculator/widgets/calculator_button_row.dart';

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
