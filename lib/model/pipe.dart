import '../model/model_base_classes.dart';

class Pipe implements Pipes, CanUpdateBlocks {
  Pipe({
    required String name,
    required double lenght,
    required this.koefPressure,
    required this.pressure,
    required this.temperature,
    required this.mass,
  })  : _lenght = lenght,
        _name = name;

  final String _name;
  final double _lenght;
  double koefPressure;
  double pressure;
  double temperature;
  double mass;
  static const conectionWeiht = 3.0;

  get name => _name;

  @override
  String toString() =>
      '$_name, ${pressure.toStringAsFixed(3)} Па, ${temperature.toStringAsFixed(3)} С';

  @override
  void blockUpdate(Blocks block) {
    block.pressure = pressure - _lenght * koefPressure;
    block.temperature = temperature;
    block.mass = mass;
    block.updateState();
  }
}
