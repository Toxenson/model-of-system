import 'package:flutter/material.dart';
import '../model/model_base_classes.dart';

class HeatExchanger extends StatelessWidget implements Blocks, CanUpdatePipes {
  HeatExchanger(
      {Key? key,
      required String name,
      required double alf,
      required double beta,
      required this.pressure,
      required this.temperature,
      required this.mass,
      double outsideTemperature = 80})
      : _alf = alf,
        _beta = beta,
        _name = name,
        _color = _setColor(temperature),
        super(key: key);

  final String _name;
  final double _alf;
  final double _beta;
  double outsideTemperature = 80;
  double mass;
  double temperature;
  double pressure;
  Color _color;

  @override
  void updateState() {
    // mass = liquid!.mass;
    // pressure = findPressForHE(liquid!.pressure, _beta, outsideTemperature,
    //     Blocks.dt, liquid!.mass, liquid!.temperature, _alf);
    // temperature = findTempForHE(_beta, outsideTemperature, Blocks.dt,
    //     liquid!.mass, liquid!.temperature);
    // _color = _setColor(liquid!.temperature);
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
    return Container(
      color: _color,
      width: 100,
      height: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text(_name), Text('${temperature.toString()} C')],
      ),
    );
  }

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
