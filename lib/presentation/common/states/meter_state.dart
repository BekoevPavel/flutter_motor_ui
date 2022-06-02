part of common;

class MeterState extends GetxController {
  double maxValue;
  final RxDouble _value = 0.0.obs;
  MeterState({required this.maxValue});

  void setValue(double value) {
    _value.value = value;
  }

  RxDouble get value {
    return _value;
  }
}
