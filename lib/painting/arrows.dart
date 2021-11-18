import 'package:flutter/material.dart';

enum Side {
  up,
  down,
  right,
  left,
}

class Arrow extends StatelessWidget {
  Arrow({
    Key? key,
    required this.side,
    double? height = 10,
    double? width = 10,
    double strokeWidth = 3,
  })  : _strokeWidth = strokeWidth,
        _height = height,
        _width = width,
        super(key: key);

  final Side side;
  final double? _height;
  final double? _width;
  final double _strokeWidth;

  @override
  Widget build(BuildContext context) {
    switch (side) {
      case Side.up:
        return SizedBox(
          height: _height,
          width: _width,
          child: CustomPaint(
            foregroundPainter: UpArrow(strokeWidth: _strokeWidth),
          ),
        );
      case Side.down:
        return SizedBox(
          height: _height,
          width: _width,
          child: CustomPaint(
            foregroundPainter: BottomArrow(strokeWidth: _strokeWidth),
          ),
        );
      case Side.right:
        return SizedBox(
          height: _height,
          width: _width,
          child: CustomPaint(
            foregroundPainter: RightArrow(strokeWidth: _strokeWidth),
          ),
        );
      case Side.left:
        return SizedBox(
          height: _height,
          width: _width,
          child: CustomPaint(
            foregroundPainter: LeftArrow(strokeWidth: _strokeWidth),
          ),
        );
    }
  }
}

class RightArrow extends CustomPainter {
  RightArrow({
    double strokeWidth = 5,
  }) : _strokeWidth = strokeWidth;

  final double _strokeWidth;
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = _strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(
      const Offset(
        0,
        0,
      ),
      Offset(
        size.width,
        size.height / 2,
      ),
      paint,
    );

    canvas.drawLine(
      Offset(
        0,
        size.height,
      ),
      Offset(
        size.width,
        size.height / 2,
      ),
      paint,
    );

    canvas.drawLine(
      Offset(
        size.width,
        size.height / 2,
      ),
      Offset(
        0,
        size.height / 2,
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class LeftArrow extends CustomPainter {
  LeftArrow({
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
        0,
      ),
      Offset(
        0,
        size.height / 2,
      ),
      paint,
    );

    canvas.drawLine(
      Offset(
        0,
        size.height / 2,
      ),
      Offset(
        size.width,
        size.height,
      ),
      paint,
    );

    canvas.drawLine(
      Offset(
        size.width,
        size.height / 2,
      ),
      Offset(
        0,
        size.height / 2,
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class UpArrow extends CustomPainter {
  UpArrow({
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
      Offset(
        size.width / 2,
        0,
      ),
      paint,
    );

    canvas.drawLine(
      Offset(
        size.width / 2,
        0,
      ),
      Offset(
        size.width,
        size.height,
      ),
      paint,
    );

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

class BottomArrow extends CustomPainter {
  BottomArrow({
    double strokeWidth = 5,
  }) : _strokeWidth = strokeWidth;

  final double _strokeWidth;
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = _strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(
      const Offset(
        0,
        0,
      ),
      Offset(
        size.width / 2,
        size.height,
      ),
      paint,
    );

    canvas.drawLine(
      Offset(
        size.width,
        0,
      ),
      Offset(
        size.width / 2,
        size.height,
      ),
      paint,
    );

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
