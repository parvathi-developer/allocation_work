import 'package:flutter/material.dart';

class MultiColorCircularProgressPainter extends CustomPainter {
  final List<int> values;
  final List<Color> colors;

  MultiColorCircularProgressPainter({
    required this.values,
    required this.colors,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double total = values.fold(0, (a, b) => a + b);
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20.0
      ..strokeCap = StrokeCap.round;

    // Calculate sweep angles first
    List<double> sweepAngles = values.map((v) => (v / total) * 360).toList();

    // Drawing the left side (blue), centered at 180° (left)
    double centerAngle = 180.0;
    paint.color = colors[0];
    canvas.drawArc(
      Rect.fromCircle(center: size.center(Offset.zero), radius: size.width / 2),
      radians(centerAngle - sweepAngles[0] / 2),
      radians(sweepAngles[0]),
      false,
      paint,
    );

    // Drawing the right side (orange and grey), starting from -90° (top)
    double rightStart = -90.0;
    for (int i = 1; i < sweepAngles.length; i++) {
      paint.color = colors[i];
      canvas.drawArc(
        Rect.fromCircle(
          center: size.center(Offset.zero),
          radius: size.width / 2,
        ),
        radians(rightStart),
        radians(sweepAngles[i]),
        false,
        paint,
      );
      rightStart += sweepAngles[i];
    }
  }

  double radians(double degrees) => degrees * (3.141592653589793 / 180);

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
