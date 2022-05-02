import 'package:get/get.dart';

class SpeedometrController extends GetxController {
  RxDouble speed = 0.0.obs;
  void startApp() {
    speed.value = 0.0;
  }

  void setSpeed(double speed) {
    this.speed.value = speed;
  }
}
