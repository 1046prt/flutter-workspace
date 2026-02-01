class CalculatorLogic {
  String text = '0';

  void press(String value) {
    if (value == 'AC') {
      text = '0';
      return;
    }

    if (value == '=') {
      text = calculate(text);
      return;
    }

    if (value == '+' ||
        value == '-' ||
        value == '*' ||
        value == '/' ||
        value == '%') {
      if (text.endsWith(' ') || text == '0') {
        return;
      }
      text = '$text $value ';
      return;
    }

    if (text == '0') {
      text = value;
    } else {
      text = '$text$value';
    }
  }

  double addNumbers(double a, double b) {
    return a + b;
  }

  double subtractNumbers(double a, double b) {
    return a - b;
  }

  double multiplyNumbers(double a, double b) {
    return a * b;
  }

  String divideNumbers(double a, double b) {
    if (b == 0) {
      return 'Error';
    } else {
      return (a / b).toString();
    }
  }

  String moduloNumbers(double a, double b) {
    if (b == 0) {
      return 'Error';
    } else {
      return (a % b).toString();
    }
  }

  String calculate(String exp) {
    try {
      List<String> parts = exp.split(' ');

      if (parts.length == 1) {
        return exp;
      }

      double result = double.parse(parts[0]);

      for (int i = 1; i < parts.length; i = i + 2) {
        String operator = parts[i];
        double number = double.parse(parts[i + 1]);

        if (operator == '+') {
          result = addNumbers(result, number);
        } else if (operator == '-') {
          result = subtractNumbers(result, number);
        } else if (operator == '*') {
          result = multiplyNumbers(result, number);
        } else if (operator == '/') {
          String divResult = divideNumbers(result, number);
          if (divResult == 'Error') {
            return 'Error';
          } else {
            result = double.parse(divResult);
          }
        } else if (operator == '%') {
          String modResult = moduloNumbers(result, number);
          if (modResult == 'Error') {
            return 'Error';
          } else {
            result = double.parse(modResult);
          }
        }
      }

      String resultString = result.toString();
      if (resultString.endsWith('.0')) {
        resultString = resultString.replaceAll('.0', '');
      }

      return resultString;
    } catch (e) {
      return 'Error';
    }
  }
}
