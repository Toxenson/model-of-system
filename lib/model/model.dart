import 'package:flutter/material.dart';
import 'package:nir/model/model_manager.dart';
import 'package:nir/model/pump.dart';
import 'package:nir/painting/arrows.dart';
import '../model/models.dart';

class ModelKnr {
  ModelManager? manager;

  static final ModelKnr _instance = ModelKnr._();
  ModelKnr._();
  factory ModelKnr({ModelManager? manager}) {
    _instance.manager = manager;
    return _instance;
  }

  final pu1 = Pump(
      name: 'Н1',
      pressure: 2000,
      temperature: 20,
      mass: 20,
      deltaPressure: 400);
  final pu2 = Pump(
      name: 'Н2',
      pressure: 2000,
      temperature: 20,
      mass: 20,
      deltaPressure: 400);
  final ffr = FluidFlowRegulator(
    name: 'РРЖ',
  );
  final he1 = HeatExchanger(
    name: 'ГЖА',
    alf: 5,
    beta: 5,
    mass: 20,
    temperature: 20,
    pressure: 2000,
    outsideTemperature: 50,
  );
  final he2 = HeatExchanger(
    name: 'АТ',
    alf: 5,
    beta: 5,
    mass: 20,
    temperature: 20,
    pressure: 2000,
    outsideTemperature: 70,
  );
  final he3 = HeatExchanger(
    name: 'НХР',
    alf: 5,
    beta: 5,
    mass: 20,
    temperature: 20,
    pressure: 2000,
    outsideTemperature: -10,
  );
  final td = TemperatureDetector(
    name: 'ДТ',
    requiredTemperatureMin: 20,
    requiredTemperatureMax: 60,
    koefOfTransit: 0,
    mass: 20,
    temperature: 20,
    pressure: 2000,
  );
  final th1 = Throttle(
    name: 'Д1',
    acceptablePressure: 2000,
    mass: 20,
    temperature: 20,
    pressure: 2000,
  );
  final th2 = Throttle(
    name: 'Д2',
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
      koefPressure: 0.2,
      lenght: 20,
    ),
    Pipe(
      name: 'Pipe2',
      mass: 20,
      temperature: 20,
      pressure: 2000,
      koefPressure: 0.2,
      lenght: 20,
    ),
    Pipe(
      name: 'Pipe3',
      mass: 20,
      temperature: 20,
      pressure: 2000,
      koefPressure: 0.2,
      lenght: 20,
    ),
    Pipe(
      name: 'Pipe4',
      mass: 20,
      temperature: 20,
      pressure: 2000,
      koefPressure: 0.2,
      lenght: 20,
    ),
    Pipe(
      name: 'Pipe5',
      mass: 20,
      temperature: 20,
      pressure: 2000,
      koefPressure: 0.2,
      lenght: 20,
    ),
    Pipe(
      name: 'Pipe6',
      mass: 20,
      temperature: 20,
      pressure: 2000,
      koefPressure: 0.2,
      lenght: 20,
    ),
    Pipe(
      name: 'Pipe7',
      mass: 20,
      temperature: 20,
      pressure: 2000,
      koefPressure: 0.2,
      lenght: 20,
    ),
    Pipe(
      name: 'Pipe8',
      mass: 20,
      temperature: 20,
      pressure: 2000,
      koefPressure: 0.2,
      lenght: 20,
    ),
    Pipe(
      name: 'Pipe9',
      mass: 20,
      temperature: 20,
      pressure: 2000,
      koefPressure: 0.2,
      lenght: 20,
    ),
  ];

  void restartModel() {
    pipes[0] = Pipe(
      name: 'Pipe1',
      mass: 20,
      temperature: 20,
      pressure: 2000,
      koefPressure: 0.2,
      lenght: 20,
    );
    pipes[4] = Pipe(
      name: 'Pipe1',
      mass: 20,
      temperature: 20,
      pressure: 2000,
      koefPressure: 0.2,
      lenght: 20,
    );
  }

  void runModel() async {
    td.ffr = ffr;
    double t = 0;
    double dt_seted = 0.5;
    Blocks.dt = dt_seted;
    while (manager!.play) {
      pipes[4].blockUpdate(th1);
      pipes[0].blockUpdate(th2);

      th1.pipesUpdate([pipes[5]]);
      th2.pipesUpdate([pipes[1]]);

      pipes[5].blockUpdate(pu1);
      pipes[1].blockUpdate(pu2);

      pu1.pipesUpdate([pipes[6]]);
      pu2.pipesUpdate([pipes[2]]);

      pipes[6].blockUpdate(td);
      td.updateFFR(ffr);

      pipes[6].blockUpdate(he1);
      pipes[2].blockUpdate(he3);

      he1.pipesUpdate([pipes[7]]);
      he3.pipesUpdate([pipes[3]]);

      pipes[7].blockUpdate(he2);

      he2.pipesUpdate([pipes[8]]);

      // ffr.updateState([pipes[3], pipes[6]]);
      ffr.pipesUpdate([pipes[8], pipes[3], pipes[4], pipes[0]]);
      var dt = await Future<double>.delayed(
        Duration(milliseconds: Blocks.dt * 1000 ~/ 1),
        () => dt_seted,
      );
      t = t + dt;
    }
  }
}
