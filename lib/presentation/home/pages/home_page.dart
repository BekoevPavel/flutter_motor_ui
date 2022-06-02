part of home;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          MeterWidget(
            sizeKef: 0.1,
            valueName: 'V',
            maxValue: 200,
          ),
          ElevatedButton(
            onPressed: () {
              Get.find<AllData>().speedometrState?.setValue(50);
            },
            child: const Text('Click me'),
          ),

          //const InputWidgets(),
          //const OutPutWidgets(),
          //const Icon(Icons.add),
          //CorrectOutPutWidget()
        ],
      ),
    );
  }
}
