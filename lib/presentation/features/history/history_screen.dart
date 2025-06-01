import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:j_calc/presentation/features/calculator/cubit/calculator_cubit.dart';
import 'package:intl/intl.dart';
import 'package:j_calc/presentation/features/history/cubit/history_cubit.dart';
import 'package:j_calc/presentation/features/history/cubit/history_state.dart';
// import 'package:j_calc/presentation/features/calculator/cubit/calculator_state.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  static const route = '/history';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryCubit, HistoryState>(
      // listener: (context, state) {
      //   final prevHistory = state.historyItems;
      //   if (prevHistory.length != state.) {
      //     ScaffoldMessenger.of(context).showSnackBar(
      //       SnackBar(
      //         content: Text(
      //           '${deletedItem.expression} was deleted',
      //           style: const TextStyle(
      //             color: Colors.white,
      //             fontWeight: FontWeight.bold,
      //             fontSize: 16,
      //           ),
      //         ),
      //         backgroundColor: Colors.redAccent,
      //         behavior: SnackBarBehavior.floating,
      //         duration: const Duration(seconds: 2),
      //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      //         margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      //       ),
      //     );
      //     context.read<HistoryCubit>().clearDeletedItem();
      //   }
      // },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.historyItems.length,
              itemBuilder: (context, index) {
                final item = state.historyItems[index];
                return ListTile(
                  title: Text(item.expression),
                  subtitle: Text(DateFormat('HH:mm:ss dd.MM.yyyy').format(item.timestamp)),
                  trailing: ElevatedButton(
                    onPressed: () {
                      final deleteIndex = state.historyItems.length - 1 - index;
                      context.read<HistoryCubit>().deleteHistoryItem(deleteIndex);
                    },
                    child: const Text("delete"),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
