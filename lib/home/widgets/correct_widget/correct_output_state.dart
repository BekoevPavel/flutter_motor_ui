import 'package:flutter_motor_ui/home/spedomentr_controller.dart';
import 'package:flutter_motor_ui/usecases/math_controller.dart';
import 'package:get/get.dart';

class CorrectOutputState extends GetxController {
  static RxDouble y = 0.0.obs;
  static double tempValue = 0;
  static RxDouble deltaTime = Get.find<SpeedometrController>().deltaTimeSensors;
  static void calculate(String func, double param) {
    y.value = MathController.calculate(func, param);
    tempValue = y.value;
  }

  static void correct(double delta) {
    y.value = delta * tempValue / 50;
    print('correct: 4${y.value}');
  }
}
