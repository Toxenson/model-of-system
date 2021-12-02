import 'package:flutter/material.dart';
import 'package:nir/model/model_knr.dart';
import 'package:nir/model/model_kzo.dart';
import 'package:nir/model/model_manager.dart';
import 'package:nir/model/models.dart';
import 'package:nir/model/temperature_detector.dart';
import 'package:nir/painting/arrows.dart';

class ModelPreviewScreen extends StatefulWidget {
  ModelPreviewScreen({
    Key? key,
    required this.manager,
  }) : super(key: key);

  ModelManager manager;

  @override
  State<ModelPreviewScreen> createState() => _ModelPreviewScreenState();
}

class _ModelPreviewScreenState extends State<ModelPreviewScreen> {
  @override
  Widget build(BuildContext context) {
    ModelKnr modelKnr = widget.manager.modelKnr;
    ModelKzo modelKzo = widget.manager.modelKzo;
    List<double> sizesKNR = [
      16,
      600,
      500,
      140,
      60,
      60,
      60,
      80,
      60,
      100,
      60,
    ];

    final inside = insideContourKNR(sizesKNR, modelKnr);
    final outside = outsideContourKNR(sizesKNR, modelKnr);
    final kzo = kzoContour(modelKzo);
    return Center(
      child: Container(
        height: sizesKNR[2] + 100,
        width: sizesKNR[1] + 500,
        // color: Colors.blueGrey,
        child: Stack(
          children: [
                Positioned(
                  top: 30,
                  left: 350,
                  child: Container(
                    height: sizesKNR[2],
                    width: sizesKNR[1],
                    child: Stack(
                      children: inside +
                          outside +
                          [
                            Positioned(
                              bottom: sizesKNR[0],
                              left: sizesKNR[1] / 2 - sizesKNR[3] / 2,
                              child: modelKnr.ffr,
                            )
                          ],
                    ),
                  ),
                ),
              ] +
              kzo,
        ),
      ),
    );
  }
}

class VerticalStick extends CustomPainter {
  VerticalStick({
    double strokeWidth = 3,
  }) : _strokeWidth = strokeWidth;

  final double _strokeWidth;
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = _strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(
      Offset(
        size.width / 2,
        0,
      ),
      Offset(
        size.width / 2,
        size.height,
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class HorizontalStick extends CustomPainter {
  HorizontalStick({
    double strokeWidth = 3,
  }) : _strokeWidth = strokeWidth;

  final double _strokeWidth;
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = _strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(
      Offset(
        0,
        size.height / 2,
      ),
      Offset(
        size.width,
        size.height / 2,
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

List<Widget> insideContourKNR(List<double> sizes, model) {
  double? edgeInsert = sizes[0];
  double? widthCanvas = sizes[1];
  double? heightCanvas = sizes[2];
  double? widthFfr = sizes[3];
  double? heightFfr = sizes[4];
  double? widthTh = sizes[5];
  double? heightTh = sizes[6];
  double? wightTd = sizes[7];
  double? heightTd = sizes[8];
  double? wightHe = sizes[9];
  double? heightHe = sizes[10];
  return [
    Positioned(
      left: edgeInsert + wightHe / 2 + 151,
      top: edgeInsert + heightTd + heightHe * 2 + 255,
      child: Arrow(side: Side.right),
    ),
    Positioned(
      left: edgeInsert + wightHe / 2,
      top: edgeInsert + heightTd + heightHe * 2 + 255,
      child: SizedBox(
        height: 10,
        width: 163,
        child: CustomPaint(
          foregroundPainter: HorizontalStick(),
        ),
      ),
    ),
    Positioned(
      left: edgeInsert + wightHe / 2 - 5,
      top: edgeInsert + heightTd + heightHe * 2 + 195,
      child: SizedBox(
        height: 63,
        width: 10,
        child: CustomPaint(
          foregroundPainter: VerticalStick(),
        ),
      ),
    ),
    Positioned(
      left: edgeInsert,
      top: edgeInsert + heightTd * 2 + 195,
      child: model.he2,
    ),
    Positioned(
      left: edgeInsert + wightHe / 2 - 5,
      top: edgeInsert + heightTd + heightHe + 184,
      child: Arrow(side: Side.down),
    ),
    Positioned(
      left: edgeInsert + wightHe / 2 - 5,
      top: edgeInsert + heightTd + heightHe + 165,
      child: SizedBox(
        height: 20,
        width: 10,
        child: CustomPaint(
          foregroundPainter: VerticalStick(),
        ),
      ),
    ),
    Positioned(
      left: edgeInsert,
      top: edgeInsert + heightTd + 165,
      child: model.he1,
    ),
    Positioned(
      left: edgeInsert + wightHe * 0.5 - 5,
      top: heightTd + 170,
      child: Arrow(side: Side.down),
    ),
    Positioned(
      left: edgeInsert + wightHe * 0.5 - 5,
      top: heightTd + 80,
      child: SizedBox(
        height: 100,
        width: 10,
        child: CustomPaint(
          foregroundPainter: VerticalStick(),
        ),
      ),
    ),
    Positioned(
      top: edgeInsert + heightTd * 3,
      left: edgeInsert + wightHe + 10,
      child: model.td,
    ),
    Positioned(
      left: edgeInsert + wightHe * (1.5) - 5,
      top: heightTd * 3 + edgeInsert - 12,
      child: Arrow(side: Side.down),
    ),
    Positioned(
      left: edgeInsert + wightHe * (1.5) - 5,
      top: heightTd * 2 + edgeInsert + 4,
      child: SizedBox(
        height: 55,
        width: 10,
        child: CustomPaint(
          foregroundPainter: VerticalStick(),
        ),
      ),
    ),
    Positioned(
      left: edgeInsert + wightHe * 0.5,
      bottom: heightFfr + heightTh + 235,
      child: SizedBox(
        height: 10,
        width: 142 + wightHe * 0.5,
        child: CustomPaint(
          foregroundPainter: HorizontalStick(),
        ),
      ),
    ),
    Positioned(
      left: widthCanvas / 2 - widthFfr / 3,
      bottom: heightFfr + heightTh + heightTh + 65,
      child: SizedBox(
        height: 114,
        width: 10,
        child: CustomPaint(
          foregroundPainter: VerticalStick(),
        ),
      ),
    ),
    Positioned(
      bottom: heightFfr + edgeInsert + heightTh + 48,
      left: widthCanvas / 2 - widthFfr / 2,
      child: model.pu1,
    ),
    Positioned(
      left: widthCanvas / 2 - widthFfr / 3,
      bottom: heightFfr + edgeInsert + heightTh + 37,
      child: Arrow(side: Side.up),
    ),
    Positioned(
      left: widthCanvas / 2 - widthFfr / 3,
      bottom: heightFfr + edgeInsert + heightTh + 27,
      child: SizedBox(
        height: 20,
        width: 10,
        child: CustomPaint(
          foregroundPainter: VerticalStick(),
        ),
      ),
    ),
    Positioned(
      bottom: heightFfr + edgeInsert + 26,
      left: widthCanvas / 2 - widthFfr / 2,
      child: model.th1,
    ),
    Positioned(
      left: widthCanvas / 2 - widthFfr / 3,
      bottom: heightFfr + 30,
      child: Arrow(side: Side.up),
    ),
    Positioned(
      left: widthCanvas / 2 - widthFfr / 3,
      bottom: heightFfr + edgeInsert,
      child: SizedBox(
        height: 20,
        width: 10,
        child: CustomPaint(
          foregroundPainter: VerticalStick(),
        ),
      ),
    ),
  ];
}

List<Widget> outsideContourKNR(List<double> sizes, model) {
  double? edgeInsert = sizes[0];
  double? widthCanvas = sizes[1];
  double? heightCanvas = sizes[2];
  double? widthFfr = sizes[3];
  double? heightFfr = sizes[4];
  double? widthTh = sizes[5];
  double? heightTh = sizes[6];
  double? wightTd = sizes[7];
  double? heightTd = sizes[8];
  double? wightHe = sizes[9];
  double? heightHe = sizes[10];
  return [
    Positioned(
      right: edgeInsert + wightHe / 2 + 151,
      top: edgeInsert + heightTd + heightHe * 2 + 255,
      child: Arrow(side: Side.left),
    ),
    Positioned(
      right: edgeInsert + wightHe / 2,
      top: edgeInsert + heightTd + heightHe * 2 + 255,
      child: SizedBox(
        height: 10,
        width: 163,
        child: CustomPaint(
          foregroundPainter: HorizontalStick(),
        ),
      ),
    ),
    Positioned(
      right: edgeInsert + wightHe / 2 - 5,
      top: edgeInsert + heightTd + heightHe + 165,
      child: SizedBox(
        height: 153,
        width: 10,
        child: CustomPaint(
          foregroundPainter: VerticalStick(),
        ),
      ),
    ),
    Positioned(
      right: edgeInsert,
      top: edgeInsert + heightTd + 165,
      child: model.he3,
    ),
    Positioned(
      right: edgeInsert + wightHe * 0.5 - 5,
      top: heightTd + 170,
      child: Arrow(side: Side.down),
    ),
    Positioned(
      right: edgeInsert + wightHe * 0.5 - 5,
      top: heightTd + 80,
      child: SizedBox(
        height: 100,
        width: 10,
        child: CustomPaint(
          foregroundPainter: VerticalStick(),
        ),
      ),
    ),
    Positioned(
      right: edgeInsert + wightHe * 0.5,
      bottom: heightFfr + heightTh + 235,
      child: SizedBox(
        height: 10,
        width: 142 + wightHe * 0.5,
        child: CustomPaint(
          foregroundPainter: HorizontalStick(),
        ),
      ),
    ),
    Positioned(
      right: widthCanvas / 2 - widthFfr / 3,
      bottom: heightFfr + heightTh + heightTh + 65,
      child: SizedBox(
        height: 114,
        width: 10,
        child: CustomPaint(
          foregroundPainter: VerticalStick(),
        ),
      ),
    ),
    Positioned(
      bottom: heightFfr + edgeInsert + heightTh + 48,
      right: widthCanvas / 2 - widthFfr / 2,
      child: model.pu2,
    ),
    Positioned(
      right: widthCanvas / 2 - widthFfr / 3,
      bottom: heightFfr + edgeInsert + heightTh + 37,
      child: Arrow(side: Side.up),
    ),
    Positioned(
      right: widthCanvas / 2 - widthFfr / 3,
      bottom: heightFfr + edgeInsert + heightTh + 27,
      child: SizedBox(
        height: 20,
        width: 10,
        child: CustomPaint(
          foregroundPainter: VerticalStick(),
        ),
      ),
    ),
    Positioned(
      bottom: heightFfr + edgeInsert + 26,
      right: widthCanvas / 2 - widthFfr / 2,
      child: model.th2,
    ),
    Positioned(
      right: widthCanvas / 2 - widthFfr / 3,
      bottom: heightFfr + 30,
      child: Arrow(side: Side.up),
    ),
    Positioned(
      right: widthCanvas / 2 - widthFfr / 3,
      bottom: heightFfr + edgeInsert,
      child: SizedBox(
        height: 20,
        width: 10,
        child: CustomPaint(
          foregroundPainter: VerticalStick(),
        ),
      ),
    ),
  ];
}

List<Positioned> kzoContour(ModelKzo modelKzo) {
  return [
    Positioned(
      top: 60,
      right: 680,
      child: SizedBox(
        height: 90,
        width: 10,
        child: CustomPaint(
          foregroundPainter: VerticalStick(),
        ),
      ),
    ),
    Positioned(
      top: 55,
      right: 510,
      child: SizedBox(
        height: 10,
        width: 174,
        child: CustomPaint(
          foregroundPainter: HorizontalStick(),
        ),
      ),
    ),
    Positioned(
      top: 30,
      right: 450,
      child: modelKzo.pu1,
    ),
    Positioned(
      top: 55,
      right: 439,
      child: Arrow(side: Side.left),
    ),
    Positioned(
      top: 55,
      right: 360,
      child: SizedBox(
        height: 10,
        width: 89,
        child: CustomPaint(
          foregroundPainter: HorizontalStick(),
        ),
      ),
    ),
    Positioned(
      top: 30,
      right: 300,
      child: modelKzo.th1,
    ),
    Positioned(
      top: 55,
      right: 289,
      child: Arrow(side: Side.left),
    ),
    Positioned(
      top: 55,
      right: 100,
      child: SizedBox(
        height: 10,
        width: 199,
        child: CustomPaint(
          foregroundPainter: HorizontalStick(),
        ),
      ),
    ),
    Positioned(
      top: 60,
      right: 95,
      child: SizedBox(
        height: 250,
        width: 10,
        child: CustomPaint(
          foregroundPainter: VerticalStick(),
        ),
      ),
    ),
    Positioned(
      top: 300,
      right: 50,
      child: modelKzo.he4,
    ),
    Positioned(
      bottom: 195,
      right: 95,
      child: Arrow(side: Side.up),
    ),
    Positioned(
      bottom: 29,
      right: 95,
      child: SizedBox(
        height: 178,
        width: 10,
        child: CustomPaint(
          foregroundPainter: VerticalStick(),
        ),
      ),
    ),
    Positioned(
      bottom: 22,
      left: 250,
      child: SizedBox(
        height: 10,
        width: 750,
        child: CustomPaint(
          foregroundPainter: HorizontalStick(),
        ),
      ),
    ),
    Positioned(
      top: 360,
      left: 245,
      child: SizedBox(
        height: 180,
        width: 10,
        child: CustomPaint(
          foregroundPainter: VerticalStick(),
        ),
      ),
    ),
    Positioned(
      top: 300,
      left: 200,
      child: modelKzo.he3,
    ),
    Positioned(
      top: 325,
      left: 189,
      child: Arrow(side: Side.right),
    ),
    Positioned(
      top: 325,
      left: 140,
      child: SizedBox(
        height: 10,
        width: 59,
        child: CustomPaint(
          foregroundPainter: HorizontalStick(),
        ),
      ),
    ),
    Positioned(
      top: 300,
      left: 40,
      child: modelKzo.he2,
    ),
    Positioned(
      top: 289,
      left: 85,
      child: Arrow(side: Side.down),
    ),
    Positioned(
      top: 200,
      left: 85,
      child: SizedBox(
        height: 99,
        width: 10,
        child: CustomPaint(
          foregroundPainter: VerticalStick(),
        ),
      ),
    ),
    Positioned(
      top: 140,
      left: 40,
      child: modelKzo.he1,
    ),
    Positioned(
      top: 165,
      left: 141,
      child: Arrow(side: Side.left),
    ),
    Positioned(
      top: 165,
      left: 140,
      child: SizedBox(
        height: 10,
        width: 225,
        child: CustomPaint(
          foregroundPainter: HorizontalStick(),
        ),
      ),
    ),
    Positioned(
      top: 130,
      left: 365,
      child: modelKzo.lhe,
    ),
    Positioned(
      top: 165,
      left: 466,
      child: Arrow(side: Side.left),
    ),
    Positioned(
      top: 119,
      right: 680,
      child: Arrow(side: Side.down),
    ),
  ];
}
