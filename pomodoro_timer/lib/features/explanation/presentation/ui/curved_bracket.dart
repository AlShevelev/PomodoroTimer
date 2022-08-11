import 'package:flutter/material.dart';
import 'package:pomodoro_timer/core/ui_kit/style/colors.dart';

class CurvedBracket extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // A debugging background (to show the borders)
    //_debugBackground(canvas, size);

    final paint = Paint()
      ..color = AppColors.darkGreen
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final halfWidth = size.width / 2;
    final halfHeight = size.height / 2;

    final curvatureDegree = size.height / 20.0;

    // The top-left curve
    const a1 = Offset(0.0, 0.0);
    final b1 = Offset(halfHeight, halfHeight);
    final c1 = Offset(curvatureDegree, halfHeight - curvatureDegree);
    final d1 = c1;
    _drawCurve(a1, b1, c1, d1, canvas, paint);

    // The top-right curve
    final a2 = Offset(size.width, 0.0);
    final b2 = Offset(a2.dx - halfHeight, halfHeight);
    final c2 = Offset(a2.dx - curvatureDegree, halfHeight - curvatureDegree);
    final d2 = c2;
    _drawCurve(a2, b2, c2, d2, canvas, paint);

    // The bottom-left curve
    final a3 = Offset(halfWidth - halfHeight, halfHeight);
    final b3 = Offset(halfWidth, size.height);
    final c3 = Offset(b3.dx - curvatureDegree, a3.dy + curvatureDegree);
    final d3 = c3;
    _drawCurve(a3, b3, c3, d3, canvas, paint);

    // The bottom-right curve
    final a4 = Offset(halfWidth + halfHeight, halfHeight);
    final b4 = b3;
    final c4 = Offset(b3.dx + curvatureDegree, a3.dy + curvatureDegree);
    final d4 = c4;
    _drawCurve(a4, b4, c4, d4, canvas, paint);

    // lines
    canvas.drawLine(b1, a3, paint);
    canvas.drawLine(b2, a4, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  void _debugBackground(Canvas canvas, Size size) {
    final paint = Paint()..color = AppColors.red;

    final rect = Rect.fromLTRB(0, 0, size.width, size.height);

    canvas.drawRect(rect, paint);
  }

  void _drawCurve(Offset a, Offset b, Offset c, Offset d, Canvas canvas, Paint paint) {
    final curve = Path()
      ..moveTo(a.dx, a.dy)
      ..relativeCubicTo(
        c.dx - a.dx,
        c.dy - a.dy,
        d.dx - a.dx,
        d.dy - a.dy,
        b.dx - a.dx,
        b.dy - a.dy,
      );

    canvas.drawPath(curve, paint);
  }
}
