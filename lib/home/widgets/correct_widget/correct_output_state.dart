import 'package:flutter_motor_ui/usecases/math_controller.dart';
import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

import '../../../usecases/alldata.dart';

class CorrectOutputState extends GetxController {
  static RxDouble y = 0.0.obs;
  static double tempValue = 0;
  static void calculate(String func) {
    double param = 5.0;
    y.value = MathController.calculate(func, param);
    tempValue = y.value;
  }

  static void correct(double delta) {
    y.value = delta * tempValue / 50;
  }
}
