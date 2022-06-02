part of diagram;

class MyDiagram extends StatelessWidget {
  late final DiagramState controller;
  final double? size;
  final String xName;
  final String yName;
  MyDiagram({Key? key, this.size, required this.xName, required this.yName})
      : super(key: key) {
    controller = DiagramState(size: size);
  }

  @override
  Widget build(BuildContext context) {
    return (size == null)
        ? Expanded(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(xName),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(yName),
                ),
                _SimpleBarChart(
                  controller: controller,
                ),
              ],
            ),
          )
        : SizedBox(
            width: size,
            height: size,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(xName),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(yName),
                ),
                _SimpleBarChart(
                  controller: controller,
                ),
              ],
            ),
          );
  }
}

class _SimpleBarChart extends StatelessWidget {
  final bool? animate;
  final DiagramState controller;

  const _SimpleBarChart({this.animate, Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => charts.BarChart(
        controller.seriesList.value,
        animate: animate,
      ),
    );
  }
}
