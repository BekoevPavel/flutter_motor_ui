part of home;

class OutPutWidgets extends StatelessWidget {
  const OutPutWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final _currentSliderValue = 0.0;
    return Row(
      children: [
        Column(
          children: [
            const Text('Gas'),
            MySliderWidget(
              type: SlyderType.gas,
            ),
          ],
        ),
        Column(
          children: [
            const Text('Ignition'),
            MySliderWidget(
              type: SlyderType.ignition,
            ),
          ],
        ),
        Column(
          children: [
            const Text('Spark'),
            MySliderWidget(
              type: SlyderType.spark,
            ),
          ],
        ),
        ElevatedButton(
          child: const Text('click me'),
          onPressed: () {
            Get.find<ConnectToArduino>().sendToClient([3, 0]);
            //Get.to(const SettingsPage());
          },
        ),
      ],
    );
  }
}
