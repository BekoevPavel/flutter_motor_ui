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
    var byteFirst = input[0].toRadixString(2);
    var byteLast = input[1].toRadixString(2);

    return int.parse(byteFirst + byteLast, radix: 2);
  }
}
