part of home;

class SliderState extends GetxController {
  SliderState();
  void sendValue(int value) {
    // if (type == SlyderType.injection) {
    //   Get.find<ConnectToArduino>().sendToClient([1, value.toInt(), 0]);
    // } else if (type == SlyderType.spark) {
    //   Get.find<ConnectToArduino>().sendToClient([2, value.toInt(), 0]);
    // }
  }

  void correctValue(double delta) {
    CorrectOutputState.correct(delta);
  }
}
