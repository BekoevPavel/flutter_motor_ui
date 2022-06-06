part of repositories;

abstract class MeterRepository {
  void updateMeter(Uint8List data);

  RxDouble get value;
}
