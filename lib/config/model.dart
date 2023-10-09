import 'package:tooltip_plotline/config/enum.dart';

class ToolTipCoordinates {
  final bool showAbove;
  final ToolTipAlignment toolTipAlignment;
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;

  ToolTipCoordinates({
    this.showAbove = false,
    this.top,
    this.bottom,
    this.left,
    this.right,
    this.toolTipAlignment = ToolTipAlignment.center,
  });
}
