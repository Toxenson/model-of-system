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
    required double this.requiredTemperature,
    required double koefOfTransit,
  })  : _name = name,
        _koefOfTransit = koefOfTransit,
        koef = koefOfTransit,
        _color = _setColor(temperature),
        super(key: key);

  final String _name;
  double _koefOfTransit;
  FluidFlowRegulator? ffr;
  double requiredTemperature;
  double temperature;
  double pressure;
  double mass;
  double koef;
  Color _color;

  String get name => _name;

  @override
  void updateState() {
    calculateNewKoef();
    updateFFR(ffr!);
    _color = _setColor(temperature);
  }

  void calculateNewKoef() {
    if (temperature > requiredTemperature) {
      _koefOfTransit = 1 / (1 + exp(-(temperature / requiredTemperature)));
    } else {
      _koefOfTransit = 0;
    }
    koef = _koefOfTransit;
  }

  void updateFFR(FluidFlowRegulator someFfr) {
    someFfr.koefOfTransit = _koefOfTransit;
  }

  @override
  Widget build(BuildContext context) {
    return TimerBuilder.periodic(
        Duration(milliseconds: Blocks.dtForUpdateWidgets), builder: (context) {
      return Container(
        color: _color,
        width: 60,
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
    // return Container(
    //   color: _color,
    //   width: 140,
    //   height: 60,
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       Text(_name),
    //       Text('${temperature.toString()} C'),
    //       Text('k = ${_koefOfTransit.toString()}'),
    //     ],
    //   ),
    // );
  }
}

// class TemperatureDetectorWidget extends StatefulWidget {
//   TemperatureDetectorWidget({
//     Key? key,
//     required this.name,
//     required this.color,
//     required this.temperature,
//     required this.koefOfTransit,
//   }) : super(key: key);

//   String name;
//   Color color;
//   double temperature;
//   double koefOfTransit;

//   @override
//   State<TemperatureDetectorWidget> createState() =>
//       _TemperatureDetectorWidgetState();
// }

// class _TemperatureDetectorWidgetState extends State<TemperatureDetectorWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return TimerBuilder.periodic(Duration(milliseconds: 20),
//         builder: (context) {
//       return Container(
//         color: widget.color,
//         width: 140,
//         height: 60,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(widget.name),
//             Text('${widget.temperature.toString()} C'),
//             Text('k = ${widget.koefOfTransit.toString()}'),
//           ],
//         ),
//       );
//     });
//   }
// }

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
