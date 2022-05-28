part of usecases;

class SpeedometrController extends GetxController {
  RxDouble deltaTimeSensors = 0.0.obs;
  RxDouble speed = 0.0.obs;
  void startApp() {
    speed.value = 0.0;
  }

  void setDeltaTimeSensors(double delta) {
    deltaTimeSensors.value = delta;
  }

  void setSpeed(double speed) {
    this.speed.value = speed;
  }
}
