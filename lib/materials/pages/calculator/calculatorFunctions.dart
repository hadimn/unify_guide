class Calculator {
  Map<String, String> nonRealOperator = {
    "%": "%",
    "\u00F7": "/",
    "\u00D7": "*",
    "\u2212": "-",
    "+": "+",
  };

  Map<String, String> realOperator = {
    "%": "%",
    "/": "\u00F7",
    "*": "\u00D7",
    "-": "\u2212",
    "+": "+",
  };

  // Calculate the final expression after processing
  double calculate(String expression) {
    // 1. Convert display operators to real operators at the very beginning
    expression = changeToRealOperators(expression);
    // 2. Remove duplicate operators (still necessary with your existing logic)
    expression = removeOperatorsDuplicates(expression);
    // print("Expression after normalization and deduplication: $expression");

    // 3. Evaluate the cleaned expression
    return _evaluateExpression(expression);
  }

  double _evaluateExpression(String expression) {
    List<String> tokens = _parseExpression(expression);
    // print("Tokens after parsing: $tokens");
    if (tokens.isEmpty) {
      throw FormatException("Empty or invalid expression.");
    }
    return _evaluateTokens(tokens);
  }

  // Evaluate tokens recursively to handle parentheses and operator precedence
  double _evaluateTokens(List<String> tokens) {
    // First pass: Handle multiplication, division, modulo, and parentheses
    List<String> tempTokens = [];
    for (int i = 0; i < tokens.length; i++) {
      String token = tokens[i];

      if (token == "(") {
        int closingIndex = _findClosingParenthesis(tokens, i);
        // Extract the sub-expression within parentheses
        List<String> subExpressionTokens = tokens.sublist(i + 1, closingIndex);
        double subResult = _evaluateTokens(subExpressionTokens);
        tempTokens.add(subResult.toString());
        i = closingIndex; // Move index past the processed sub-expression
      } else {
        tempTokens.add(token);
      }
    }

    // After handling parentheses, re-evaluate this simplified list for multiplication/division
    List<String> processedHigherPrecedence = [];
    if (tempTokens.isEmpty) {
        throw FormatException("Empty expression after parenthesis evaluation.");
    }
    double current = double.parse(tempTokens[0]);

    for (int i = 1; i < tempTokens.length; i += 2) {
      String op = tempTokens[i];
      double next = double.parse(tempTokens[i + 1]);

      if (op == "*") {
        current *= next;
      } else if (op == "/") {
        if (next == 0) {
          throw ArgumentError("Division by zero.");
        }
        current /= next;
      } else if (op == "%") {
        current %= next;
      } else {
        // If it's '+' or '-', add the current accumulated value and operator
        processedHigherPrecedence.add(current.toString());
        processedHigherPrecedence.add(op);
        current = next; // Start accumulating for the next higher precedence operation
      }
    }
    processedHigherPrecedence.add(current.toString()); // Add the last accumulated value

    // Second pass: handle addition and subtraction
    if (processedHigherPrecedence.isEmpty) {
        throw FormatException("Empty expression after higher precedence evaluation.");
    }
    double result = double.parse(processedHigherPrecedence[0]);

    for (int i = 1; i < processedHigherPrecedence.length; i += 2) {
      String op = processedHigherPrecedence[i];
      double num = double.parse(processedHigherPrecedence[i + 1]);

      if (op == "+") {
        result += num;
      } else if (op == "-") {
        result -= num;
      }
    }

    return result;
  }

  // Helper function to find the matching closing parenthesis
  int _findClosingParenthesis(List<String> tokens, int startIndex) {
    int openParens = 1;
    // Start search from *after* the opening parenthesis provided by startIndex
    for (int i = startIndex + 1; i < tokens.length; i++) {
      if (tokens[i] == "(") {
        openParens++;
      } else if (tokens[i] == ")") {
        openParens--;
        if (openParens == 0) {
          return i; // Return the index of the matching closing parenthesis
        }
      }
    }
    throw FormatException("Mismatched parentheses: No matching ')' found for '(' at index $startIndex.");
  }

  // Parse and tokenize the expression string
  List<String> _parseExpression(String expression) {
    List<String> tokens = [];
    String currentNumber = '';

    for (var i = 0; i < expression.length; i++) {
      String char = expression[i];

      if (_isDigit(char) || char == '.') {
        currentNumber += char;
      } else if (_isOperator(char) || char == "(" || char == ")") {
        if (currentNumber.isNotEmpty) {
          tokens.add(currentNumber); // Add accumulated number
          currentNumber = ''; // Reset current number
        }

        // Handle unary minus (e.g., -5, 10 + -5)
        // If it's a '-', and it's at the start, or follows an operator, or follows '(',
        // and the next char is a digit or '.', it's a unary minus.
        if (char == '-' &&
            (i == 0 ||
                _isOperator(expression[i - 1]) ||
                expression[i - 1] == '(')) {
          // Check if there's a character after and it's a digit or decimal
          if (i + 1 < expression.length && (_isDigit(expression[i + 1]) || expression[i + 1] == '.')) {
            currentNumber += char; // Start accumulating the negative number
            continue; // Continue loop to get the digits of the negative number
          }
        }
        tokens.add(char); // Add the operator or parenthesis token
      } else {
        // Handle unexpected characters (e.g., letters, symbols)
        throw FormatException("Invalid character: '$char' at position $i");
      }
    }

    if (currentNumber.isNotEmpty) {
      tokens.add(currentNumber); // Add the last number if any
    }

    // Post-processing for expressions like "(-5)" where unary minus isn't directly absorbed by digit accumulation
    List<String> finalTokens = [];
    for (int i = 0; i < tokens.length; i++) {
        String token = tokens[i];
        if (token == '-' &&
            (i == 0 || _isOperator(tokens[i-1]) || tokens[i-1] == '(')) {
            // This is a potential unary minus. Look at the next token.
            if (i + 1 < tokens.length && _isNumber(tokens[i+1])) {
                finalTokens.add(token + tokens[i+1]); // Merge '-' with the number
                i++; // Skip the next token as it's been consumed
            } else {
                finalTokens.add(token); // It's a binary minus
            }
        } else {
            finalTokens.add(token);
        }
    }

    return finalTokens;
  }

  // Check if a string represents a number (can be negative or decimal)
  bool _isNumber(String s) {
    if (s == null || s.isEmpty) return false;
    return double.tryParse(s) != null;
  }

  // Remove duplicate operators from the expression
  // This logic is retained as per your request but has limitations.
  String removeOperatorsDuplicates(String expression) {
    String result = '';
    String? previousChar;

    for (var i = 0; i < expression.length; i++) {
      String currentChar = expression[i];

      // Skip if the first character is a binary operator. Unary minus is allowed.
      if (i == 0 && _isOperator(currentChar) && currentChar != '-') {
        continue;
      }

      // If current is an operator, and previous was also an operator (excluding unary minus case)
      if (_isOperator(currentChar)) {
        if (previousChar != null && _isOperator(previousChar)) {
          // Allow cases like '5 * -3' but filter '5 * / 3' or '5 + + 3'
          if (currentChar == '-' && (previousChar == '*' || previousChar == '/' || previousChar == '%' || previousChar == '(')) {
             // This is likely a unary minus, allow it
             result += currentChar;
          } else if (previousChar == '(' && currentChar == '-') {
              // Allow opening parenthesis followed by unary minus: "(-5)"
              result += currentChar;
          }
          else {
            // Replace consecutive operators with the last one entered
            // This behavior is specific to your original code.
            // A truly robust parser would throw an error or handle it differently.
            if (result.isNotEmpty) {
                result = result.substring(0, result.length - 1);
            }
            result += currentChar;
          }
        } else {
          result += currentChar;
        }
      } else {
        result += currentChar;
      }
      previousChar = currentChar;
    }

    // Handle leading operators (e.g., if " + 5" became "+5")
    // This is problematic. It's better to explicitly handle unary plus/minus or disallow.
    // Given the previous deduplication logic, this might be to clean up unwanted leading operators.
    if (result.isNotEmpty && _isOperator(result[0]) && result[0] != '-') {
      result = result.substring(1);
    }
    return result;
  }

  // Check if a character is an operator
  bool _isOperator(String char) {
    // Only check for real operators as changeToRealOperators is called first
    return ['+', '-', '*', '/', '%'].contains(char);
  }

  // Check if a character is a digit
  bool _isDigit(String char) {
    return char.codeUnitAt(0) >= '0'.codeUnitAt(0) &&
        char.codeUnitAt(0) <= '9'.codeUnitAt(0);
  }

  // Change display operators (÷, ×, −) to real operators (/, *, -)
  String changeToRealOperators(String expression) {
    String result = '';
    for (var i = 0; i < expression.length; i++) {
      String currentChar = expression[i];
      if (nonRealOperator.containsKey(currentChar)) {
        result += nonRealOperator[currentChar]!; // Replace with real operator
      } else {
        result += currentChar; // Keep numbers and parentheses unchanged
      }
    }
    return result;
  }

  // Change real operators (/, *, -) to display operators (÷, ×, −)
  String changeToNonRealOperators(String expression) {
    String result = '';
    for (var i = 0; i < expression.length; i++) {
      String currentChar = expression[i];
      if (realOperator.containsKey(currentChar)) {
        result += realOperator[currentChar]!; // Replace with display operator
      } else {
        result += currentChar; // Keep numbers and parentheses unchanged
       }
    }
    return result;
  }
}