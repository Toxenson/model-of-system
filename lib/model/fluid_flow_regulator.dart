import 'package:flutter/material.dart';
import 'package:nir/model/models.dart';
import 'package:timer_builder/timer_builder.dart';

class FluidFlowRegulator extends StatelessWidget implements CanUpdatePipes {
  FluidFlowRegulator({
    Key? key,
    required String name,
    Liquid? inputLiquid1,
    Liquid? inputLiquid2,
    Liquid? outputLiquid1,
    Liquid? outputLiquid2,
  })  : _name = name,
        super(key: key);

  final String _name;
  double koefOfTransit = 0;
  Liquid? inputLiquid1;
  Liquid? inputLiquid2;
  Liquid? outputLiquid1;
  Liquid? outputLiquid2;

  /// Схема работы РРЖ
  ///          ВМ  ^       ^  НМ
  /// outputLiquid1|       |outputLiquid2
  ///              +-------+
  ///              |  РРЖ  |
  ///              +-------+
  ///          ВМ  ^       ^  НМ
  ///  inputLiquid1|       |inputLiquid2

  @override
  // void pipesUpdate(List<Pipes> pipes) {
  //   var pipe1 = pipes[0];
  //   var pipe2 = pipes[1];
  //   pipe1.liquid = outputLiquid1;
  //   pipe2.liquid = outputLiquid2;
  //   pipe1.updateState();
  //   pipe2.updateState();
  //   // pipe2.mass = koefOfTransit * pipe4.mass + (1 - koefOfTransit) * pipe1.mass;
  //   // pipe3.mass = koefOfTransit * pipe1.mass + (1 - koefOfTransit) * pipe4.mass;
  //   // pipe2.temperature = (pipe4.temperature * pipe4.mass * koefOfTransit +
  //   //         pipe1.temperature * pipe1.mass * (1 - koefOfTransit)) /
  //   //     (pipe4.mass * koefOfTransit + pipe1.mass * (1 - koefOfTransit));
  //   // pipe3.temperature = (pipe1.temperature * pipe1.mass * koefOfTransit +
  //   //         pipe4.temperature * pipe4.mass * (1 - koefOfTransit)) /
  //   //     (pipe1.mass * koefOfTransit + pipe4.mass * (1 - koefOfTransit));
  //   // pipe2.pressure =
  //   //     koefOfTransit * pipe4.pressure + (1 - koefOfTransit) * pipe1.pressure;
  //   // pipe3.pressure =
  //   //     koefOfTransit * pipe1.pressure + (1 - koefOfTransit) * pipe4.pressure;
  // }

  // void updateState(List<Pipes> pipes) {
  //   inputLiquid1 = pipes[0].liquid;
  //   inputLiquid2 = pipes[1].liquid;
  //   outputLiquid1!.mass = koefOfTransit * inputLiquid2!.mass +
  //       (1 - koefOfTransit) * inputLiquid1!.mass;
  //   outputLiquid2!.mass = koefOfTransit * inputLiquid1!.mass +
  //       (1 - koefOfTransit) * inputLiquid2!.mass;
  //   outputLiquid1!.temperature =
  //       (koefOfTransit * inputLiquid2!.mass * inputLiquid2!.temperature +
  //               (1 - koefOfTransit) *
  //                   inputLiquid1!.mass *
  //                   inputLiquid1!.temperature) /
  //           outputLiquid1!.mass;
  //   outputLiquid2!.temperature =
  //       (koefOfTransit * inputLiquid1!.mass * inputLiquid1!.temperature +
  //               (1 - koefOfTransit) *
  //                   inputLiquid2!.mass *
  //                   inputLiquid2!.temperature) /
  //           outputLiquid2!.mass;
  //   outputLiquid1!.pressure = koefOfTransit * inputLiquid2!.pressure +
  //       (1 - koefOfTransit) * inputLiquid1!.pressure;
  //   outputLiquid2!.pressure = koefOfTransit * inputLiquid1!.pressure +
  //       (1 - koefOfTransit) * inputLiquid2!.pressure;
  // }

  @override
  void pipesUpdate(List<Pipes> pipes) {
    var pipe1 = pipes[0];
    var pipe4 = pipes[1];
    var pipe2 = pipes[2];
    var pipe3 = pipes[3];
    pipe2.mass = koefOfTransit * pipe4.mass + (1 - koefOfTransit) * pipe1.mass;
    pipe3.mass = koefOfTransit * pipe1.mass + (1 - koefOfTransit) * pipe4.mass;
    pipe2.temperature = (pipe4.temperature * pipe4.mass * koefOfTransit +
            pipe1.temperature * pipe1.mass * (1 - koefOfTransit)) /
        (pipe4.mass * koefOfTransit + pipe1.mass * (1 - koefOfTransit));
    pipe3.temperature = (pipe1.temperature * pipe1.mass * koefOfTransit +
            pipe4.temperature * pipe4.mass * (1 - koefOfTransit)) /
        (pipe1.mass * koefOfTransit + pipe4.mass * (1 - koefOfTransit));
    pipe2.pressure =
        koefOfTransit * pipe4.pressure + (1 - koefOfTransit) * pipe1.pressure;
    pipe3.pressure =
        koefOfTransit * pipe1.pressure + (1 - koefOfTransit) * pipe4.pressure;
  }

  @override
  Widget build(BuildContext context) {
    return TimerBuilder.periodic(
      Duration(milliseconds: Blocks.dtForUpdateWidgets),
      builder: (context) {
        return Container(
          width: 140,
          height: 60,
          decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: const BorderRadius.all(Radius.circular(8.0))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_name),
              Text(koefOfTransit.toStringAsFixed(2)),
            ],
          ),
        );
      },
    );
  }
}
