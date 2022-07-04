part of core;

class ConnectToArduino {
  List<MeterRepository> metersRepos = [
    MeterRepositoryImpl(228),
    MeterRepositoryImpl(229)
  ];

  DiagramRepository diagramRepos = DiagramRepositoryImpl();
  late ServerSocket server;
  Socket? socket;
  sendToClient(List<int> data) {
    socket?.add(data);
  }

  ConnectToArduino() {
    int count = 0;
    // Timer.periodic(const Duration(seconds: 1), (timer) {
    //   diagramRepos.addDiagramLine(count, Random().nextInt(100));
    //   count++;
    // });

    _call();
  }
  _call() async {
    print('Connect');
    //InternetAddress adress = InternetAddress('127.0.0.1');
    server = await ServerSocket.bind('192.168.0.2', 2400);
    Timer.periodic(const Duration(seconds: 1), (timer) {
      sendToClient([]);
    });

    // listen for clent connections to the server

    server.listen((client) async {
      socket = client;
      _handleConnection(socket!);
    });
  }

  void disconnect() {
    server.close();
    socket?.close();
  }

  Future<void> _handleConnection(Socket client) async {
    print('Connection from'
        ' ${client.remoteAddress.address}:${client.remotePort}');

    //client.write(11);
    client.writeCharCode(125);

    // listen for events from the client
    client.listen(
      // handle data from the client
      (Uint8List data) async {
        final message = data.toList();
        print('message:  ${message}');
        var speedController = Get.find<SpeedometrController>();
        speedController.setSpeed(message.first.toDouble() / 5);
        for (final meter in metersRepos) {
          meter.updateMeter(data);
        }

        for (int i = 0; i < message.length; i++) {
          if (message[i] == 228) {
            speedController.setDeltaTimeSensors(
                MathController.byteToInt([message[i + 1], message[i + 2]]) *
                    0.001);
          }
        }
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
