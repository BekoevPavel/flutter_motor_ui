part of home;

class CorrectOutputState extends GetxController {
  final connector = Get.find<ConnectToArduino>();
  late final SendUseCase sendUseCase;
  RxDouble x = 0.0.obs;
  RxDouble y = 0.0.obs;
  CorrectOutputState() {
    sendUseCase = SendUseCase(14);
    final lst = connector.metersRepos
        .where((element) => element.sendID == 228)
        .toList();
    if (lst.isNotEmpty) {
      x = lst.first.value;
    }
  }
  RxDouble calculateY(String func) {
    y.value = MathController.calculate(func, x.value);

    sendUseCase.send(14, (y.value * 1000).toInt());

    return y;
  }
  // static RxDouble y = 0.0.obs;
  // static double tempValue = 0;
  // static RxDouble deltaTime = Get.find<SpeedometrController>().deltaTimeSensors;
  // static void calculate(String func, double param) {
  //   y.value = MathController.calculate(func, param);
  //   tempValue = y.value;
  // }

  // static void correct(double delta) {
  //   y.value = delta * tempValue / 50;
  //   print('correct: 4${y.value}');
  // }
}
