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
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.input),
                Column(
                  children: [
                    Row(
                      children: [
                        FilledButton(
                          onPressed: () {
                            context.read<CalculatorCubit>().clear();
                          },
                          child: Text('AC'),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        FilledButton(
                          onPressed: () {
                            context.read<CalculatorCubit>().composeDigit('7');
                          },
                          child: Text('7'),
                        ),
                        FilledButton(
                          onPressed: () {
                            context.read<CalculatorCubit>().composeDigit('8');
                          },
                          child: Text('8'),
                        ),
                        FilledButton(
                          onPressed: () {
                            context.read<CalculatorCubit>().composeDigit('9');
                          },
                          child: Text('9'),
                        ),
                        FilledButton(
                          onPressed: () {
                            context.read<CalculatorCubit>().composeDigit('×');
                          },
                          child: Text('×'),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        FilledButton(
                          onPressed: () {
                            context.read<CalculatorCubit>().composeDigit('4');
                          },
                          child: Text('4'),
                        ),
                        FilledButton(
                          onPressed: () {
                            context.read<CalculatorCubit>().composeDigit('5');
                          },
                          child: Text('5'),
                        ),
                        FilledButton(
                          onPressed: () {
                            context.read<CalculatorCubit>().composeDigit('6');
                          },
                          child: Text('6'),
                        ),
                        FilledButton(onPressed: () {}, child: Text('-')),
                      ],
                    ),
                    Row(
                      children: [
                        FilledButton(
                          onPressed: () {
                            context.read<CalculatorCubit>().composeDigit('1');
                          },
                          child: Text('1'),
                        ),
                        FilledButton(
                          onPressed: () {
                            context.read<CalculatorCubit>().composeDigit('2');
                          },
                          child: Text('2'),
                        ),
                        FilledButton(
                          onPressed: () {
                            context.read<CalculatorCubit>().composeDigit('3');
                          },
                          child: Text('3'),
                        ),
                        FilledButton(
                          onPressed: () {
                            context.read<CalculatorCubit>().composeDigit('+');
                          },
                          child: Text('+'),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        FilledButton(
                          onPressed: () {
                            context.read<CalculatorCubit>().composeDigit('1');
                          },
                          child: Text('1'),
                        ),
                        FilledButton(
                          onPressed: () {
                            context.read<CalculatorCubit>().composeDigit('2');
                          },
                          child: Text('2'),
                        ),
                        FilledButton(
                          onPressed: () {
                            context.read<CalculatorCubit>().composeDigit('3');
                          },
                          child: Text('3'),
                        ),
                        FilledButton(
                          onPressed: () {
                            context.read<CalculatorCubit>().composeDigit('+');
                          },
                          child: Text('+'),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
