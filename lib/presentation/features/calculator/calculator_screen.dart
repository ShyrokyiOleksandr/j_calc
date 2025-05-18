import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:j_calc/presentation/features/calculator/cubit/calculator_cubit.dart';
import 'package:j_calc/presentation/features/calculator/cubit/calculator_state.dart';
import 'package:j_calc/presentation/features/calculator/widgets/calculator_controls.dart';
import 'package:j_calc/presentation/features/calculator/widgets/calculator_display.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  static const route = "/calculator";

  @override
  Widget build(BuildContext context) {
    return BlocListener<CalculatorCubit, CalculatorState>(
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
