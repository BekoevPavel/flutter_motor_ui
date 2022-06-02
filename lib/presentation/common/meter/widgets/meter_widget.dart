part of meter;

class MeterWidget extends StatelessWidget {
  const MeterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: ff());
  }
}

Widget ff() {
  return SfRadialGauge(axes: <RadialAxis>[
    RadialAxis(
      pointers: const <GaugePointer>[
        RangePointer(
          value: 50,
          cornerStyle: CornerStyle.bothCurve,
          width: 0.2,
          sizeUnit: GaugeSizeUnit.factor,
        )
      ],
      annotations: const <GaugeAnnotation>[
        GaugeAnnotation(positionFactor: 0.1, angle: 90, widget: Text('60'))
      ],
      minimum: 0,
      maximum: 100,
      showLabels: false,
      showTicks: false,
      axisLineStyle: const AxisLineStyle(
        thickness: 0.2,
        cornerStyle: CornerStyle.bothCurve,
        color: Color.fromARGB(30, 0, 169, 181),
        thicknessUnit: GaugeSizeUnit.factor,
      ),
    )
  ]);
}
