import 'package:calculator/app/view_model/calculator_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculatorButton extends StatelessWidget {
  final String value;
  final CalculatorViewModel viewModel = Get.find();

  CalculatorButton({required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: value == '=' ? Colors.indigo : null,
            foregroundColor: value == '=' ? Colors.white : Colors.indigo,
          ),
          onPressed: () {
            if (value == '=') {
              viewModel.calculateResult();
            } else if (['+', '-', '*', '/'].contains(value)) {
              viewModel.setOperator(value);
            } else {
              viewModel.addInput(value);
            }
          },
          child: Text(value, style: const TextStyle(fontSize: 24)),
        ),
      ),
    );
  }
}
