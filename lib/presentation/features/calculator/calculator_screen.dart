import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:j_calc/presentation/features/calculator/cubit/calculator_cubit.dart';
import 'package:j_calc/presentation/features/calculator/cubit/calculator_state.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  static const route = "/calculator";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorCubit, CalculatorState>(
      builder: (context, state) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.bottomRight,
                  color: Theme.of(context).colorScheme.inversePrimary,
                  child: Text(
                    state.input,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryFixed,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                      CalculatorButtonRow(symbols: ['0', '.', '=', '-']),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CalculatorButtonRow extends StatelessWidget {
  const CalculatorButtonRow({super.key, required this.symbols});

  final List<String> symbols;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: symbols.map((symbol) => CalculatorButton(symbol: symbol)).toList(),
    );
  }
}

class CalculatorButton extends StatelessWidget {
  const CalculatorButton({super.key, required this.symbol, this.onPressed});

  final String symbol;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        minimumSize: Size(
          MediaQuery.sizeOf(context).width * 0.22,
          MediaQuery.sizeOf(context).height * 0.08,
        ),
      ),
      onPressed: () {
        if (onPressed != null) {
          onPressed!();
        } else {
          context.read<CalculatorCubit>().composeDigit(symbol);
        }
      },
      child: Text(
        symbol,
        style: Theme.of(
          context,
        ).textTheme.headlineLarge?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
      ),
    );
  }
}
