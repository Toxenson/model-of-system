double findTempForHE(double beta, double outsideTemperature, double dt,
        double mass, double temperature) =>
    beta * outsideTemperature * dt / mass -
    temperature * (beta * dt / mass - 1);

double findPressForHE(double pressure, double beta, double outsideTemperature,
        double dt, double mass, double temperature, double alfaPriv) =>
    pressure +
    alfaPriv *
        (findTempForHE(beta, outsideTemperature, dt, mass, temperature) -
            temperature);

double findPressForTH(double pressure, double acceptablePressure) =>
    (pressure > acceptablePressure) ? acceptablePressure : pressure;

double findTempForTH(
        double temperature, double pressure, double acceptablePressure) =>
    findPressForTH(pressure, acceptablePressure) * temperature / pressure;

abstract class Pipes {
  Liquid? someLiquid;
  double pressure = 0.0;
  double temperature = 0.0;
}

abstract class CanUpdatePipes {
  void pipesUpdate(
      List<Pipes> pipe); //only FFR can update more then 1 pipe, but only 2
}

abstract class Blocks {
  Liquid? someLiquid;
  double pressure = 0.0;
  double temperature = 0.0;
  static var dt = 0.5;
}

abstract class CanUpdateBlocks {
  void blockUpdate(Blocks block);
}

class Liquid {
  Liquid({
    required this.mass,
    required this.temperature,
    required this.pressure,
  });
  double mass;
  double temperature;
  double pressure;
}

// class Pipe implements Pipes, CanUpdateBlocks {
//   Pipe({
//     required String name,
//     required this.someLiquid,
//   })  : _name = name,
//         pressure = someLiquid!.pressure,
//         temperature = someLiquid.temperature;

//   final String _name;
//   Liquid? someLiquid;
//   double pressure;
//   double temperature;

//   get name => _name;

//   @override
//   String toString() =>
//       '$_name, ${pressure.toStringAsFixed(3)} Па, ${temperature.toStringAsFixed(3)} С';

//   @override
//   void blockUpdate(Blocks block) {
//     block.someLiquid = someLiquid;
//   }
// }

// class Throttle implements Blocks, CanUpdatePipes {
//   Throttle({
//     required double acceptablePressure,
//     required String name,
//     required this.someLiquid,
//   })  : _acceptablePressure = acceptablePressure,
//         _name = name,
//         pressure = _findPressForTH(someLiquid!.pressure, acceptablePressure),
//         temperature = _findTempForTH(
//             someLiquid.temperature, someLiquid.pressure, acceptablePressure),
//         mass = someLiquid.mass;

//   final double _acceptablePressure;
//   final String _name;
//   Liquid? someLiquid;
//   double pressure;
//   double temperature;
//   double mass;

//   @override
//   String toString() =>
//       'Throttle: $_name, acceptable pressure: $_acceptablePressure\npressure: $pressure, temperature: $temperature';

//   @override
//   void pipesUpdate(List<Pipes> pipes) {
//     var pipe = pipes[0];
//     pipe.someLiquid!.pressure = _findPressForTH(pressure, _acceptablePressure);
//     someLiquid!.temperature =
//         _findTempForTH(temperature, pressure, _acceptablePressure);
//     someLiquid!.mass = mass;
//   }
// }

// class HeatExchanger implements Blocks, CanUpdatePipes {
//   HeatExchanger(
//       {required String name,
//       required double pressure,
//       required double temperature,
//       required double alf,
//       required double beta,
//       required double mass,
//       required double outsideTemperature})
//       : _alf = alf,
//         _beta = beta,
//         mass = mass,
//         _name = name,
//         pressure = _findPressForHE(pressure, beta, outsideTemperature,
//             Blocks.dt, mass, temperature, _findTempForHE, alf),
//         temperature = _findTempForHE()(
//             beta, outsideTemperature, Blocks.dt, mass, temperature),
//         outsideTemperature = outsideTemperature;

//   final String _name;
//   final double _alf;
//   final double _beta;
//   double outsideTemperature;
//   double mass;
//   double temperature;
//   double pressure;

//   @override
//   void pipesUpdate(List<Pipes> pipes) {
//     var pipe = pipes[0];
//     pipe.pressure = _findPressForHE(pressure, _beta, outsideTemperature,
//         Blocks.dt, mass, temperature, _findTempForHE, _alf);
//     pipe.temperature = _findTempForHE()(
//         _beta, outsideTemperature, Blocks.dt, mass, temperature);
//     pipe.mass = mass;
//   }

//   @override
//   String toString() =>
//       'Heat Exchanger: $_name, pressure: $pressure, temperature: $temperature';
// }

// class TemperatureDetector extends Blocks {
//   TemperatureDetector({
//     required String name,
//     required this.pressure,
//     required this.temperature,
//     required this.mass,
//     required this.koefOfTransit,
//   }) : _name = name;

//   final String _name;
//   double koefOfTransit;
//   double mass;
//   double temperature;
//   double pressure;

//   @override
//   String toString() =>
//       'Temperature Detector: $_name, pressure: $pressure, temperature: $temperature';

//   void updateFFR(FluidFlowRegulator ffr, double requiredTemperature) {
//     var tik = 0;
//     const requiredTiks = 3;
//     // bool mark;
//     // if (mark == true) { }    else {
//     //   ffr.koefOfTransit = 0;
//     // }
//     if (temperature > requiredTemperature) {
//       ffr.koefOfTransit = 1 / (1 + exp(-(temperature / requiredTemperature)));
//       // mark = true;
//     } else {
//       ffr.koefOfTransit = 0;
//     }

//     // ffr.koefOfTransit = 1 / (1 + exp(-(temperature - requiredTemperature)));
//     print('|FFR k: ${ffr.koefOfTransit}');
//   }
// }

// class FluidFlowRegulator implements CanUpdatePipes {
//   FluidFlowRegulator({
//     required String name,
//   }) : _name = name;

//   final String _name;
//   double koefOfTransit = 0;

//   /// Схема работы функции pipesUpdate() в блоке РРЖ
//   ///  ВМ  ^       ^  НМ
//   /// pipe2|       |pipe3
//   ///      +-------+
//   ///      |  РРЖ  |
//   ///      +-------+
//   ///  ВМ  ^       ^  НМ
//   /// pipe1|       |pipe4
//   @override
//   void pipesUpdate(List<Pipes> pipes) {
//     var pipe1 = pipes[0];
//     var pipe4 = pipes[1];
//     var pipe2 = pipes[2];
//     var pipe3 = pipes[3];
//     pipe2.mass = koefOfTransit * pipe4.mass + (1 - koefOfTransit) * pipe1.mass;
//     pipe3.mass = koefOfTransit * pipe1.mass + (1 - koefOfTransit) * pipe4.mass;
//     pipe2.temperature = (pipe4.temperature * pipe4.mass * koefOfTransit +
//             pipe1.temperature * pipe1.mass * (1 - koefOfTransit)) /
//         (pipe4.mass * koefOfTransit + pipe1.mass * (1 - koefOfTransit));
//     pipe3.temperature = (pipe1.temperature * pipe1.mass * koefOfTransit +
//             pipe4.temperature * pipe4.mass * (1 - koefOfTransit)) /
//         (pipe1.mass * koefOfTransit + pipe4.mass * (1 - koefOfTransit));
//     pipe2.pressure =
//         koefOfTransit * pipe4.pressure + (1 - koefOfTransit) * pipe1.pressure;
//     pipe3.pressure =
//         koefOfTransit * pipe1.pressure + (1 - koefOfTransit) * pipe4.pressure;
//   }

//   void updateFromPipes(List<Pipes> pipes) {
//     // TODO: implement updateFromPipes
//   }
// }
