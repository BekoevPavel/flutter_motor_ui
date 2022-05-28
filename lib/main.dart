import 'package:flutter/material.dart';
import 'package:flutter_motor_ui/usecases/math_controller.dart';
import 'package:get/get.dart';
import 'home/home.dart';
import 'service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initDI();

  runApp(const MyApp());

  var res1 = MathController.intToBytes(529);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        body: HomePage(),
      ),
    );
  }
}
