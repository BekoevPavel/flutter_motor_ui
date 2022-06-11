part of repositories;

class SendRepositoryImpl implements SendRepository {
  @override
  void send(int sendID, int value) {
    // TODO
    ConnectToArduino connection = Get.find();

    //connection.sendToClient(data)
  }
}
