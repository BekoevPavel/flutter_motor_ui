part of repositories;

class DiagramRepositoryImpl extends DiagramRepository {
  final RxList<DiagramLine> _diagraLines = RxList([DiagramLine(0, 0)]);
  @override
  void addDiagramLine(int x, int y) {
    _diagraLines.add(DiagramLine(x, y));
  }

  @override
  RxList<DiagramLine> get diagramLines => _diagraLines;
}
