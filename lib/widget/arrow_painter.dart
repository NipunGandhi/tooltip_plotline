import 'package:flutter/material.dart';
import 'package:tooltip_plotline/config/enum/enum.dart';
import 'package:tooltip_plotline/config/model/model.dart';

class ArrowPainter extends CustomPainter {
  final bool showAbove;
  final Color color;
  final double object;
  final ToolTipCoordinates tooltipAlignment;
  final double height;
  final double width;

  ArrowPainter({
    required this.height,
    required this.width,
    required this.object,
    required this.tooltipAlignment,
    this.showAbove = false,
    this.color = Colors.black,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double starting = 0;
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    final path = Path();

    if (tooltipAlignment.toolTipAlignment == ToolTipAlignment.right) {
      starting += object - width;
    }
    if (tooltipAlignment.toolTipAlignment == ToolTipAlignment.center) {
      starting += object/2 - width/2;
    }

    if (showAbove) {
      /// When we have to present tooltip on top
      path.moveTo(starting + 0, 0);
      path.lineTo(starting + width, 0);
      path.lineTo(starting + (width / 2), height);
    } else {
      path.moveTo(starting + 0, height);
      path.lineTo(starting + width, height);
      path.lineTo(starting + width / 2, 0);
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
