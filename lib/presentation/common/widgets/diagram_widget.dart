part of common;

class DiagramWidget extends StatelessWidget {
  late final DiagramState controller;
  final double? sizeKef;
  final String xName;
  final String yName;
  DiagramWidget(
      {Key? key, this.sizeKef, required this.xName, required this.yName})
      : super(key: key) {
    controller = DiagramState();
    //Get.find<AllData>().firstDiagramState = controller;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * (sizeKef ?? 0.2),
      height: MediaQuery.of(context).size.width * (sizeKef ?? 0.2),
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
