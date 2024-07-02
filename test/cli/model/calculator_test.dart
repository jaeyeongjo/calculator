import 'package:calculator/cli/model/calculator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Calculator', () {
    final calculator = Calculator.instance;

    test('덧셈 테스트', () {
      expect(calculator.calculate(['2', '+', '3']), 5.0);
    });

    test('뺄셈 테스트', () {
      expect(calculator.calculate(['5', '-', '2']), 3.0);
    });

    test('곱셈 테스트', () {
      expect(calculator.calculate(['3', '*', '4']), 12.0);
    });

    test('나눗셈 테스트', () {
      expect(calculator.calculate(['8', '/', '2']), 4.0);
    });

    test('0으로 나눌 때 예외 테스트', () {
      expect(() => calculator.calculate(['8', '/', '0']), throwsArgumentError);
    });

    test('잘못된 연산자 예외 테스트', () {
      expect(() => calculator.calculate(['2', '^', '3']), throwsFormatException);
    });

    test('잘못된 피연산자 예외 테스트', () {
      expect(() => calculator.calculate(['a', '+', '3']), throwsFormatException);
      expect(() => calculator.calculate(['2', '+', 'b']), throwsFormatException);
    });

    test('입력 길이 예외 테스트', () {
      expect(() => calculator.calculate(['2', '+']), throwsFormatException);
      expect(() => calculator.calculate(['2', '+', '3', '+']), throwsFormatException);
    });
  });
}
