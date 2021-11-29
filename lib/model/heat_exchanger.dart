import 'package:flutter/material.dart';
import '../model/model_base_classes.dart';
import 'package:timer_builder/timer_builder.dart';

class HeatExchanger extends StatelessWidget implements Blocks, CanUpdatePipes {
  HeatExchanger({
    Key? key,
    required String name,
    required double alf,
    required double beta,
    required this.pressure,
    required this.temperature,
    required this.mass,
    this.outsideTemperature = 80,
  })  : _alf = alf,
        _beta = beta,
        _name = name,
        _color = setColorOfTemperature(temperature),
        super(key: key);

  final String _name;
  final double _alf;
  final double _beta;
  double mass;
  double temperature;
  double pressure;
  double koef = 0.0;
  double outsideTemperature;
  Color _color;

  @override
  void updateState() {
    // mass = liquid!.mass;
    // pressure = findPressForHE(liquid!.pressure, _beta, outsideTemperature,
    //     Blocks.dt, liquid!.mass, liquid!.temperature, _alf);
    // temperature = findTempForHE(_beta, outsideTemperature, Blocks.dt,
    //     liquid!.mass, liquid!.temperature);
    _color = setColorOfTemperature(temperature);
  }

  @override
  void pipesUpdate(List<Pipes> pipes) {
    var pipe = pipes[0];
    pipe.pressure = findPressForHE(pressure, _beta, outsideTemperature,
        Blocks.dt, mass, temperature, _alf);
    pipe.temperature =
        findTempForHE(_beta, outsideTemperature, Blocks.dt, mass, temperature);
    pipe.mass = mass;
  }

  @override
  Widget build(BuildContext context) {
    return TimerBuilder.periodic(
      Duration(milliseconds: Blocks.dtForUpdateWidgets),
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
              color: _color,
              borderRadius: const BorderRadius.all(Radius.circular(8.0))),
          width: 100,
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

//   @override
//   void pipesUpdate(List<Pipes> pipes) {
//     var pipe = pipes[0];
//     pipe.pressure = _findPressForHE(pressure, _beta, outsideTemperature,
//         Blocks.dt, mass, temperature, _findTempForHE, _alf);
//     pipe.temperature = _findTempForHE()(
//         _beta, outsideTemperature, Blocks.dt, mass, temperature);
//     pipe.mass = mass;
//   }
}
