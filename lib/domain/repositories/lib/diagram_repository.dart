part of repositories;

abstract class DiagramRepository {
  void addDiagramLine(int x, int y);

  RxList<DiagramLine> get diagramLines;
}
