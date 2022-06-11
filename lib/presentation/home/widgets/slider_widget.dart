part of home;

class MySliderWidget extends StatefulWidget {
  // final SlyderType type;
  late final SliderState controller;
  final Color? color;
  final Color? backColor;
  final double? sizeKef;
  final int sendID;
  final MeterWidget? meter;

  double? value;
  final double? maxValue;
  final String? name;
  MySliderWidget(
      {Key? key,
      required this.sendID,
      this.name,
      this.color,
      this.backColor,
      this.sizeKef,
      this.value = 0,
      this.maxValue = 100,
      this.meter})
      : super(key: key) {
    controller = SliderState(sendID);
  }

  @override
  State<MySliderWidget> createState() => _MySliderWidgetState();
}

class _MySliderWidgetState extends State<MySliderWidget> {
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
            divisions: 25,
            thumbColor: widget.color,
            inactiveColor: widget.backColor,
            activeColor: widget.color,
            value: widget.value!,
            max: widget.maxValue!,

            //divisions: 5,
            label: widget.value?.round().toString(),
            onChanged: (double value) {
              setState(() {
                widget.value = value.toInt().toDouble();

                //widget.controller.sendValue(value.toInt()); отправка на ардуино
                widget.controller.setValue(value);
                if (widget.meter != null) {
                  widget.controller.menageMeter(widget.meter!, value.toInt());
                }
              });
            },
          ),
        ),
        Text(
          'U1: ${widget.value}',
          style: const TextStyle(
            fontSize: 10,
          ),
        )
      ],
    );
  }
}
