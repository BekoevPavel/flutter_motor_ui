part of home;

class CorrectOutPutWidget extends StatelessWidget {
  final TextEditingController textControllerFunction =
      TextEditingController(text: '');
  final FocusNode myFocusNodeFunction = FocusNode();
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
                name: '',
                type: SlyderType.injection,
                sizeKef: 0.28,
              ),
            ],
          ),
          Row(
            children: [
              Obx(() {
                if (textControllerFunction.text != '') {
                  CorrectOutputState.calculate(textControllerFunction.text,
                      CorrectOutputState.deltaTime.toDouble());
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
                              'Delay = f(v) = ${CorrectOutputState.y.toStringAsFixed(1)} = '),
                    ],
                  ),
                );
              }),
              SizedBox(
                width: 230,
                child: TextField(
                  onEditingComplete: () {
                    CorrectOutputState.calculate(textControllerFunction.text,
                        CorrectOutputState.deltaTime.toDouble());

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
                  return Text(
                      'v = ω = ${CorrectOutputState.deltaTime.toStringAsFixed(3)}');
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
