import 'package:flutter/material.dart';
import 'package:j_calc/core/app_images.dart';
import 'package:j_calc/l10n/app_localizations.dart';
import 'package:j_calc/presentation/common/extensions/build_context_ext.dart';

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
          ],
        ),
      ),
    );
  }
}
