part of common;

class MeterWidget extends StatelessWidget {
  final double? maxValue;
  final double? sizeKef;
  final String? valueName;
  late final MeterState controller;
  final Color? color;
  final Color? backColor;
  final String? unit;
  final String? title;
  final double? valueTest;
  MeterWidget(
      {Key? key,
      this.sizeKef,
      this.maxValue,
      this.valueName,
      this.color,
      this.backColor,
      this.unit,
      this.title,
      this.valueTest})
      : super(key: key) {
    controller = MeterState(maxValue: maxValue ?? 100);

    ///TODO
    //Get.find<AllData>().speedometrState = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * (sizeKef ?? 0.1),
          child: Column(children: [
            Text(title ?? '-'),
            const Divider(
              thickness: 2,
            )
          ]),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * (sizeKef ?? 0.1),
          height: MediaQuery.of(context).size.width * (sizeKef ?? 0.1),
          child: Stack(
            children: [
              Obx(
                () => SfRadialGauge(
                  axes: <RadialAxis>[
                    RadialAxis(
                      pointers: <GaugePointer>[
                        RangePointer(
                          //value: controller.value.value,
                          value: valueTest ?? controller.value.value,
                          cornerStyle: CornerStyle.bothCurve,
                          width: 0.1,
                          sizeUnit: GaugeSizeUnit.factor,
                          color: color,
                        )
                      ],
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                          positionFactor: 0.1,
                          angle: 90,
                          widget: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                (controller.value.value + (valueTest ?? 0))
                                    .toString(),
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            (sizeKef ?? 0.1) *
                                            0.1),
                              ),
                              Text(
                                unit ?? '-',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            (sizeKef ?? 0.1) *
                                            0.05),
                              ),
                            ],
                          ),
                        ),
                      ],
                      minimum: 0,
                      maximum: maxValue ?? 100.0,
                      showLabels: true,
                      showTicks: true,
                      axisLineStyle: AxisLineStyle(
                        thickness: 0.1,
                        cornerStyle: CornerStyle.endCurve,
                        color: backColor,
                        thicknessUnit: GaugeSizeUnit.factor,
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter * 0.85,
                child: Text(
                  valueName ?? 'N',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width *
                          (sizeKef ?? 0.1) *
                          0.1),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
