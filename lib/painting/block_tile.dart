import 'package:flutter/material.dart';
import 'package:nir/model/models.dart';
import 'package:timer_builder/timer_builder.dart';

enum Parametrs {
  temperature,
  pressure,
  mass,
  koef,
}

class BlockTile extends StatefulWidget {
  BlockTile({
    Key? key,
    required Blocks block,
    bool temperature = false,
    bool pressure = false,
    bool mass = false,
    bool koef = false,
  })  : _block = block,
        params = [
          temperature,
          pressure,
          mass,
          koef,
        ],
        super(key: key);

  final Blocks _block;
  List<bool> params;

  @override
  State<BlockTile> createState() => _BlockTileState();
}

class _BlockTileState extends State<BlockTile> {
  @override
  Widget build(BuildContext context) {
    List<Widget> listOfParams = paramsWidget(widget.params, widget._block);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(widget._block.name),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: listOfParams,
        ),
      ],
    );
  }
}

List<Widget> paramsWidget(List<bool> params, Blocks block) {
  List<Widget> parametrs = [];
  final _outsideTemperatureController = TextEditingController();
  if (params[0]) {
    parametrs.add(TimerBuilder.periodic(
        Duration(milliseconds: Blocks.dtForUpdateWidgets), builder: (context) {
      return Text('Температура: ${block.temperature.toStringAsFixed(3)} °C');
    }));
  }
  if (block.runtimeType.toString() == 'HeatExchanger') {
    parametrs.add(
      Row(
        children: [
          const Text('Температура снаружи:'),
          const SizedBox(width: 10),
          Container(
            height: 20,
            width: 40,
            child: TextField(
              controller: _outsideTemperatureController,
              onEditingComplete: () {
                block.outsideTemperature =
                    double.parse(_outsideTemperatureController.text);
              },
              decoration: InputDecoration(
                hintText: block.outsideTemperature.toString(),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                border: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  if (params[1]) {
    parametrs.add(const SizedBox(height: 5));
    parametrs.add(TimerBuilder.periodic(
        Duration(milliseconds: Blocks.dtForUpdateWidgets), builder: (context) {
      return Text('Давление: ${block.pressure.toStringAsFixed(3)} Па');
    }));
  }
  if (params[2]) {
    parametrs.add(const SizedBox(height: 5));
    parametrs.add(TimerBuilder.periodic(
        Duration(milliseconds: Blocks.dtForUpdateWidgets), builder: (context) {
      return Text('Масса: ${block.mass.toStringAsFixed(3)} кг');
    }));
  }
  if (params[3]) {
    parametrs.add(const SizedBox(height: 5));
    parametrs.add(TimerBuilder.periodic(
        Duration(milliseconds: Blocks.dtForUpdateWidgets), builder: (context) {
      return Text('Коэфициент раскрытия РРЖ: ${block.koef.toStringAsFixed(3)}');
    }));
  }
  return parametrs;
}


// void _changeOutsideTemp() {
//   void _change(Blocks block){
//     block.outsideTemperature = _ou
//   }
// }