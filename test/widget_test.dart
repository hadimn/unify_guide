
import 'package:calculator/materials/pages/calculator/calculatorFunctions.dart';

void main() {
  double.parse("");
  Calculator calculator = Calculator();

  // Basic arithmetic operations
  print(calculator.calculate("9*9+6-9/3")); // Expected output: 84.0
  print(calculator.calculate("10+5*2")); // Expected output: 20.0
  print(calculator.calculate("10-5*2")); // Expected output: 0.0
  print(calculator.calculate("8/4+6")); // Expected output: 8.0
  print(calculator.calculate("8%3+5*2")); // Expected output: 12.0

  // Testing multiple consecutive operations
  print(calculator.calculate("10+5-2")); // Expected output: 13.0
  print(calculator.calculate("100-50+25")); // Expected output: 75.0
  print(calculator.calculate("10*2/5+6-3")); // Expected output: 7.0

  // Complex expressions with mixed operators
  print(calculator.calculate("10+6*3-8/4+7")); // Expected output: 33.0
  print(calculator.calculate("15-3*4+8/2")); // Expected output: 7.0
  print(calculator.calculate("5+3*2-6/3")); // Expected output: 9.0
  print(calculator.calculate("18/3*2+7-5*1")); // Expected output: 14.0

  // Edge cases: single numbers and operators
  print(calculator.calculate("5")); // Expected output: 5.0
  print(calculator.calculate("0")); // Expected output: 0.0
  print(calculator.calculate("5*0")); // Expected output: 0.0

  // Complex cases with modulus
  print(calculator.calculate("25%7+6*2-4/2")); // Expected output: 14.5
  print(calculator.calculate("50%8+10*2-15/3")); // Expected output: 25.0
  print(calculator.calculate("10%3+2*5-6")); // Expected output: 6.0

  // Consecutive operators and removing duplicates
  print(calculator.calculate("9++9--5**2//3")); // Expected output: 25.0 (expression becomes 9+9-5*2/3)
}
