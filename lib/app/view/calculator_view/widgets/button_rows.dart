import 'package:calculator/app/view/calculator_view/widgets/button_row.dart';
import 'package:flutter/material.dart';

class ButtonRows extends StatelessWidget {
  const ButtonRows({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ButtonRow(
          buttons: ['7', '8', '9', '/'],
        ),
        ButtonRow(buttons: ['4', '5', '6', '*']),
        ButtonRow(buttons: ['1', '2', '3', '-']),
        ButtonRow(buttons: ['0', '.', '=', '+']),
      ],
    );
  }
}
