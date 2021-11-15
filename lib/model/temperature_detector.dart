import 'package:flutter/material.dart';
import 'package:nir/model/models.dart';
import 'dart:math';

class TemperatureDetector extends StatelessWidget implements Blocks {
  TemperatureDetector({
    Key? key,
    required String name,
    this.liquid,
    this.ffr,
    required double this.requiredTemperature,
    required double koefOfTransit,
  })  : _name = name,
        _koefOfTransit = koefOfTransit,
        temperature = liquid!.temperature,
        pressure = liquid.pressure,
        _color = _setColor(liquid.temperature),
        super(key: key);

  final String _name;
  double _koefOfTransit;
  Liquid? liquid;
  FluidFlowRegulator? ffr;
  double requiredTemperature;
  double temperature;
  double pressure;
  Color _color;

  @override
  void updateState() {
    temperature = liquid!.temperature;
    calculateNewKoef();
    updateFFR(ffr!);
    _color = _setColor(temperature);
  }

  void calculateNewKoef() {
    _koefOfTransit = _koefOfTransit;
  }

  void updateFFR(FluidFlowRegulator someFfr) {
    someFfr.koefOfTransit = _koefOfTransit;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _color,
      width: 140,
      height: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_name),
          Text('${temperature.toString()} C'),
          Text('k = ${_koefOfTransit.toString()}'),
        ],
      ),
    );
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
