part of home;

class InputWidgets extends StatelessWidget {
  const InputWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Column(
              children: const [
                Text('Speed'),
                SpeedometrWidget(),
              ],
            ),
            Column(
              children: const [
                Text('temperature'),
                SpeedometrWidget(),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
