import '../model/model_base_classes.dart';

class Pipe implements Pipes, CanUpdateBlocks {
  Pipe({
    required String name,
    this.liquid,
  })  : _name = name,
        pressure = liquid!.pressure,
        temperature = liquid.temperature;

  final String _name;
  Liquid? liquid;
  double pressure;
  double temperature;
  static const conectionWeiht = 3.0;

  get name => _name;

  @override
  void updateState() {
    pressure = liquid!.pressure;
    temperature = liquid!.temperature;
  }

  @override
  String toString() =>
      '$_name, ${pressure.toStringAsFixed(3)} Па, ${temperature.toStringAsFixed(3)} С';

  @override
  void blockUpdate(Blocks block) {
    block.liquid = liquid;
    block.updateState();
  }
}
