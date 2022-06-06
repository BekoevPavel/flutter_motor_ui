part of repositories;

class SpedometerRepositoryImpl extends MeterRepository {
  final RxDouble _value = 0.0.obs;
  @override
  void updateMeter(Uint8List data) {
    _value.value = data.toList().first / 5;
  }

  @override
  RxDouble get value => _value;
}
