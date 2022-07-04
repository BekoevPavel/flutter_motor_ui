part of repositories;

class MeterRepositoryImpl implements MeterRepository {
  final RxDouble _value = 0.0.obs;
  @override
  int sendID;

  MeterRepositoryImpl(this.sendID);

  @override
  void updateMeter(Uint8List data) {
    final lst = data.toList();
    print('sendID: $sendID');

    if (lst[0] == sendID && sendID != 228) {
      /// ЗНАЧЕНИЕ 1 БАЙТ
      _value.value = lst[1].toDouble();
    } else if (lst[0] == sendID && sendID == 228) {
      /// ЗНАЧЕНИЕ 2 БАЙТА
      _value.value = (1.57 /
          (MathController.byteToInt([lst[1], lst[2]]).toDouble() * 0.001));
    }
  }

  @override
  RxDouble get value => _value;
}
