import 'package:flutter_motor_ui/home/widgets/correct_widget/correct_output_state.dart';
import 'package:get/get.dart';

import '../../../usecases/arduino_connect.dart';
import 'slider.dart';

class SliderState extends GetxController {
  SlyderType type;
  SliderState({required this.type});
  void sendValue(int value) {
    if (type == SlyderType.injection) {
      Get.find<ConnectToArduino>().sendToClient([1, value.toInt(), 0]);
    } else if (type == SlyderType.spark) {
      Get.find<ConnectToArduino>().sendToClient([2, value.toInt(), 0]);
    }
  }

  void correctValue(double delta) {
    CorrectOutputState.correct(delta);
  }
}
