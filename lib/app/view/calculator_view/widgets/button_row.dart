import 'package:calculator/app/view/calculator_view/widgets/calculator_button.dart';
import 'package:flutter/material.dart';

class ButtonRow extends StatelessWidget {
  final List<String> buttons;

  const ButtonRow({super.key, required this.buttons});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: buttons.map((button) => CalculatorButton(value: button)).toList(),
      ),
    );
  }
}