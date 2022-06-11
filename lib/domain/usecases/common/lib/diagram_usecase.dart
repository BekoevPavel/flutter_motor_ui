part of common;

class DiagramUseCase {
  DiagramRepository diagramReposinoty =
      Get.find<ConnectToArduino>().diagramRepos;
  final RxList<DiagramLine> _diagramLines = RxList([
    DiagramLine(
      0,
      0,
    )
  ]);

  final RxInt _lenght = 0.obs;

  DiagramUseCase() {
    diagramReposinoty.diagramLines.listen((p0) {
      _diagramLines.value = p0;
      _lenght.value = _diagramLines.length;
    });
  }
  RxList<DiagramLine> get diagramLines => _diagramLines;

  RxInt get lenght {
    return _lenght;
  }
}
