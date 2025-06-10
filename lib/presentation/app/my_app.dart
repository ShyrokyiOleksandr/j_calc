import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:j_calc/data/data_sources/local_data_source.dart';
import 'package:j_calc/data/repositories/history_repository_impl.dart';
import 'package:j_calc/domain/use_cases/get_history_use_case.dart';
import 'package:j_calc/domain/use_cases/save_history_use_case.dart';
import 'package:j_calc/presentation/common/l10n/app_localizations.dart';
import 'package:j_calc/presentation/common/router/router.dart';
import 'package:j_calc/presentation/common/theme/theme.dart';
import 'package:j_calc/presentation/features/calculator/cubit/calculator_cubit.dart';
import 'package:j_calc/presentation/features/history/cubit/history_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const MaterialApp(
            home: Scaffold(body: Center(child: CircularProgressIndicator())),
          );
        }

        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => CalculatorCubit()),
            BlocProvider(
              create:
                  (context) => HistoryCubit(
                    saveHistoryUseCase: SaveHistoryUseCase(
                      historyRepository: HistoryRepositoryImpl(
                        localDataSource: LocalDataSource(sharedPreferences: snapshot.data!),
                      ),
                    ),
                    getHistoryUseCase: GetHistoryUseCase(
                      historyRepository: HistoryRepositoryImpl(
                        localDataSource: LocalDataSource(sharedPreferences: snapshot.data!),
                      ),
                    ),
                  ),
            ),
          ],
          child: MaterialApp.router(
            supportedLocales: [Locale('en'), Locale('uk')],
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            theme: AppTheme.theme,
            routerConfig: router,
          ),
        );
      },
    );
  }
}
