import 'package:flutter/material.dart';
import 'package:j_calc/presentation/features/calculator/widgets/calculator_button.dart';

class CalculatorButtonRow extends StatelessWidget {
  const CalculatorButtonRow({super.key, required this.symbols});

  final List<String> symbols;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: symbols.map((symbol) => CalculatorButton(symbol: symbol)).toList(),
    );
  }
}
