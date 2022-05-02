import 'package:flutter/material.dart';
import 'package:flutter_motor_ui/home/spedomentr_controller.dart';
import 'package:flutter_motor_ui/home/widgets/Input_widgets.dart';
import 'package:flutter_motor_ui/home/widgets/output_widgets.dart';
import 'package:flutter_motor_ui/home/widgets/speedometer.dart';
import 'package:flutter_motor_ui/settings/settings_page.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: const [InputWidgets(), OutPutWidgets(), Icon(Icons.add)],
    ));
  }
}
