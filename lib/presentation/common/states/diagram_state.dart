part of common;

class DiagramState extends GetxController {
  late RxDouble? size;
  late RxList<charts.Series<dynamic, String>> seriesList;
  late List<DiagramLine> diagramLines;
  DiagramState({double? size}) {
    diagramLines = [DiagramLine(0, 0)];
    if (size != null) {
      this.size = RxDouble(size);
    }
    seriesList = RxList(_createSampleData(diagramLines));
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
