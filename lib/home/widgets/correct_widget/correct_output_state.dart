import 'package:flutter_motor_ui/home/spedomentr_controller.dart';
import 'package:flutter_motor_ui/usecases/arduino_connect.dart';
import 'package:flutter_motor_ui/usecases/math_controller.dart';
import 'package:get/get.dart';

class CorrectOutputState extends GetxController {
  String function = "0";
  RxDouble y = 0.0.obs;
  double tempValue = 0;
  RxDouble x = Get.find<SpeedometrController>().deltaTimeSensors;
  double delta = 50;
  void calculate(String func) {
    if (func != '') function = func;
    y.value = MathController.calculate(func, x.value);
    tempValue = y.value;
  }

  void correct({double? delta1}) {
    delta = delta1 ?? delta;
    calculate(function);
    y.value = (delta1 ?? delta) * tempValue / 50;
  }

  void sendToArduino(String name) async {
    if (name == 'Injection') {
      y.listen((p0) {
        Get.find<ConnectToArduino>().sendToClient([1, 240]);
      });
    } else {
      y.listen((p0) {
        Get.find<ConnectToArduino>().sendToClient([2, 240]);
      });
    }
  }
}
