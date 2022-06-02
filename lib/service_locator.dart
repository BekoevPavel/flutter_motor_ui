import 'package:get/get.dart';
import 'domain/usecases/usecases.dart';

void initDI() {
  // Get.put<ConnectToArduino>(ConnectToArduino(), permanent: true);
  Get.put<AllData>(AllData());
  Get.put<SpeedometrController>(SpeedometrController());
  Get.put<Sizes>(Sizes());
}
