part of home;

enum SingingCharacter { electro, generator, auto }

class RadioButton extends StatefulWidget {
  final double? sizeKef;
  const RadioButton({Key? key, this.sizeKef}) : super(key: key);

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  SingingCharacter? _character = SingingCharacter.electro;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            'Электродвигатель',
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width *
                    (widget.sizeKef ?? 0.1) *
                    0.07),
          ),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.electro,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: Text(
            'Генератор',
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width *
                    (widget.sizeKef ?? 0.1) *
                    0.07),
          ),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.generator,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: Text(
            'Автоматически',
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width *
                    (widget.sizeKef ?? 0.1) *
                    0.07),
          ),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.auto,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
