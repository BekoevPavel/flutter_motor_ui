part of home;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          MeterWidget(
            sizeKef: 0.15,
            valueName: 'ω',
            unit: 'рад/сек',
            maxValue: 200,
            valueTest: 120,
            title: 'Угловая скорость',
          ),
          // DiagramWidget(
          //   xName: 'Частота',
          //   yName: 'ХЗ',
          //   sizeKef: 0.4,
          // )
          // const InputWidgets(),
          // const OutPutWidgets(),
          // const Icon(Icons.add),
          // CorrectOutPutWidget()
        ],
      ),
    );
  }
}
