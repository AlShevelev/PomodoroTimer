import 'dart:math';
import 'package:flutter/material.dart';
import 'package:pomodoro_timer/core/ui_kit/style/colors.dart';

class VerticalArrow extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // A debugging background (to show the borders)
    //_debugBackground(canvas, size);

    final paint = Paint()
      ..color = AppColors.darkGreen
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // The main curve
    final xOffset = size.width * 0.3;
    final yOffset = size.height * 0.075;

    final xA = size.width - xOffset;
    final yA = yOffset;

    final xB = xA;
    final yB = size.height - yOffset;

    const xC = 0;
    final yC = yOffset;

    const xD = 0;
    final yD = size.height - yOffset;

    final curve = Path()
      ..moveTo(xA, yA)
      ..relativeCubicTo(
        xC - xA,
        yC - yA,
        xD - xA,
        yD - yA,
        xB - xA,
        yB - yA,
      );

    canvas.drawPath(curve, paint);

    // The arrow point
    canvas.save();
    canvas.translate(xA, yA);
    const rotationAngle = -75.0 / 180.0 * pi;

    final lineEnd = Offset(-size.width * 0.25, -size.height * 0.01);
    canvas.drawLine(const Offset(0, 0), lineEnd, paint);

    canvas.rotate(rotationAngle);
    canvas.drawLine(const Offset(0, 0), lineEnd, paint);

    canvas.translate(-xA, -yA);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  void _debugBackground(Canvas canvas, Size size) {
    final paint = Paint()..color = AppColors.red;

    final rect = Rect.fromLTRB(0, 0, size.width, size.height);

    canvas.drawRect(rect, paint);
  }
}
