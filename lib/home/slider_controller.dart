import 'package:get/get.dart';

class SliderController extends GetxController {
  RxDouble gasValue = 0.0.obs;

  void setGasValue(double gas) {
    this.gasValue.value = gas;
  }
}
