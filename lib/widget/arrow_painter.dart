import 'package:flutter/material.dart';

class ArrowPainter extends CustomPainter {
  final bool showAbove;
  final Color color;

  ArrowPainter({
    this.showAbove = false,
    this.color = Colors.black,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    final path = Path();

    if (showAbove) {
      path.moveTo(size.width / 2 - 20, 0);
      path.lineTo(size.width / 2 + 20, 0);
      path.lineTo(size.width / 2, 20);
    } else {
      path.moveTo(size.width / 2 - 20, size.height);
      path.lineTo(size.width / 2 + 20, size.height);
      path.lineTo(size.width / 2, size.height - 20);
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
