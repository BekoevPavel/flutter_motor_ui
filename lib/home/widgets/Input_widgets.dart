import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../settings/settings_page.dart';
import 'speedometer.dart';

class InputWidgets extends StatelessWidget {
  const InputWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: const [
                  Text('Speed'),
                  Speedometr(),
                ],
              ),
              Column(
                children: const [
                  Text('temperature'),
                  Speedometr(),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
