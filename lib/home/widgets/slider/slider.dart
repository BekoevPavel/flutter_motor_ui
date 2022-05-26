import 'package:flutter/material.dart';
import 'package:flutter_motor_ui/home/widgets/correct_widget/correct_output_state.dart';
import 'package:flutter_motor_ui/home/widgets/slider/slider_state.dart';
import 'package:get/get.dart';
import '../../../usecases/alldata.dart';

enum SlyderType { gas, ignition, injection, spark }

class MySlider extends StatefulWidget {
  final SlyderType type;
  late final SliderState controller;

  double? realValue = 0;
  double? value;
  MySlider(
      {Key? key,
      required this.type,
      this.realValue,
      value,
      CorrectOutputState? correctController})
      : super(key: key) {
    controller = SliderState(type: type, controller: correctController);
  }

  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  var sizes = Get.find<Sizes>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: sizes.gasSize * MediaQuery.of(context).size.width,
      child: Slider(
        value: widget.type == SlyderType.injection ||
                widget.type == SlyderType.spark
            ? widget.value ?? 50
            : widget.value ?? 0,
        max: 100,
        //divisions: 5,
        label: widget.value?.round().toString(),
        onChanged: (double value) {
          setState(() {
            widget.value = value;
            widget.realValue = value;

            //widget.controller.sendValue(value.toInt()); отправка на ардуино
            widget.controller.correctValue(value);
          });
        },
      ),
    );
  }
}
