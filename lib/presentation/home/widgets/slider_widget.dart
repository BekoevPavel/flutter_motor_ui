part of home;

class MySliderWidget extends StatefulWidget {
  final SlyderType type;
  late final SliderState controller;
  final Color? color;
  final Color? backColor;
  final double? sizeKef;

  double? realValue = 0;
  double? value;
  final String? name;
  MySliderWidget(
      {Key? key,
      required this.type,
      this.realValue,
      this.name,
      this.color,
      this.backColor,
      this.sizeKef})
      : super(key: key) {
    controller = SliderState(type: type);
  }

  @override
  State<MySliderWidget> createState() => _MySliderWidgetState();
}

class _MySliderWidgetState extends State<MySliderWidget> {
  var sizes = Get.find<Sizes>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '${widget.name}',
          style: TextStyle(fontSize: 20, color: widget.color),
        ),
        SizedBox(
          width: (widget.sizeKef ?? 0.1) * MediaQuery.of(context).size.width,
          child: Slider(
            divisions: 10,
            thumbColor: widget.color,
            inactiveColor: widget.backColor,
            activeColor: widget.color,
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
        ),
      ],
    );
  }
}
