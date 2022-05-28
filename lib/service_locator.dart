import 'package:flutter_motor_ui/home/spedomentr_controller.dart';
import 'package:flutter_motor_ui/usecases/alldata.dart';
import 'package:flutter_motor_ui/usecases/arduino_connect.dart';
import 'package:get/get.dart';

void initDI() {
  //Get.put<ConnectToArduino>(ConnectToArduino(), permanent: true);
  Get.put<AllData>(AllData());
  Get.put<SpeedometrController>(SpeedometrController());
  Get.put<Sizes>(Sizes());
}
