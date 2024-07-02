import 'package:calculator/cli/controller/calculator_controller.dart';
import 'package:calculator/cli/model/calculator.dart';
import 'package:calculator/cli/view/calculator_view.dart';

void main(List<String> args) {
  CalculatorController controller =
      CalculatorController(Calculator.instance, CalculatorView.instance);
  controller.run(args);
}
