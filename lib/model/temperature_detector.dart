import 'package:flutter/material.dart';
import 'package:nir/model/models.dart';

class TemperatureDetector extends StatelessWidget implements Blocks {
  TemperatureDetector({
    Key? key,
    required String name,
    required this.someLiquid,
    required koefOfTransit,
  })  : _name = name,
        _koefOfTransit = koefOfTransit,
        temperature = someLiquid!.temperature,
        pressure = someLiquid.pressure,
        _color = _setColor(someLiquid.temperature),
        super(key: key);

  final String _name;
  double _koefOfTransit;
  Liquid? someLiquid;
  double temperature;
  double pressure;
  Color _color;

  void updateState() {
    temperature = someLiquid!.temperature;
    calculateNewKoef();
    _color = _setColor(temperature);
  }

  void calculateNewKoef() {
    _koefOfTransit = _koefOfTransit;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _color,
      width: 140,
      height: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text(_name), Text('${temperature.toString()} C')],
      ),
    );
  }
}

Color _setColor(double temp) {
  if (temp <= 40) {
    return const Color.fromRGBO(0, 255, 0, 1);
  }
  if ((temp > 40) && (temp < 80)) {
    return const Color.fromRGBO(255, 255, 0, 1);
  } else {
    return const Color.fromRGBO(255, 0, 0, 1);
  }
}
