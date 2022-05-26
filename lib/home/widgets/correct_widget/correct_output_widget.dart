import 'package:flutter/material.dart';
import 'package:flutter_motor_ui/home/spedomentr_controller.dart';
import 'package:flutter_motor_ui/home/widgets/correct_widget/correct_output_state.dart';
import 'package:get/get.dart';

import '../slider/slider.dart';

class CorrectOutPutWidget extends StatelessWidget {
  final TextEditingController textControllerFunction =
      TextEditingController(text: '');
  final FocusNode myFocusNodeFunction = FocusNode();
  final String name;
  CorrectOutputState controller = CorrectOutputState();
  CorrectOutPutWidget({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.sendToArduino(name);
    return Container(
      padding: const EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 0.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name),
          Row(
            children: [
              MySlider(
                correctController: controller,
                type: name == 'Injection'
                    ? SlyderType.injection
                    : SlyderType.spark,
              ),
              ElevatedButton(onPressed: () {}, child: const Text('Cansel'))
            ],
          ),
          Row(
            children: [
              Obx(() {
                if (textControllerFunction.text != '') {
                  controller.correct();
                }
                return Text(
                    'Delay = f(v) = ${controller.y.toStringAsFixed(1)} = ');
              }),
              SizedBox(
                width: 300,
                child: TextField(
                  onEditingComplete: () {
                    controller.calculate(textControllerFunction.text);

                    myFocusNodeFunction.unfocus();
                  },
                  focusNode: myFocusNodeFunction,
                  controller: textControllerFunction,
                  decoration: const InputDecoration(
                    labelText: 'Функция от v *',
                    hintText: 'Введите функцию от v',
                  ),
                ),
              ),
              Obx(
                () {
                  return Text('v = ${controller.x.toStringAsFixed(3)}');
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
