import 'package:flutter/material.dart';
import 'package:flutter_motor_ui/home/spedomentr_controller.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../../usecases/alldata.dart';

class Speedometr extends StatelessWidget {
  const Speedometr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sizes = Get.find<Sizes>();
    return Container(
      width: MediaQuery.of(context).size.width * sizes.speedomterSize,
      height: MediaQuery.of(context).size.width * sizes.speedomterSize,
      child: Center(
        child: Obx(() {
          var controller = Get.find<SpeedometrController>();

          return SfRadialGauge(axes: <RadialAxis>[
            RadialAxis(
              pointers: <GaugePointer>[
                RangePointer(
                  value: controller.speed.value.toDouble(),
                  cornerStyle: CornerStyle.bothCurve,
                  width: 0.2,
                  sizeUnit: GaugeSizeUnit.factor,
                )
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                    positionFactor: 0.1,
                    angle: 90,
                    widget: Obx(() {
                      return Text(
                        controller.speed.value.toStringAsFixed(0) + ' / 100',
                        style: TextStyle(fontSize: 11),
                      );
                    }))
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
        }),
      ),
    );
  }
}
