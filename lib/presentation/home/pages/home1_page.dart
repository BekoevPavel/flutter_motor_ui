part of home;
// КОСТЫЛИ СТРАШНЫЕ !!!!!

class Home1Page extends StatelessWidget {
  const Home1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _leftBar(),
        _rightBar(context),
      ],
    );
  }
}

Widget _leftBar() {
  RxDouble MOSHNOST = 0.0.obs;
  return Expanded(
    child: Container(
      color: const Color.fromARGB(197, 244, 233, 233),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MeterWidget(
                sendID: 228,
                sizeKef: 0.13,
                valueName: 'ω',
                unit: 'рад/сек',
                maxValue: 400,
                title: 'Угловая скорость',
                backColor: Colors.blueGrey[100],
                color: const Color.fromARGB(255, 87, 83, 83),
              ),
              MeterWidget(
                sendID: -10,
                sizeKef: 0.13,
                valueName: 't',
                unit: '°С',
                maxValue: 120,
                valueTest: 75,
                title: 'Температура',
                backColor: Colors.blueGrey[100],
                color: const Color.fromARGB(255, 87, 83, 83),
              ),
              Obx(() {
                RxDouble speed = 0.0.obs;
                RxDouble U = 0.0.obs;
                final lstSpeed = Get.find<ConnectToArduino>()
                    .metersRepos
                    .where((element) => element.sendID == 228)
                    .toList();
                final lstU = Get.find<ConnectToArduino>()
                    .metersRepos
                    .where((element) => element.sendID == 229)
                    .toList();
                if (lstSpeed.isNotEmpty) {
                  speed = lstSpeed.first.value;
                }
                if (lstU.isNotEmpty) {
                  U = lstU.first.value;
                }

                MOSHNOST.value = speed.value * U.value;

                return MeterWidget(
                  sendID: -10,
                  sizeKef: 0.13,
                  valueName: 'N',
                  unit: 'кВт',
                  maxValue: 120,
                  valueTest: MOSHNOST.value,
                  title: 'Мощность',
                  backColor: Colors.blueGrey[100],
                  color: const Color.fromARGB(255, 87, 83, 83),
                );
              }),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SliderMeterWidget(
                sendID: 15, // отправляю
                sizeKef: 0.16,
                maxValue: 50,

                meter: MeterWidget(
                  sendID: -10,
                  sizeKef: (0.14),
                  valueName: 'fuel',
                  unit: 'гр',
                  maxValue: 50,
                  title: 'Количество топлива',
                ),
              ),
              SliderMeterWidget(
                sizeKef: 0.16,
                sendID: 11,
                maxValue: 255,
                meter: MeterWidget(
                  sendID: 229,
                  sizeKef: (0.14),
                  unit: 'Hm',
                  valueName: 'Мт',
                  maxValue: 255,
                  title: 'Тормозной момент',
                ),
              ),
              DiagramWidget(
                xName: 'ω',
                yName: 'M',
                sizeKef: 0.25,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CorrectOutPutWidget(),
            ],
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RawMaterialButton(
                    onPressed: () {},
                    elevation: 2.0,
                    fillColor: Colors.red,
                    child: const Icon(
                      Icons.power_settings_new,
                      size: 60.0,
                    ),
                    padding: const EdgeInsets.all(15.0),
                    shape: const CircleBorder(),
                  ),
                  SizedBox(
                    height: 100,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 113, 172, 115),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              side: const BorderSide(color: Colors.green)),
                        ),
                      ),
                      onPressed: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          /* .... */
                          Text(
                            "Определение характеристик",
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            "в автоматическом режиме",
                            style: TextStyle(fontSize: 20),
                          ),

                          /* .... */
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget _rightBar(BuildContext context) {
  return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      color: const Color.fromARGB(255, 178, 166, 166),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Электродвигатель'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Пуск'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.find<ConnectToArduino>().sendToClient([16, 16]);
                },
                child: const Text('Стоп'),
              ),
            ],
          ),
          SliderMeterWidget(
            sizeKef: 0.16,
            sendID: -10,
            meter: MeterWidget(
              sendID: -10,
              sizeKef: (0.14),
              valueName: 'U',
              unit: 'Вольт',
              maxValue: 110,
              valueTest: 0,
              title: 'Напряжение на входе',
            ),
          ),
          const Divider(
            thickness: 2,
          ),
          MeterWidget(
            sendID: -10,
            sizeKef: 0.13,
            valueName: 'U',
            unit: 'Вольт',
            maxValue: 110,
            valueTest: 50,
            title: 'Генератор',
            color: const Color.fromARGB(255, 94, 104, 210),
          ),
          const Text('Питание от '),
          const Divider(),
          const RadioButton()
        ],
      ));
}
