import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:j_calc/presentation/common/extensions/build_context_ext.dart';
import 'package:j_calc/presentation/features/calculator/calculator_screen.dart';
import 'package:j_calc/presentation/features/history/history_screen.dart';

class RootScreen extends StatelessWidget {
  final Widget child;

  const RootScreen({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    final currentIndex = _locationToIndex(location);

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => _onItemTapped(context, index),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.calculate), label: context.l10n.calculator),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: context.l10n.history),
        ],
      ),
    );
  }

  int _locationToIndex(String location) {
    if (location.startsWith(HistoryScreen.route)) return 1;
    return 0;
  }

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go(CalculatorScreen.route);
        break;
      case 1:
        context.go(HistoryScreen.route);
        break;
    }
  }
}
