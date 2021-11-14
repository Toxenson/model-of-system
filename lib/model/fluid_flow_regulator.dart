import 'package:flutter/material.dart';
import 'package:nir/model/models.dart';

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
  void pipesUpdate(List<Pipes> pipes) {
    var pipe1 = pipes[0];
    var pipe2 = pipes[1];
    pipe1.someLiquid = outputLiquid1;
    pipe2.someLiquid = outputLiquid2;
    // pipe2.mass = koefOfTransit * pipe4.mass + (1 - koefOfTransit) * pipe1.mass;
    // pipe3.mass = koefOfTransit * pipe1.mass + (1 - koefOfTransit) * pipe4.mass;
    // pipe2.temperature = (pipe4.temperature * pipe4.mass * koefOfTransit +
    //         pipe1.temperature * pipe1.mass * (1 - koefOfTransit)) /
    //     (pipe4.mass * koefOfTransit + pipe1.mass * (1 - koefOfTransit));
    // pipe3.temperature = (pipe1.temperature * pipe1.mass * koefOfTransit +
    //         pipe4.temperature * pipe4.mass * (1 - koefOfTransit)) /
    //     (pipe1.mass * koefOfTransit + pipe4.mass * (1 - koefOfTransit));
    // pipe2.pressure =
    //     koefOfTransit * pipe4.pressure + (1 - koefOfTransit) * pipe1.pressure;
    // pipe3.pressure =
    //     koefOfTransit * pipe1.pressure + (1 - koefOfTransit) * pipe4.pressure;
  }

  void updateState(List<Pipes> pipes) {
    inputLiquid1 = pipes[0].someLiquid;
    inputLiquid2 = pipes[1].someLiquid;
    outputLiquid1!.mass = koefOfTransit * inputLiquid2!.mass +
        (1 - koefOfTransit) * inputLiquid1!.mass;
    outputLiquid2!.mass = koefOfTransit * inputLiquid1!.mass +
        (1 - koefOfTransit) * inputLiquid2!.mass;
    outputLiquid1!.temperature =
        (koefOfTransit * inputLiquid2!.mass * inputLiquid2!.temperature +
                (1 - koefOfTransit) *
                    inputLiquid1!.mass *
                    inputLiquid1!.temperature) /
            outputLiquid1!.mass;
    outputLiquid2!.temperature =
        (koefOfTransit * inputLiquid1!.mass * inputLiquid1!.temperature +
                (1 - koefOfTransit) *
                    inputLiquid2!.mass *
                    inputLiquid2!.temperature) /
            outputLiquid2!.mass;
    outputLiquid1!.pressure = koefOfTransit * inputLiquid2!.pressure +
        (1 - koefOfTransit) * inputLiquid1!.pressure;
    outputLiquid2!.pressure = koefOfTransit * inputLiquid1!.pressure +
        (1 - koefOfTransit) * inputLiquid2!.pressure;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      color: Colors.green,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_name),
          Text(koefOfTransit.toString()),
        ],
      ),
    );
  }
}
