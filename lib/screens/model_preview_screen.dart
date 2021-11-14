import 'package:flutter/material.dart';
import 'package:nir/model/models.dart';
import 'package:nir/model/temperature_detector.dart';

class ModelPreviewScreen extends StatelessWidget {
  final someLiquid = Liquid(
    mass: 20,
    temperature: 53,
    pressure: 2000,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Throttle(
          acceptablePressure: 1324,
          name: 'Throttle',
          someLiquid: someLiquid,
        ),
        HeatExchanger(
          name: 'Heat Exchanger',
          alf: 5,
          beta: 5,
          someLiquid: someLiquid,
        ),
        TemperatureDetector(
          name: 'Temperature Detector',
          someLiquid: someLiquid,
          someFfr: FluidFlowRegulator(name: 'FFR'),
          requiredTemperature: 40,
          koefOfTransit: 0.2,
        ),
        FluidFlowRegulator(name: 'FFR'),
        // Container(
        //   height: 40,
        //   width: 40,
        //   color: color,
        // ),
        // Slider(
        //   value: sliderValue1,
        //   onChanged: (double value) {
        //     setState(() {
        //       sliderValue1 = value;
        //       color = Color.fromRGBO(
        //         value.toInt(),
        //         sliderValue2.toInt(),
        //         sliderValue3.toInt(),
        //         1,
        //       );
        //     });
        //   },
        //   min: 0,
        //   max: 255,
        //   divisions: 2550,
        // ),
        // Slider(
        //   value: sliderValue2,
        //   onChanged: (double value) {
        //     setState(() {
        //       sliderValue2 = value;
        //       color = Color.fromRGBO(
        //         sliderValue1.toInt(),
        //         value.toInt(),
        //         sliderValue3.toInt(),
        //         1,
        //       );
        //     });
        //   },
        //   min: 0,
        //   max: 255,
        //   divisions: 2550,
        // ),
        // Slider(
        //   value: sliderValue3,
        //   onChanged: (double value) {
        //     setState(() {
        //       sliderValue3 = value;
        //       color = Color.fromRGBO(
        //         sliderValue1.toInt(),
        //         sliderValue2.toInt(),
        //         value.toInt(),
        //         1,
        //       );
        //     });
        //   },
        //   min: 0,
        //   max: 255,
        //   divisions: 2550,
        // ),
      ],
    );
  }
}
