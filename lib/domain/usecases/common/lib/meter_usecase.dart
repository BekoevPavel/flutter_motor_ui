part of common;

class MeterUseCase {
  MeterRepository speedometrReposinoty =
      Get.find<ConnectToArduino>().speedpometrRepos;
  final RxDouble _speedValue = 0.0.obs;

  MeterUseCase() {
    speedometrReposinoty.value.listen((p0) {
      _speedValue.value = p0;
    });
  }
  RxDouble get speedValue => _speedValue;
}
