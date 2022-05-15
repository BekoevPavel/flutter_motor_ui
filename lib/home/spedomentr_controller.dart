import 'package:get/get.dart';

class SpeedometrController extends GetxController {
  RxInt deltaTimeSensors = 0.obs;
  RxDouble speed = 0.0.obs;
  void startApp() {
    speed.value = 0.0;
  }

  void setDeltaTimeSensors(int delta) {
    deltaTimeSensors.value = delta;
  }

  void setSpeed(double speed) {
    this.speed.value = speed;
  }
}
