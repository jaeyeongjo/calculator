import 'package:calculator/app/view/calculator_view/widgets/button_rows.dart';
import 'package:calculator/app/view/calculator_view/widgets/display.dart';
import 'package:calculator/app/view/history_view/history_view.dart';
import 'package:calculator/app/view_model/calculator_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculatorView extends StatelessWidget {
  final CalculatorViewModel viewModel = Get.put(CalculatorViewModel());

  CalculatorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              Get.to(() => HistoryView());
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Display(),
            const ButtonRows(),
          ],
        ),
      ),
    );
  }
}
