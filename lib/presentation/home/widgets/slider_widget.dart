part of home;

class MySliderWidget extends StatefulWidget {
  final SlyderType type;
  late final SliderState controller;

  double? realValue = 0;
  double? value;
  MySliderWidget({
    Key? key,
    required this.type,
    this.realValue,
  }) : super(key: key) {
    controller = SliderState(type: type);
  }

  @override
  State<MySliderWidget> createState() => _MySliderWidgetState();
}

class _MySliderWidgetState extends State<MySliderWidget> {
  var sizes = Get.find<Sizes>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: sizes.gasSize * MediaQuery.of(context).size.width,
      child: Slider(
        value: widget.type == SlyderType.injection ||
                widget.type == SlyderType.spark
            ? widget.value ?? 50
            : widget.value ?? 0,
        max: 100,
        //divisions: 5,
        label: widget.value?.round().toString(),
        onChanged: (double value) {
          setState(() {
            widget.value = value;
            widget.realValue = value;

            //widget.controller.sendValue(value.toInt()); отправка на ардуино
            widget.controller.correctValue(value);
          });
        },
      ),
    );
  }
}
