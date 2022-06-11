part of common;

class MeterUseCase {
  final int sendID;

  final RxDouble _speedValue = 0.0.obs;

  MeterUseCase(this.sendID) {
    MeterRepository meterRepository = Get.find<ConnectToArduino>()
        .metersRepos
        .firstWhere((element) => element.sendID == sendID);

    meterRepository.value.listen((p0) {
      _speedValue.value = p0;
    });
  }
  RxDouble get speedValue => _speedValue;
}
