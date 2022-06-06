import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import 'presentation/home/home.dart';
import 'service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initDI();
  //debugRepaintRainbowEnabled = true;

  runApp(const MyApp());
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
