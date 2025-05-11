import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:j_calc/core/router.dart';
import 'package:j_calc/l10n/app_localizations.dart';
import 'package:j_calc/presentation/app/theme.dart';
import 'package:j_calc/presentation/features/calculator/cubit/calculator_cubit.dart';
import 'package:j_calc/presentation/features/calculator/bloc/calculator_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CalculatorCubit()),
        BlocProvider(create: (context) => CalculatorBloc()),
      ],
      child: MaterialApp.router(
        supportedLocales: [Locale('en'), Locale('uk')],
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        theme: AppTheme.theme,
        routerConfig: router,
      ),
    );
  }
}
