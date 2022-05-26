import 'package:flutter_motor_ui/home/widgets/correct_widget/correct_output_state.dart';
import 'package:get/get.dart';

import '../../../usecases/arduino_connect.dart';
import 'slider.dart';

class SliderState extends GetxController {
  SlyderType type;
  int? value;
  CorrectOutputState? controller;
  SliderState({required this.type, this.controller});
  void sendValue(int value) {
    if (type == SlyderType.injection) {
      Get.find<ConnectToArduino>().sendToClient([1, value.toInt(), 0]);
    } else if (type == SlyderType.spark) {
      Get.find<ConnectToArduino>().sendToClient([2, value.toInt(), 0]);
    }
  }

  void correctValue(double delta) {
    if (controller != null) {
      controller!.correct(delta1: delta);
    }
  }

  void cansel() {
    value = 50;
  }
}
