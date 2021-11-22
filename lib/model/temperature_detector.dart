import 'package:flutter/material.dart';
import 'package:nir/model/models.dart';
import 'dart:math';

import 'package:timer_builder/timer_builder.dart';

class TemperatureDetector extends StatelessWidget implements Blocks {
  TemperatureDetector({
    Key? key,
    required String name,
    required this.pressure,
    required this.temperature,
    required this.mass,
    this.ffr,
    required this.requiredTemperatureMin,
    required this.requiredTemperatureMax,
    required double koefOfTransit,
  })  : _name = name,
        _koefOfTransit = koefOfTransit,
        koef = koefOfTransit,
        _color = _setColor(temperature),
        super(key: key);

  final String _name;
  double _koefOfTransit;
  double _storedKoefOfTransit = 0;
  FluidFlowRegulator? ffr;
  double requiredTemperatureMin;
  double requiredTemperatureMax;
  double storedTemperature = 0;
  int counter = 0;
  int counterMax = 9;
  double temperature;
  double pressure;
  double mass;
  double koef;
  double outsideTemperature = 0.0;
  Color _color;

  String get name => _name;

  @override
  void updateState() {
    calculateNewKoef();
    updateFFR(ffr!);
    _color = _setColor(temperature);
  }

  void calculateNewKoef() {
    int delta = (temperature - storedTemperature).toInt().sign;
    delta = (delta == 0) ? 1 : delta;
    _koefOfTransit = _storedKoefOfTransit;
    double speed = 0.99 / counterMax;
    print('delta $delta');
    print('temperature $temperature');
    print('storedTemperature $storedTemperature');
    if ((temperature > requiredTemperatureMax) && (delta == 1)) {
      _koefOfTransit = speed * counter;
      counter += 1;
      if (counter > counterMax) {
        counter = counterMax;
      }
      storedTemperature = temperature;
      return;
    }
    if ((temperature > requiredTemperatureMin) && (delta == -1)) {
      _koefOfTransit = speed * counter;
      counter += 1;
      if (counter > counterMax) {
        counter = counterMax;
      }
      storedTemperature = temperature;
      return;
    }
    if ((temperature < requiredTemperatureMin) && (delta == -1)) {
      _koefOfTransit = speed * counter;
      counter -= 1;
      if (counter < 0) {
        counter = 0;
      }
      storedTemperature = temperature;
      return;
    }
    if ((temperature < requiredTemperatureMax) && (delta == 1)) {
      _koefOfTransit = speed * counter;
      counter -= 1;
      if (counter < 0) {
        counter = 0;
      }
      storedTemperature = temperature;
      return;
    }
  }

  void updateFFR(FluidFlowRegulator someFfr) {
    someFfr.koefOfTransit = _koefOfTransit;
  }

  @override
  Widget build(BuildContext context) {
    return TimerBuilder.periodic(
        Duration(milliseconds: Blocks.dtForUpdateWidgets), builder: (context) {
      return Container(
        decoration: BoxDecoration(
            color: _color,
            borderRadius: const BorderRadius.all(Radius.circular(8.0))),
        width: 80,
        height: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_name),
            Text('${temperature.toStringAsFixed(3)} C'),
            Text('k = ${_koefOfTransit.toStringAsFixed(3)}'),
          ],
        ),
      );
    });
  }
}

Color _setColor(double temp) {
  if (temp <= 40.0) {
    return const Color.fromRGBO(0, 255, 0, 1);
  }
  if ((temp > 40.0) && (temp < 80.0)) {
    return const Color.fromRGBO(255, 255, 0, 1);
  } else {
    return const Color.fromRGBO(255, 0, 0, 1);
  }
}
