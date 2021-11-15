import 'package:flutter/material.dart';
import 'arrows.dart';

class RecSides extends StatelessWidget {
  RecSides({
    Key? key,
    double height = 50,
    double width = 50,
    double recX = 20,
    double recY = 20,
  })  : _height = height,
        _width = width,
        _recX = recX,
        _recY = recY,
        super(key: key);

  final double _height;
  final double _width;
  final double _recX;
  final double _recY;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[50],
      height: _height,
      width: _width,
      child: Stack(children: [
        Positioned(
          top: _recY,
          left: _recY,
          child: Container(
            height: _height - _recY,
            width: _width - _recX,
            child: CustomPaint(
              foregroundPainter: UpLeft(),
            ),
          ),
        ),
        Positioned(
          top: _recY / 2,
          child: Arrow(side: Side.left),
        )
      ]),
    );
  }
}

class UpRight extends CustomPainter {
  UpRight({
    double strokeWidth = 5,
  }) : _strokeWidth = strokeWidth;

  final double _strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = _strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(
      Offset(
        size.width,
        size.height,
      ),
      Offset(
        size.width,
        0,
      ),
      paint,
    );

    canvas.drawLine(
      Offset(
        size.width,
        0,
      ),
      const Offset(
        0,
        0,
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class UpLeft extends CustomPainter {
  UpLeft({
    double strokeWidth = 5,
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
        size.height,
      ),
      const Offset(
        0,
        0,
      ),
      paint,
    );

    canvas.drawLine(
      Offset(
        size.width,
        0,
      ),
      const Offset(
        0,
        0,
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
