import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';

import '../model/model_base_classes.dart';

class Throttle extends StatelessWidget implements Blocks, CanUpdatePipes {
  Throttle({
    Key? key,
    required double acceptablePressure,
    required String name,
    required double pressure,
    required double temperature,
    required this.mass,
  })  : _acceptablePressure = acceptablePressure,
        _name = name,
        pressure = findPressForTH(pressure, acceptablePressure),
        temperature = findTempForTH(temperature, pressure, acceptablePressure),
        _color = setColorOfTemperature(temperature),
        super(key: key);

  final double _acceptablePressure;
  final String _name;
  double pressure;
  double temperature;
  double mass;
  double koef = 0.0;
  double outsideTemperature = 0.0;
  Color _color;

  @override
  void updateState() {
    pressure = findPressForTH(pressure, _acceptablePressure);
    temperature = findTempForTH(temperature, pressure, _acceptablePressure);
    mass = mass;
    _color = setColorOfTemperature(temperature);
  }

  @override
  void pipesUpdate(List<Pipes> pipes) {
    var pipe = pipes[0];
    pipe.pressure = findPressForTH(pressure, _acceptablePressure);
    pipe.temperature =
        findTempForTH(temperature, pressure, _acceptablePressure);
    pipe.mass = mass;
  }

  @override
  Widget build(BuildContext context) {
    return TimerBuilder.periodic(
        Duration(milliseconds: Blocks.dtForUpdateWidgets), builder: (context) {
      return Container(
        decoration: BoxDecoration(
            color: _color,
            borderRadius: const BorderRadius.all(Radius.circular(8.0))),
        width: 60,
        height: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(_name), Text('${temperature.toStringAsFixed(3)} C')],
        ),
      );
    });
  }

  @override
  String get name => _name;
}
