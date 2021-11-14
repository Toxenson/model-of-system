import '../model/model_base_classes.dart';

class Pipe implements Pipes, CanUpdateBlocks {
  Pipe({
    required String name,
    this.someLiquid,
  })  : _name = name,
        pressure = someLiquid!.pressure,
        temperature = someLiquid.temperature;

  final String _name;
  Liquid? someLiquid;
  double pressure;
  double temperature;
  static const conectionWeiht = 3.0;

  get name => _name;

  @override
  void updateState() {
    pressure = someLiquid!.pressure;
    temperature = someLiquid!.temperature;
  }

  @override
  String toString() =>
      '$_name, ${pressure.toStringAsFixed(3)} Па, ${temperature.toStringAsFixed(3)} С';

  @override
  void blockUpdate(Blocks block) {
    block.someLiquid = someLiquid;
    block.updateState();
  }
}
