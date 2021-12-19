import 'package:flutter/material.dart';
import 'package:nir/model/model_knr.dart';
import 'package:nir/model/model_manager.dart';
import 'package:nir/painting/block_tile.dart';
import 'package:nir/model/models.dart';
import 'package:timer_builder/timer_builder.dart';

class ModelDetailsScreen extends StatefulWidget {
  ModelDetailsScreen({Key? key, required this.manager}) : super(key: key);

  ModelManager manager;

  @override
  State<ModelDetailsScreen> createState() => _ModelDetailsScreenState();
}

class _ModelDetailsScreenState extends State<ModelDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var modelKnr = widget.manager.modelKnr;
    var modelKzo = widget.manager.modelKzo;
    return TimerBuilder.periodic(
        Duration(milliseconds: Blocks.dtForUpdateWidgets), builder: (context) {
      return Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('КНР'),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Внутренний контур'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('РРЖ-Д1'),
                            SizedBox(width: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                    'Температура: ${modelKnr.pipes[4].temperature.toStringAsFixed(1)} °C'),
                                Text(
                                    'Давление: 0.0${modelKnr.pipes[4].pressure * 10000 ~/ 101325} Атм'),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Д1-Н1'),
                            SizedBox(width: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                    'Температура: ${modelKnr.pipes[5].temperature.toStringAsFixed(1)} °C'),
                                Text(
                                    'Давление: 0.0${modelKnr.pipes[5].pressure * 10000 ~/ 101325} Атм'),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Н1-ЖЖТ'),
                            SizedBox(width: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                    'Температура: ${modelKnr.pipes[6].temperature.toStringAsFixed(1)} °C'),
                                Text(
                                    'Давление: 0.0${modelKnr.pipes[6].pressure * 10000 ~/ 101325} Атм'),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('ЖЖТ-ГЖА'),
                            SizedBox(width: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                    'Температура: ${modelKnr.pipes[7].temperature.toStringAsFixed(1)} °C'),
                                Text(
                                    'Давление: 0.0${modelKnr.pipes[7].pressure * 10000 ~/ 101325} Атм'),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('ГЖА-АТ'),
                            SizedBox(width: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                    'Температура: ${modelKnr.pipes[8].temperature.toStringAsFixed(1)} °C'),
                                Text(
                                    'Давление: 0.0${modelKnr.pipes[8].pressure * 10000 ~/ 101325} Атм'),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('АТ-РРЖ'),
                            SizedBox(width: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                    'Температура: ${modelKnr.pipes[9].temperature.toStringAsFixed(1)} °C'),
                                Text(
                                    'Давление: 0.0${modelKnr.pipes[9].pressure * 10000 ~/ 101325} Атм'),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                    const SizedBox(width: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text('Внешний контур'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('РРЖ-Д2'),
                            SizedBox(width: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                    'Температура: ${modelKnr.pipes[0].temperature.toStringAsFixed(1)} °C'),
                                Text(
                                    'Давление: 0.0${modelKnr.pipes[0].pressure * 10000 ~/ 101325} Атм'),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Д2-Н2'),
                            SizedBox(width: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                    'Температура: ${modelKnr.pipes[1].temperature.toStringAsFixed(1)} °C'),
                                Text(
                                    'Давление: 0.0${modelKnr.pipes[1].pressure * 10000 ~/ 101325} Атм'),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Н2-НХР'),
                            SizedBox(width: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                    'Температура: ${modelKnr.pipes[2].temperature.toStringAsFixed(1)} °C'),
                                Text(
                                    'Давление: 0.0${modelKnr.pipes[2].pressure * 10000 ~/ 101325} Атм'),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('НХР-РРЖ'),
                            SizedBox(width: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                    'Температура: ${modelKnr.pipes[3].temperature.toStringAsFixed(1)} °C'),
                                Text(
                                    'Давление: 0.0${modelKnr.pipes[3].pressure * 10000 ~/ 101325} Атм'),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('КЖО'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('ЖЖТ-ХСА2'),
                    SizedBox(width: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                            'Температура: ${modelKzo.pipes[0].temperature.toStringAsFixed(1)} °C'),
                        Text(
                            'Давление: 0.0${modelKzo.pipes[0].pressure * 10000 ~/ 101325} Атм'),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('ХСА2-ХСА1'),
                    SizedBox(width: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                            'Температура: ${modelKzo.pipes[1].temperature.toStringAsFixed(1)} °C'),
                        Text(
                            'Давление: 0.0${modelKzo.pipes[1].pressure * 10000 ~/ 101325} Атм'),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('ХСА1-ЗПхО'),
                    SizedBox(width: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                            'Температура: ${modelKzo.pipes[2].temperature.toStringAsFixed(1)} °C'),
                        Text(
                            'Давление: 0.0${modelKzo.pipes[2].pressure * 10000 ~/ 101325} Атм'),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('ЗПхО-ЗАО'),
                    SizedBox(width: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                            'Температура: ${modelKzo.pipes[3].temperature.toStringAsFixed(1)} °C'),
                        Text(
                            'Давление: 0.0${modelKzo.pipes[3].pressure * 10000 ~/ 101325} Атм'),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('ЗАО-Д3'),
                    SizedBox(width: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                            'Температура: ${modelKzo.pipes[4].temperature.toStringAsFixed(1)} °C'),
                        Text(
                            'Давление: 0.0${modelKzo.pipes[4].pressure * 10000 ~/ 101325} Атм'),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Д3-Н3'),
                    SizedBox(width: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                            'Температура: ${modelKzo.pipes[5].temperature.toStringAsFixed(1)} °C'),
                        Text(
                            'Давление: 0.0${modelKzo.pipes[5].pressure * 10000 ~/ 101325} Атм'),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Н3-РРЖ'),
                    SizedBox(width: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                            'Температура: ${modelKzo.pipes[5].temperature.toStringAsFixed(1)} °C'),
                        Text(
                            'Давление: 0.0${modelKzo.pipes[5].pressure * 10000 ~/ 101325} Атм'),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ],
        ),
      );
    });
  }
}
