import 'package:flutter/material.dart';
import 'package:nir/model/liquid_heat_exchanger.dart';
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
    outsideTemperature: 30,
  );
  final he2 = HeatExchanger(
    name: 'АТ',
    alf: 5,
    beta: 5,
    mass: 20,
    temperature: 20,
    pressure: 2000,
    outsideTemperature: 60,
  );
  final he3 = HeatExchanger(
    name: 'НХР',
    alf: 5,
    beta: 5,
    mass: 20,
    temperature: 20,
    pressure: 2000,
    outsideTemperature: -50,
  );
  final td = TemperatureDetector(
    name: 'ДТЖ',
    requiredTemperatureMin: 20,
    requiredTemperatureMax: 40,
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
  final lhe = LiquidHeatExchanger(
      name: 'ЖЖТ',
      alf: 5,
      beta: 5,
      pressure: 2000,
      temperature: 100,
      mass: 20,
      input1Mass: 20,
      input2Mass: 20,
      input1Pressure: 2000,
      input2Pressure: 2000,
      input1Temperature: 40,
      input2Temperature: 40);

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
    Pipe(
      name: 'Pipe10',
      mass: 20,
      temperature: 20,
      pressure: 2000,
      koefPressure: 0.2,
      lenght: 20,
    ),
  ];

  void restartModel() {
    print('knr restarted');
    pu1.pressure = 2000;
    pu1.temperature = 20;
    pu1.mass = 20;

    pu2.pressure = 2000;
    pu2.temperature = 20;
    pu2.mass = 20;

    he1.mass = 20;
    he1.temperature = 20;
    he1.pressure = 2000;

    he2.mass = 20;
    he2.temperature = 20;
    he2.pressure = 2000;

    he3.mass = 20;
    he3.temperature = 20;
    he3.pressure = 2000;

    td.mass = 20;
    td.temperature = 20;
    td.pressure = 2000;

    th1.mass = 20;
    th1.temperature = 20;
    th1.pressure = 2000;

    th2.mass = 20;
    th2.temperature = 20;
    th2.pressure = 2000;

    lhe.alf = 5;
    lhe.beta = 5;
    lhe.pressure = 2000;
    lhe.temperature = 100;
    lhe.mass = 20;
    lhe.input1Mass = 20;
    lhe.input2Mass = 20;
    lhe.input1Pressure = 2000;
    lhe.input2Pressure = 2000;
    lhe.input1Temperature = 40;
    lhe.input2Temperature = 40;

    pipes[0].mass = 20;
    pipes[0].temperature = 20;
    pipes[0].pressure = 2000;

    pipes[4].mass = 20;
    pipes[4].temperature = 20;
    pipes[4].pressure = 2000;
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

      lhe.updateKnrPart([pipes[6], pipes[7]]);

      pipes[7].blockUpdate(he1);
      pipes[2].blockUpdate(he3);

      he1.pipesUpdate([pipes[8]]);
      he3.pipesUpdate([pipes[3]]);

      pipes[8].blockUpdate(he2);

      he2.pipesUpdate([pipes[9]]);

      // ffr.updateState([pipes[3], pipes[6]]);
      ffr.pipesUpdate([pipes[9], pipes[3], pipes[4], pipes[0]]);
      var dt = await Future<double>.delayed(
        Duration(milliseconds: Blocks.dt * 1000 ~/ 1),
        () => dt_seted,
      );
      t = t + dt;
    }
  }
}
