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
        children: [
          const Text('Injection'),
          MySliderWidget(
            type: SlyderType.injection,
          ),
          Row(
            children: [
              Obx(() {
                if (textControllerFunction.text != '') {
                  CorrectOutputState.calculate(textControllerFunction.text,
                      CorrectOutputState.deltaTime.toDouble());
                }
                return Text(
                    'Delay = f(v) = ${CorrectOutputState.y.toStringAsFixed(1)} = ');
              }),
              SizedBox(
                width: 300,
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
                      'v = ${CorrectOutputState.deltaTime.toStringAsFixed(3)}');
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
