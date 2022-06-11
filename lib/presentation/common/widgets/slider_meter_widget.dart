part of common;

class SliderMeterWidget extends StatelessWidget {
  final double? sizeKef;
  final Widget meter;
  final int sendID;
  const SliderMeterWidget(
      {Key? key, this.sizeKef, required this.meter, required this.sendID})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(),
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      width: MediaQuery.of(context).size.width * (sizeKef ?? 0.4),
      height: 1.3 * MediaQuery.of(context).size.width * (sizeKef ?? 0.4),
      child: Column(
        children: [
          meter,
          MySliderWidget(
            sendID: sendID,
            maxValue: 200,
            sizeKef: ((sizeKef ?? 0.4) * 0.8),
            name: '',
            backColor: Colors.blueGrey[100],
            color: const Color.fromARGB(255, 87, 83, 83),
          ),
          const Expanded(
              child: TextField(
            keyboardType: TextInputType.numberWithOptions(),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Начальное значение',
            ),
          ))
        ],
      ),
    );
  }
}
