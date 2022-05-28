import 'package:math_expressions/math_expressions.dart';

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

  static List<int> intToBytes(int input) {
    String bytes = input.toRadixString(2);

    String byteFirst = '';
    String byteLast = '';

    if (bytes.length > 8) {
      byteFirst = bytes.substring(0, 8);
      byteLast = bytes.substring(8, bytes.length);
    } else if (bytes.length == 8) {
      byteFirst = bytes;
      byteLast = '0';
    } else {
      var zeros =
          List.generate(8 - bytes.length, (index) => 0).join().toString();
      byteFirst = zeros + bytes;
      byteLast = '0';
    }
    var resFirst = int.parse(byteFirst, radix: 2);
    var resLast = int.parse(byteLast, radix: 2);
    if (input == MathController.byteToInt([resFirst, resLast])) {
      return [resFirst, resLast];
    } else {
      return intToBytes(input + 1);
    }
  }
}
