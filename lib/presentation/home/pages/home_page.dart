part of home;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(
      children: [
        MyDiagram(
          xName: 'Частота',
          yName: 'ХЗ',
          size: 400,
        ),
        //const InputWidgets(),
        // const OutPutWidgets(),
        // const Icon(Icons.add),
        // CorrectOutPutWidget()
      ],
    ));
  }
}
