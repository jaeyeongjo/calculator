import 'package:calculator/app/view_model/calculator_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryView extends StatelessWidget {
  final CalculatorViewModel viewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('History')),
      body: Obx(() {
        var reversedHistory = viewModel.history.reversed.toList();
        return ListView.builder(
          itemCount: reversedHistory.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(reversedHistory[index]),
            );
          },
        );
      }),
    );
  }
}
