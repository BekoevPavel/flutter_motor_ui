part of common;

class MeterState extends GetxController {
  double maxValue;
  RxDouble _value = 0.0.obs;
  final int sendID;
  MeterState({required this.maxValue, required this.sendID}) {
    //TODO сделать когда будет конект
    //MeterUseCase meterUseCase = MeterUseCase(sendID);
    //_value = meterUseCase.speedValue;
  }

  void setValue(double value) {
    _value.value = value;
  }

  RxDouble get value {
    return _value;
  }
}
