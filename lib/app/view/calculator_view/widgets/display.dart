import 'package:calculator/app/view_model/calculator_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Display extends StatelessWidget {
  final CalculatorViewModel viewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Obx(() => Text(
              viewModel.display.value,
              style: const TextStyle(fontSize: 40),
            )),
      ),
    );
  }
}
