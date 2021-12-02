import 'package:flutter/material.dart';
import '../model/model_base_classes.dart';
import 'package:timer_builder/timer_builder.dart';

class LiquidHeatExchanger extends StatelessWidget
    implements Blocks, CanUpdatePipes {
  static final LiquidHeatExchanger _instance = LiquidHeatExchanger._();
  LiquidHeatExchanger._();
  factory LiquidHeatExchanger(
      {Key? key,
      required String name,
      required double alf,
      required double beta,
      required double pressure,
      required double temperature,
      required double mass,
      required double input1Mass,
      required double input2Mass,
      required double input1Pressure,
      required double input2Pressure,
      required double input1Temperature,
      required double input2Temperature,
      double outsideTemperature = 80}) {
    _instance.alf = alf;
    _instance.beta = beta;
    _instance.name = name;
    _instance.color = setColorOfTemperature(temperature);
    _instance.pressure = pressure;
    _instance.temperature = temperature;
    _instance.mass = mass;
    _instance.input1Mass = input1Mass;
    _instance.input2Mass = input2Mass;
    _instance.input1Pressure = input1Pressure;
    _instance.input2Pressure = input2Pressure;
    _instance.input1Temperature = input1Temperature;
    _instance.input2Temperature = input2Temperature;
    return _instance;
  }

  String name = '';
  double alf = 0;
  double beta = 0;
  double input1Mass = 0;
  double input2Mass = 0;
  double input1Pressure = 0;
  double input2Pressure = 0;
  double input1Temperature = 20;
  double input2Temperature = 20;
  double mass = 0;
  double temperature = 0;
  double pressure = 0;
  double koef = 0.0;
  double outsideTemperature = 0;
  Color color = Colors.green;

  @override
  void updateState() {
    // mass = liquid!.mass;
    // pressure = findPressForHE(liquid!.pressure, _beta, outsideTemperature,
    //     Blocks.dt, liquid!.mass, liquid!.temperature, _alf);
    // temperature = findTempForHE(_beta, outsideTemperature, Blocks.dt,
    //     liquid!.mass, liquid!.temperature);
    color = setColorOfTemperature(
        (input1Temperature * input1Mass + input2Temperature * input2Mass) /
            (input1Mass + input2Mass));
  }

  /// Схема работы ЖЖТ
  ///      КНР  ^       ^  КЖО
  ///outputPipe1|       |outputPipe2
  ///           +-------+
  ///           |  ЖЖТ  |
  ///           +-------+
  ///      КНР  ^       ^  КЖО
  /// inputPipe1|       |inputPipe2
  @override
  void pipesUpdate(List<Pipes> pipes) {
    // var inputPipe1 = pipes[0];
    // var inputPipe2 = pipes[1];
    // var outputPipe1 = pipes[2];
    // var outputPipe2 = pipes[3];
    // outputPipe1.pressure = findPressForHE(
    //     inputPipe1.pressure,
    //     _beta,
    //     inputPipe2.temperature,
    //     Blocks.dt,
    //     inputPipe1.mass,
    //     inputPipe1.temperature,
    //     _alf);
    // outputPipe1.temperature = findTempForHE(_beta, inputPipe2.temperature,
    //     Blocks.dt, outputPipe1.mass, outputPipe1.temperature);
    // outputPipe1.mass = outputPipe1.mass;

    // outputPipe2.pressure = findPressForHE(
    //     inputPipe2.pressure,
    //     _beta,
    //     inputPipe1.temperature,
    //     Blocks.dt,
    //     inputPipe2.mass,
    //     inputPipe2.temperature,
    //     _alf);
    // outputPipe2.temperature = findTempForHE(_beta, inputPipe1.temperature,
    //     Blocks.dt, outputPipe2.mass, outputPipe2.temperature);
    // outputPipe2.mass = outputPipe2.mass;
  }

  void updateKnrPart(List<Pipes> pipes) {
    var inputPipe1 = pipes[0];
    var outputPipe1 = pipes[1];
    outputPipe1.pressure = findPressForHE(
        inputPipe1.pressure,
        beta,
        input2Temperature,
        Blocks.dt,
        inputPipe1.mass,
        inputPipe1.temperature,
        alf);
    outputPipe1.temperature = findTempForHE(beta, input2Temperature, Blocks.dt,
        inputPipe1.mass, inputPipe1.temperature);
    outputPipe1.mass = inputPipe1.mass;
    input1Mass = inputPipe1.mass;
    input1Pressure = inputPipe1.pressure;
    input1Temperature = inputPipe1.temperature;
    updateState();
    // print('input KNR temp: ${inputPipe1.temperature}');
    // print('output KNR temp: ${outputPipe1.temperature}');
  }

  void updateKzoPart(List<Pipes> pipes) {
    var inputPipe2 = pipes[0];
    var outputPipe2 = pipes[1];
    outputPipe2.pressure = findPressForHE(
        inputPipe2.pressure,
        beta,
        input1Temperature,
        Blocks.dt,
        inputPipe2.mass,
        inputPipe2.temperature,
        alf);
    outputPipe2.temperature = findTempForHE(beta, input1Temperature, Blocks.dt,
        inputPipe2.mass, inputPipe2.temperature);
    outputPipe2.mass = inputPipe2.mass;
    input2Mass = inputPipe2.mass;
    input2Pressure = inputPipe2.pressure;
    input2Temperature = inputPipe2.temperature;
    updateState();
    // print('input KZO temp: ${inputPipe2.temperature}');
    // print('input KNR temp: ${input1Temperature}');
    // print('output KZO temp: ${outputPipe2.temperature}');
  }

  @override
  Widget build(BuildContext context) {
    return TimerBuilder.periodic(
      Duration(milliseconds: Blocks.dtForUpdateWidgets),
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(Radius.circular(8.0))),
          width: 100,
          height: 80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(name),
              Text('КНР: ${input1Temperature.toStringAsFixed(3)} C'),
              Text('КЖО: ${input2Temperature.toStringAsFixed(3)} C'),
            ],
          ),
        );
      },
    );
  }
}
