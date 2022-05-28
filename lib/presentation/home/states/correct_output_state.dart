part of home;

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
