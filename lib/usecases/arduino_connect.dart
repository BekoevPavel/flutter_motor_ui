import 'dart:io';

import 'dart:typed_data';

import 'package:flutter_motor_ui/home/spedomentr_controller.dart';
import 'package:get/get.dart';

class ConnectToArduino {
  ServerSocket? server;
  Socket? socket;
  sendToClient(List<int> data) {
    socket?.add(data);
  }

  ConnectToArduino() {
    _call();
  }
  _call() async {
    print('Connect');
    InternetAddress adress = InternetAddress('127.0.0.1');
    server = await ServerSocket.bind('192.168.4.2', 2400);

    // listen for clent connections to the server

    server!.listen((client) async {
      socket = client;
      _handleConnection(socket!);
    });
  }

  void disconnect() {
    server?.close();
    socket?.close();
  }

  void _handleConnection(Socket client) {
    print('Connection from'
        ' ${client.remoteAddress.address}:${client.remotePort}');

    //client.write(11);
    client.writeCharCode(125);

    // listen for events from the client
    client.listen(
      // handle data from the client
      (Uint8List data) async {
        final message = data;
        print('message:  ${message}');
        var speedController = Get.find<SpeedometrController>();
        speedController.setSpeed(message.toList().first.toDouble() / 5);
      },

      // handle errors
      onError: (error) {
        print(error);
        client.close();
      },

      // handle the client closing the connection
      onDone: () {
        print('Client left');
        client.close();
      },
    );
  }
}