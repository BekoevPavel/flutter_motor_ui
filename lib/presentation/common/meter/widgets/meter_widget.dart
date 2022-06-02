part of meter;

class MeterWidget extends StatelessWidget {
  final double? maxValue;
  final double? sizeKef;
  final String? valueName;
  const MeterWidget({Key? key, this.sizeKef, this.maxValue, this.valueName})
      : super(key: key);

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
          SfRadialGauge(
            axes: <RadialAxis>[
              RadialAxis(
                pointers: const <GaugePointer>[
                  RangePointer(
                    value: 50,
                    cornerStyle: CornerStyle.bothCurve,
                    width: 0.2,
                    sizeUnit: GaugeSizeUnit.factor,
                  )
                ],
                annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                      positionFactor: 0.1,
                      angle: 90,
                      widget: Text(
                        '60',
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width *
                                (sizeKef ?? 0.1) *
                                0.2),
                      ))
                ],
                minimum: 0,
                maximum: maxValue ?? 100.0,
                showLabels: false,
                showTicks: false,
                axisLineStyle: const AxisLineStyle(
                  thickness: 0.2,
                  cornerStyle: CornerStyle.bothCurve,
                  color: Color.fromARGB(30, 0, 169, 181),
                  thicknessUnit: GaugeSizeUnit.factor,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
