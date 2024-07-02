import '../model/calculator.dart';
import '../view/calculator_view.dart';

class CalculatorController {
  final Calculator calculator;
  final CalculatorView view;

  CalculatorController(this.calculator, this.view);

  void run(List<String> args) {
    try {
      double result = calculator.calculate(args);
      view.displayResult(result);
    } catch (e) {
      view.displayError(e.toString());
    }
  }
}

