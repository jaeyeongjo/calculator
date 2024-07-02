class Calculator {
  static final Calculator instance = Calculator._internal();

  Calculator._internal();

  static const int expectedArgsLength = 3;
  static const String invalidInputFormatError = "올바르지 않은 입력 형식입니다.";
  static const String invalidNumberFormatError = "올바르지 않은 숫자 형식입니다.";
  static const List<String> expectedOperators = ['+', '-', '*', '/'];
  static const String invalidOperatorError =
      "잘못된 연산자입니다. +, -, *, / 중 하나여야 합니다.";
  static const String divisionByZeroError = "0으로 나눌 수 없습니다.";

  double calculate(List<String> args) {
    _validateArgsLength(args);
    final operands = _validateOperands(args);
    final operator = _validateOperator(args[1]);

    return _performOperation(operands[0], operands[1], operator);
  }

  void _validateArgsLength(List<String> args) {
    if (args.length != expectedArgsLength) {
      throw const FormatException(invalidInputFormatError);
    }
  }

  List<double> _validateOperands(List<String> args) {
    try {
      double operand1 = double.parse(args[0]);
      double operand2 = double.parse(args[2]);
      return [operand1, operand2];
    } catch (e) {
      throw const FormatException(invalidNumberFormatError);
    }
  }

  String _validateOperator(String operator) {
    if (!expectedOperators.contains(operator)) {
      throw const FormatException(invalidOperatorError);
    }
    return operator;
  }

  double _performOperation(double operand1, double operand2, String operator) {
    switch (operator) {
      case '+':
        return _add(operand1, operand2);
      case '-':
        return _subtract(operand1, operand2);
      case '*':
        return _multiply(operand1, operand2);
      case '/':
        return _divide(operand1, operand2);
      default:
        throw const FormatException(invalidOperatorError);
    }
  }

  double _add(double a, double b) => a + b;

  double _subtract(double a, double b) => a - b;

  double _multiply(double a, double b) => a * b;

  double _divide(double a, double b) {
    if (b == 0) throw ArgumentError(divisionByZeroError);
    return a / b;
  }
}
