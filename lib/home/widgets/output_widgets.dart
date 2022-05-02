import 'package:flutter/material.dart';
import 'package:flutter_motor_ui/home/widgets/slider.dart';
import 'package:flutter_motor_ui/usecases/arduino_connect.dart';
import 'package:get/get.dart';

import '../../settings/settings_page.dart';

class OutPutWidgets extends StatelessWidget {
  const OutPutWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _currentSliderValue = 0.0;
    return Container(
      child: Row(
        children: [
          Column(
            children: [
              const Text('Gas'),
              MySlider(
                type: SlyderType.gas,
              ),
            ],
          ),
          Column(
            children: [
              const Text('Ignition'),
              MySlider(
                type: SlyderType.ignition,
              ),
            ],
          ),
          ElevatedButton(
            child: const Text('click me'),
            onPressed: () {
              Get.find<ConnectToArduino>().sendToClient([3, 0]);
              //Get.to(const SettingsPage());
            },
          ),
        ],
      ),
    );
  }
}