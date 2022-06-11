part of repositories;

class SendRepositoryImpl implements SendRepository {
  @override
  void send(int sendID, List<int> data) {
    // TODO
    ConnectToArduino connection = Get.find();

    connection.sendToClient([sendID, ...data]);
  }
}
