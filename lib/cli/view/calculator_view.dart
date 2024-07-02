import 'package:flutter/foundation.dart';

class CalculatorView {
  static final CalculatorView instance = CalculatorView._internal();

  CalculatorView._internal();

  void displayResult(double result) {
    if (kDebugMode) {
      print("Result: $result");
    }
  }

  void displayError(String errorMessage) {
    if (kDebugMode) {
      print("Error: $errorMessage");
    }
  }
}
