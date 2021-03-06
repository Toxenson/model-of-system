import 'package:flutter/material.dart';

import '../model/model_base_classes.dart';

class Throttle extends StatelessWidget implements Blocks, CanUpdatePipes {
  Throttle({
    Key? key,
    required double acceptablePressure,
    required String name,
    this.liquid,
  })  : _acceptablePressure = acceptablePressure,
        _name = name,
        pressure = findPressForTH(liquid!.pressure, acceptablePressure),
        temperature = findTempForTH(
            liquid.temperature, liquid.pressure, acceptablePressure),
        mass = liquid.mass,
        _color = _setColor(liquid.temperature),
        super(key: key);

  final double _acceptablePressure;
  final String _name;
  Liquid? liquid;
  double pressure;
  double temperature;
  double mass;
  Color _color;

  @override
  void updateState() {
    pressure = findPressForTH(liquid!.pressure, _acceptablePressure);
    temperature = findTempForTH(
        liquid!.temperature, liquid!.pressure, _acceptablePressure);
    mass = liquid!.mass;
    _color = _setColor(liquid!.temperature);
  }

  @override
  void pipesUpdate(List<Pipes> pipes) {
    var pipe = pipes[0];
    pipe.liquid = liquid;
    pipe.updateState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _color,
      width: 60,
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
