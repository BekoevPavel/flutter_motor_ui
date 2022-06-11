part of repositories;

abstract class MeterRepository {
  final int sendID;
  MeterRepository(this.sendID);
  void updateMeter(Uint8List data);

  RxDouble get value;
}
