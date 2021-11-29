import 'package:flutter/material.dart';
import '../model/model_base_classes.dart';
import 'package:timer_builder/timer_builder.dart';

class Pump extends StatelessWidget implements Blocks, CanUpdatePipes {
  Pump({
    Key? key,
    required String name,
    required this.pressure,
    required this.temperature,
    required this.mass,
    required this.deltaPressure,
  })  : _name = name,
        _color = setColorOfTemperature(temperature),
        super(key: key);

  final String _name;
  double koef = 0;
  double deltaPressure;
  double mass;
  double outsideTemperature = 80;
  double pressure;
  double temperature;
  Color _color;

  @override
  Widget build(BuildContext context) {
    return TimerBuilder.periodic(
      Duration(milliseconds: Blocks.dtForUpdateWidgets),
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
              color: _color,
              borderRadius: const BorderRadius.all(Radius.circular(8.0))),
          width: 60,
          height: 60,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_name),
              Text('${temperature.toStringAsFixed(3)} C')
            ],
          ),
        );
      },
    );
  }

  @override
  String get name => _name;

  @override
  void pipesUpdate(List<Pipes> pipes) {
    var pipe = pipes[0];
    pipe.pressure = pressure + deltaPressure;
    pipe.temperature = temperature;
    pipe.mass = mass;
  }

  @override
  void updateState() {
    _color = setColorOfTemperature(temperature);
  }
}
