import 'package:get/get.dart';
import 'core/core.dart';
import 'domain/usecases/common/common.dart';

void initDI() {
  Get.put<ConnectToArduino>(ConnectToArduino(), permanent: true);
  Get.put<AllData>(AllData());
  Get.put<SpeedometrController>(SpeedometrController());
  Get.put<Sizes>(Sizes());
}
