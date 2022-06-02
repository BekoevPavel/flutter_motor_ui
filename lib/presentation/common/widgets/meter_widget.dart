part of common;

class MeterWidget extends StatelessWidget {
  final double? maxValue;
  final double? sizeKef;
  final String? valueName;
  late final MeterState controller;
  final Color? color;
  final Color? backColor;
  MeterWidget(
      {Key? key,
      this.sizeKef,
      this.maxValue,
      this.valueName,
      this.color,
      this.backColor})
      : super(key: key) {
    controller = MeterState(maxValue: maxValue ?? 100);
    Get.find<AllData>().speedometrState = controller;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * (sizeKef ?? 0.1),
      height: MediaQuery.of(context).size.width * (sizeKef ?? 0.1),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter * 0.8,
            child: Text(
              valueName ?? 'N',
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width *
                      (sizeKef ?? 0.1) *
                      0.1),
            ),
          ),
          Obx(
            () => SfRadialGauge(
              axes: <RadialAxis>[
                RadialAxis(
                  pointers: <GaugePointer>[
                    RangePointer(
                      value: controller.value.value,
                      cornerStyle: CornerStyle.bothCurve,
                      width: 0.2,
                      sizeUnit: GaugeSizeUnit.factor,
                      color: color,
                    )
                  ],
                  annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                      positionFactor: 0.1,
                      angle: 90,
                      widget: Text(
                        controller.value.value.toString(),
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width *
                                (sizeKef ?? 0.1) *
                                0.2),
                      ),
                    ),
                  ],
                  minimum: 0,
                  maximum: maxValue ?? 100.0,
                  showLabels: false,
                  showTicks: false,
                  axisLineStyle: AxisLineStyle(
                    thickness: 0.2,
                    cornerStyle: CornerStyle.bothCurve,
                    color: backColor,
                    thicknessUnit: GaugeSizeUnit.factor,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
