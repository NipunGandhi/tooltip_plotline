import 'package:tooltip_plotline/config/enum/enum.dart';

class ToolTipCoordinates {
  final bool showAbove;
  final ToolTipAlignment toolTipAlignment;
  final double top;
  final double bottom;
  final double left;
  final double aboveSpace;
  final double bottomSpace;
  final double right;

  ToolTipCoordinates({
    required this.showAbove,
    required this.top,
    required this.bottom,
    required this.left,
    required this.right,
    required this.toolTipAlignment,
    required this.bottomSpace,
    required this.aboveSpace,
  });
}
