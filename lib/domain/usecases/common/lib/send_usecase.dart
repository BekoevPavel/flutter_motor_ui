part of common;

class SendUseCase {
  final int sendID;
  SendUseCase(this.sendID);
  void send(int sendID, int value) {
    SendRepository sendRepository = SendRepositoryImpl();
    final sendlst = MathController.intToBytes(value);
    sendRepository.send(sendID, sendlst);
  }
}
