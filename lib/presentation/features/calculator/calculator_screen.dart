import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:j_calc/app_service_locator.dart';
import 'package:j_calc/presentation/features/calculator/cubit/calculator_cubit.dart';
import 'package:j_calc/presentation/features/calculator/cubit/calculator_state.dart';
import 'package:j_calc/presentation/features/calculator/widgets/calculator_controls.dart';
import 'package:j_calc/presentation/features/calculator/widgets/calculator_display.dart';

class CalculatorScreen extends StatelessWidget {
  CalculatorScreen({super.key});

  final CalculatorCubit _calculatorCubit = getIt<CalculatorCubit>();

  static const route = "/calculator";

  @override
  Widget build(BuildContext context) {
    return BlocListener<CalculatorCubit, CalculatorState>(
      bloc: _calculatorCubit,
      listener: (context, state) {
        if (state.error != null) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error.toString())));
        }
      },
      child: Scaffold(body: Column(children: [CalculatorDisplay(), CalculatorControls()])),
    );
  }
}
