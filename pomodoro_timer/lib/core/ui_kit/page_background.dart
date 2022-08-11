import 'dart:math';
import 'package:flutter/material.dart';
import 'package:pomodoro_timer/core/ui_kit/style/colors.dart';

class PageBackground extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    const color = AppColors.brown;

    final secondRingInnerRadius = size.width * 0.322;

    _drawRing(
      outerRadius: size.width * 0.45,
      innerRadius: size.width * 0.416,
      center,
      color,
      canvas,
    );

    _drawRing(
      outerRadius: size.width * 0.35,
      innerRadius: secondRingInnerRadius,
      center,
      color,
      canvas,
    );

    _drawClock(
      color,
      canvas,
      center,
      distantFromCenter: secondRingInnerRadius,
      len: size.width * 0.12,
      width: size.width * 0.01946,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  void _drawRing(
    Offset center,
    Color color,
    Canvas canvas, {
    required double outerRadius,
    required double innerRadius,
  }) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = outerRadius - innerRadius
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, (outerRadius + innerRadius) / 2, paint);
  }

  void _drawClock(
    Color color,
    Canvas canvas,
    Offset center, {
    required double distantFromCenter,
    required double len,
    required double width,
  }) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = width
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final start = Offset(0, -distantFromCenter);
    final end = Offset(0, -distantFromCenter + len);

    canvas.save();
    canvas.translate(center.dx, center.dy);

    const rotationAngle = 30.0 / 180.0 * pi;

    for (var i = 0; i < 12; i++) {
      canvas.rotate(rotationAngle);
      canvas.drawLine(start, end, paint);
    }

    canvas.translate(-center.dx, -center.dy);
    canvas.restore();
  }
}
