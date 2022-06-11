part of repositories;

class MeterRepositoryImpl implements MeterRepository {
  final RxDouble _value = 0.0.obs;
  @override
  int sendID;

  MeterRepositoryImpl(this.sendID);

  @override
  void updateMeter(Uint8List data) {
    final lst = data.toList();
    for (int i = 0; i < lst.length; i++) {
      if (lst[i] == sendID && sendID != 10) {
        /// ЗНАЧЕНИЕ 1 БАЙТ
        _value.value = lst[i + 1].toDouble();
      } else if (lst[i] == sendID && sendID == 10) {
        /// ЗНАЧЕНИЕ 2 БАЙТА
        _value.value =
            MathController.byteToInt([lst[i + 1], lst[i + 2]]).toDouble();
      }
    }
  }

  @override
  RxDouble get value => _value;
}
