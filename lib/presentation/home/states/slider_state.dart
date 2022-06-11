part of home;

class SliderState extends GetxController {
  late SendUseCase useCase;
  SliderState(this.sendID) {
    useCase = SendUseCase(sendID);
  }
  final int sendID;
  void sendValue(int value) {
    // if (type == SlyderType.injection) {
    //   Get.find<ConnectToArduino>().sendToClient([1, value.toInt(), 0]);
    // } else if (type == SlyderType.spark) {
    //   Get.find<ConnectToArduino>().sendToClient([2, value.toInt(), 0]);
    // }
  }

  void setValue(double newValue) {
    // TODO при отправки задержки зажигания
    CorrectOutputState.correct(newValue);
    useCase.send(sendID, newValue.toInt());
  }
}
