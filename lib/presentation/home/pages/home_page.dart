part of home;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(
      children: const [
        MeterWidget(
          sizeKef: 0.2,
        )
        //const InputWidgets(),
        //const OutPutWidgets(),
        //const Icon(Icons.add),
        //CorrectOutPutWidget()
      ],
    ));
  }
}
