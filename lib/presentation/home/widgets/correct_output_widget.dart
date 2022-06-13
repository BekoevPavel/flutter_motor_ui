part of home;

//SPARK
class CorrectOutPutWidget extends StatelessWidget {
  final TextEditingController textControllerFunction =
      TextEditingController(text: '');
  final TextEditingController textControllerDelay =
      TextEditingController(text: '');
  final FocusNode myFocusNodeFunction = FocusNode();
  final FocusNode myFocusNodeDelay = FocusNode();
  CorrectOutputState controller = CorrectOutputState();
  CorrectOutPutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 0.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Задежка зажигания'),
          Row(
            children: [
              const Text(
                'Ручной режим ',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              MySliderWidget(
                sendID: 13, // SPARK
                name: '',
                sizeKef: 0.2,
                maxValue: 20,
              ),
            ],
          ),
          Row(
            children: [
              Obx(() {
                if (textControllerFunction.text != '') {
                  controller.calculateY(
                    textControllerFunction.text,
                  );
                }
                return RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: [
                      const TextSpan(
                          text: 'Авто-режим ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                      TextSpan(
                          text:
                              'Delay = f(v) = ${controller.y.toStringAsFixed(1)} = '),
                    ],
                  ),
                );
              }),
              SizedBox(
                width: 200,
                child: TextField(
                  onEditingComplete: () {
                    controller.calculateY(
                      textControllerFunction.text,
                    );

                    myFocusNodeFunction.unfocus();
                  },
                  focusNode: myFocusNodeFunction,
                  controller: textControllerFunction,
                  decoration: const InputDecoration(
                    labelText: 'Функция от v *',
                    hintText: 'Введите функцию от v',
                  ),
                ),
              ),
              Obx(
                () {
                  return Text('v = ω = ${controller.x.toStringAsFixed(3)}');
                },
              ),
            ],
          ),
          Row(
            children: [
              const Text('Длительность зажигания: '),
              SizedBox(
                width: 200,
                child: TextField(
                  onEditingComplete: () {
                    Get.find<ConnectToArduino>().sendToClient(
                        [17, int.parse(textControllerDelay.text)]);
                    myFocusNodeDelay.unfocus();
                  },
                  focusNode: myFocusNodeDelay,
                  controller: textControllerDelay,
                  decoration: const InputDecoration(
                    labelText: 'Функция от v *',
                    hintText: 'Введите функцию от v',
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
