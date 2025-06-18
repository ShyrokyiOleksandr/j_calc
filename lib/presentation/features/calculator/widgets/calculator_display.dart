import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:j_calc/app_service_locator.dart';
import 'package:j_calc/presentation/features/calculator/cubit/calculator_cubit.dart';
import 'package:j_calc/presentation/features/calculator/cubit/calculator_state.dart';

class CalculatorDisplay extends StatelessWidget {
  CalculatorDisplay({super.key});

  final CalculatorCubit _calculatorCubit = getIt<CalculatorCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorCubit, CalculatorState>(
      bloc: _calculatorCubit,
      builder: (context, state) {
        return Expanded(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.bottomRight,
            color: Theme.of(context).colorScheme.inversePrimary,

            child: Text(
              textAlign: TextAlign.end,
              state.input,
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryFixed,
              ),
            ),
          ),
        );
      },
    );
  }
}
