import 'package:flutter/material.dart';
import 'package:nir/painting/arrows.dart';
import '../model/models.dart';

class Model {
  bool isPlayed = true;
  final ffr = FluidFlowRegulator(
    name: 'FFR',
  );
  final he1 = HeatExchanger(
    name: 'HE1',
    alf: 5,
    beta: 5,
    mass: 20,
    temperature: 20,
    pressure: 2000,
  );
  final he2 = HeatExchanger(
    name: 'HE2',
    alf: 5,
    beta: 5,
    mass: 20,
    temperature: 20,
    pressure: 2000,
  );
  final he3 = HeatExchanger(
    name: 'HE3',
    alf: 5,
    beta: 5,
    mass: 20,
    temperature: 20,
    pressure: 2000,
    outsideTemperature: 0,
  );
  final td = TemperatureDetector(
    name: 'TD',
    requiredTemperature: 40,
    koefOfTransit: 0,
    mass: 20,
    temperature: 20,
    pressure: 2000,
  );
  final th1 = Throttle(
    name: 'TH1',
    acceptablePressure: 2000,
    mass: 20,
    temperature: 20,
    pressure: 2000,
  );
  final th2 = Throttle(
    name: 'TH2',
    acceptablePressure: 2000,
    mass: 20,
    temperature: 20,
    pressure: 2000,
  );

  final List<Pipe> pipes = [
    Pipe(
      name: 'Pipe1',
      mass: 20,
      temperature: 20,
      pressure: 2000,
    ),
    Pipe(
      name: 'Pipe2',
      mass: 20,
      temperature: 20,
      pressure: 2000,
    ),
    Pipe(
      name: 'Pipe3',
      mass: 20,
      temperature: 20,
      pressure: 2000,
    ),
    Pipe(
      name: 'Pipe4',
      mass: 20,
      temperature: 20,
      pressure: 2000,
    ),
    Pipe(
      name: 'Pipe5',
      mass: 20,
      temperature: 20,
      pressure: 2000,
    ),
    Pipe(
      name: 'Pipe6',
      mass: 20,
      temperature: 20,
      pressure: 2000,
    ),
    Pipe(
      name: 'Pipe7',
      mass: 20,
      temperature: 20,
      pressure: 2000,
    ),
  ];

  void runModel() async {
    td.ffr = ffr;
    double t = 0;
    double dt_seted = 0.5;
    Blocks.dt = dt_seted;
    // final broadcastStreem =
    // ffr.outputLiquid1 = pipes[0].liquid;
    // ffr.outputLiquid2 = pipes[0].liquid;
    while (isPlayed) {
      pipes[0].blockUpdate(th1);
      pipes[4].blockUpdate(th2);
      print(td.temperature);

      th1.pipesUpdate([pipes[1]]);

      th2.pipesUpdate([pipes[5]]);

      pipes[1].blockUpdate(td);
      td.updateFFR(ffr);

      pipes[1].blockUpdate(he1);
      pipes[5].blockUpdate(he3);

      he1.pipesUpdate([pipes[2]]);
      he3.pipesUpdate([pipes[6]]);

      pipes[2].blockUpdate(he2);

      he2.pipesUpdate([pipes[3]]);

      // ffr.updateState([pipes[3], pipes[6]]);
      ffr.pipesUpdate([pipes[3], pipes[6], pipes[0], pipes[5]]);
      var dt = await Future<double>.delayed(
        Duration(milliseconds: Blocks.dt * 1000 ~/ 2),
        () => dt_seted,
      );
      t = t + dt;
    }
  }
}
