import 'package:calculator/app/model/calculator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class CalculatorViewModel extends GetxController {
  var display = ''.obs;
  var operand1 = ''.obs;
  var operand2 = ''.obs;
  var operator = ''.obs;
  var resetNextInput = false.obs;
  var history = <String>[].obs;

  final Calculator calculator = Calculator.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  CalculatorViewModel() {
    _loadHistory();
  }

  void addInput(String input) {
    if (resetNextInput.value) {
      _resetInputs();
      resetNextInput.value = false;
    }
    _handleInput(input);
    _updateDisplay();
  }

  void setOperator(String op) {
    if (operand1.isNotEmpty && operand2.isEmpty) {
      resetNextInput.value = false;
      operator.value = op;
      _updateDisplay();
    }
  }

  void calculateResult() async {
    if (_canCalculate()) {
      try {
        final result = calculator
            .calculate([operand1.value, operator.value, operand2.value]);
        final expression = _buildExpression(result);
        _updateStateAfterCalculation(result);
        await _saveToHistory(expression);
      } catch (e) {
        display.value = 'Error';
        resetNextInput.value = true;
      }
    }
  }

  void _updateDisplay() {
    display.value = operand1.value + operator.value + operand2.value;
  }

  void _loadHistory() async {
    final user = auth.currentUser;
    if (user != null) {
      final snapshot = await firestore
          .collection('history')
          .where('uid', isEqualTo: user.uid)
          .orderBy('timestamp')
          .get();
      final data = snapshot.docs
          .map((doc) => doc.data()['expression'] as String)
          .toList();
      history.addAll(data);
    }
  }

  void _handleInput(String input) {
    if (input == '.') {
      if (operator.value.isEmpty && !operand1.value.contains('.')) {
        operand1.value += input;
      } else if (operator.value.isNotEmpty && !operand2.value.contains('.')) {
        operand2.value += input;
      }
    } else {
      if (operator.value.isEmpty) {
        operand1.value += input;
      } else {
        operand2.value += input;
      }
    }
  }

  bool _canCalculate() {
    return operand1.isNotEmpty && operand2.isNotEmpty && operator.isNotEmpty;
  }

  String _buildExpression(double result) {
    return '${operand1.value} ${operator.value} ${operand2.value} = $result';
  }

  void _updateStateAfterCalculation(double result) {
    display.value = result.toString();
    operand1.value = result.toString();
    operand2.value = '';
    operator.value = '';
    resetNextInput.value = true;
  }

  Future<void> _saveToHistory(String expression) async {
    final user = auth.currentUser;
    if (user != null) {
      await firestore.collection('history').add({
        'expression': expression,
        'uid': user.uid,
        'timestamp': FieldValue.serverTimestamp()
      });
      history.add(expression);
    }
  }

  void _resetInputs() {
    operand1.value = '';
    operand2.value = '';
    operator.value = '';
  }
}
