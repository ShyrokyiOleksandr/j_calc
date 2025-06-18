import 'package:get_it/get_it.dart';
import 'package:j_calc/data/data_sources/local_data_source.dart';
import 'package:j_calc/data/repositories/history_repository_impl.dart';
import 'package:j_calc/domain/repositories/history_repository.dart';
import 'package:j_calc/domain/use_cases/clear_history_use_case.dart';
import 'package:j_calc/domain/use_cases/get_history_use_case.dart';
import 'package:j_calc/domain/use_cases/save_history_use_case.dart';
import 'package:j_calc/presentation/features/calculator/cubit/calculator_cubit.dart';
import 'package:j_calc/presentation/features/history/cubit/history_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

class AppServiceLocator {
  AppServiceLocator._();

  static Future<void> init() async {
    // 3rd party packages
    getIt.registerSingleton<SharedPreferences>(await SharedPreferences.getInstance());

    // Data sources
    getIt.registerSingleton<LocalDataSource>(
      LocalDataSource(sharedPreferences: getIt<SharedPreferences>()),
    );

    // Repositories
    getIt.registerSingleton<HistoryRepository>(
      //                     abstract class
      HistoryRepositoryImpl(localDataSource: getIt<LocalDataSource>()),
      // implementation
    );

    // Use cases
    getIt.registerSingleton<GetHistoryUseCase>(
      GetHistoryUseCase(historyRepository: getIt<HistoryRepository>()),
    );
    getIt.registerSingleton<SaveHistoryUseCase>(
      SaveHistoryUseCase(historyRepository: getIt<HistoryRepository>()),
    );
    getIt.registerSingleton<ClearHistoryUseCase>(
      ClearHistoryUseCase(historyRepository: getIt<HistoryRepository>()),
    );

    // Cubits
    getIt.registerSingleton<HistoryCubit>(
      HistoryCubit(
        getHistoryUseCase: getIt<GetHistoryUseCase>(),
        saveHistoryUseCase: getIt<SaveHistoryUseCase>(),
        clearHistoryUseCase: getIt<ClearHistoryUseCase>(),
      ),
    );
    getIt.registerSingleton<CalculatorCubit>(CalculatorCubit());
  }
}
