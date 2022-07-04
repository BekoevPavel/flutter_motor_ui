part of common;

class MathController {
  static double calculate(String func, double param) {
    if (func != '') {
      ContextModel cm = ContextModel();

      cm.bindVariable(Variable('v'), Number(param));
      Parser p = Parser();

      Expression exp = p.parse(func);

      double y = exp.evaluate(EvaluationType.REAL, cm);

      return y;
    }
    return 0;
  }

  static int byteToInt(List<int> input) {
    return (input[0] * 256) + input[1];
  }

  static List<int> intToBytes(int input) {
    final first = input ~/ 256;
    final last = input - first * 256;

    List<int> result = [first, last];

    return result;
  }
}
