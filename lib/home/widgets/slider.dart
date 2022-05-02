import 'package:flutter/material.dart';
import 'package:flutter_motor_ui/usecases/arduino_connect.dart';
import 'package:get/get.dart';

import '../../usecases/alldata.dart';

enum SlyderType {
  gas,
  ignition,
}

class MySlider extends StatefulWidget {
  SlyderType type;
  MySlider({Key? key, required this.type}) : super(key: key);

  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  double _currentSliderValue = 20;
  var sizes = Get.find<Sizes>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sizes.gasSize * MediaQuery.of(context).size.width,
      child: Slider(
        value: _currentSliderValue,
        max: 100,
        //divisions: 5,
        label: _currentSliderValue.round().toString(),
        onChanged: (double value) {
          setState(() {
            _currentSliderValue = value;
            if (widget.type == SlyderType.gas) {
              Get.find<ConnectToArduino>().sendToClient([0, value.toInt()]);
            } else {
              Get.find<ConnectToArduino>().sendToClient([1, value.toInt()]);
            }
          });
        },
      ),
    );
  }
}
