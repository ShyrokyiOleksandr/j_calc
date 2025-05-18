import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:j_calc/presentation/features/calculator/cubit/calculator_cubit.dart';

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
        ).textTheme.headlineMedium?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
      ),
    );
  }
}
