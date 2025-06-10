import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:j_calc/presentation/features/calculator/calculator_screen.dart';
import 'package:j_calc/presentation/features/history/history_screen.dart';
import 'package:j_calc/presentation/features/root/root_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: CalculatorScreen.route,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return RootScreen(child: child);
      },
      routes: [
        GoRoute(path: CalculatorScreen.route, builder: (context, state) => CalculatorScreen()),
        GoRoute(path: HistoryScreen.route, builder: (context, state) => HistoryScreen()),
      ],
    ),
  ],
);
