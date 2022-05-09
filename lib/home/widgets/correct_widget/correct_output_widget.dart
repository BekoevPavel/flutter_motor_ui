import 'package:flutter/material.dart';
import 'package:flutter_motor_ui/home/widgets/correct_widget/correct_output_state.dart';
import 'package:get/get.dart';

import '../slider/slider.dart';

class CorrectOutPutWidget extends StatelessWidget {
  final TextEditingController textControllerFunction =
      TextEditingController(text: '');
  final FocusNode myFocusNodeFunction = FocusNode();
  CorrectOutPutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width / 3,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 0.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Injection'),
          MySlider(
            type: SlyderType.injection,
          ),
          Row(
            children: [
              Obx(() {
                return Text(
                    'Delay = f(v) = ${CorrectOutputState.y.toStringAsFixed(1)} = ');
              }),
              SizedBox(
                  width: 200,
                  child: TextField(
                    onEditingComplete: () {
                      CorrectOutputState.calculate(textControllerFunction.text);

                      myFocusNodeFunction.unfocus();
                    },
                    focusNode: myFocusNodeFunction,
                    controller: textControllerFunction,
                    decoration: const InputDecoration(
                      labelText: 'Функция от v *',
                      hintText: 'Введите функцию от v',
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
