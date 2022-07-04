part of common;

class MeterUseCase {
  final int sendID;

  final RxDouble _speedValue = 0.0.obs;

  MeterUseCase(this.sendID) {
    List<MeterRepository> repositories = Get.find<ConnectToArduino>()
        .metersRepos
        .where((element) => element.sendID == sendID)
        .toList();
    if (repositories.isNotEmpty) {
      repositories.first.value.listen((p0) {
        _speedValue.value = p0;
      });
    }
  }
  RxDouble get speedValue => _speedValue;
}
