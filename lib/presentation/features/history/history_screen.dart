import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:j_calc/presentation/features/calculator/cubit/calculator_cubit.dart';
import 'package:intl/intl.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  static const route = '/history';

  @override
  Widget build(BuildContext context) {
    final historyItems = context.watch<CalculatorCubit>().state.historyItems;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: historyItems.length,
          itemBuilder: (context, index) {
            final item = historyItems[historyItems.length - 1 - index];
            final formattedTime = DateFormat('HH:mm:ss').format(item.timestamp);
            final historyItem = '${historyItems.length - index}. ${item.expression} $formattedTime';

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      historyItem,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      final deleteIndex = historyItems.length - 1 - index;
                      context.read<CalculatorCubit>().deleteHistoryItem(deleteIndex);
                    },
                    child: const Text("delete"),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
