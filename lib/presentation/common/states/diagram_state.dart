part of common;

class DiagramState extends GetxController {
  late RxDouble? size;
  late RxList<charts.Series<dynamic, String>> seriesList;
  // RxList<DiagramLine> diagramLines = RxList([
  //   DiagramLine(
  //     60,
  //     17,
  //   ),
  //   DiagramLine(
  //     65,
  //     200,
  //   ),
  //   DiagramLine(
  //     500,
  //     200,
  //   )
  // ]);
  RxList<DiagramLine> diagramLines =
      RxList.generate(12, (index) => DiagramLine(index * 50, 200));
  DiagramState() {
    //TODO сделать когда будет конект
    //DiagramUseCase diagramUseCase = DiagramUseCase();

    seriesList = RxList(_createSampleData(diagramLines));
    //TODO сделать когда будет конект
    // diagramUseCase.lenght.listen((p0) {
    //   seriesList.value = _createSampleData(diagramUseCase.diagramLines);
    // });
  }

  void addDiagramLine(DiagramLine data) {
    diagramLines.add(data);
    seriesList.value = _createSampleData(diagramLines);
  }

  /// Create one series with sample hard coded data.
  List<charts.Series<DiagramLine, String>> _createSampleData(
      List<DiagramLine> list) {
    return [
      charts.Series<DiagramLine, String>(
        id: 'Lines',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (DiagramLine lines, _) => lines.x.toString(),
        measureFn: (DiagramLine lines, _) => lines.y,
        data: list,
      )
    ];
  }
}
