import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:j_calc/core/app_images.dart';
import 'package:j_calc/presentation/common/extensions/build_context_ext.dart';
import 'package:j_calc/presentation/features/calculator/bloc/calculator_bloc.dart';
import 'package:j_calc/presentation/features/calculator/bloc/calculator_events.dart';
import 'package:j_calc/presentation/features/calculator/calculator_state.dart';
import 'package:j_calc/presentation/features/calculator/cubit/calculator_cubit.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  static const route = "/calculator";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.l10n.helloWorld,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
            ),
            Image.asset(AppImages.tiolochka),
            const SizedBox(height: 20),
            Text('Cubit'),
            BlocBuilder<CalculatorCubit, CalculatorState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const CircularProgressIndicator.adaptive();
                }

                return Text(
                  state.value.toString(),
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
                );
              },
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => context.read<CalculatorCubit>().increment(),
                  child: Text('+'),
                ),
                ElevatedButton(
                  onPressed: () => context.read<CalculatorCubit>().decrement(),
                  child: Text('-'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text('Bloc'),
            BlocBuilder<CalculatorBloc, int>(
              builder: (context, state) {
                return Text(
                  state.toString(),
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => context.read<CalculatorBloc>().add(IncrementCounter()),
                  child: Text('+'),
                ),
                ElevatedButton(
                  onPressed: () => context.read<CalculatorBloc>().add(DecrementCounter()),
                  child: Text('-'),
                ),
                ElevatedButton(
                  onPressed: () => context.read<CalculatorBloc>().add(ResetCounter()),
                  child: Text('Zero'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
