import 'package:flutter/material.dart';
import 'package:tooltip_plotline/config/enum.dart';
import 'package:tooltip_plotline/config/model.dart';

ToolTipCoordinates findPosition(BuildContext context, Offset offset,
    RenderBox renderBox, double toolTipWidth) {
  double widgetStartingX = offset.dx;
  double widgetStartingY = offset.dy;

  /// Screen Height and Width
  final double screenHeight = MediaQuery.of(context).size.height;
  final double screenWidth = MediaQuery.of(context).size.width;

  ToolTipAlignment alignment;

  /// Calculates the above and bottom screen size
  final double bottomSpace = (screenHeight) -
      widgetStartingY -
      (renderBox.size.height / 2) -
      MediaQuery.of(context).padding.bottom;
  final double aboveSpace = widgetStartingY -
      MediaQuery.of(context).padding.top +
      (renderBox.size.height / 2);

  /// One with more height will be selected
  final bool showAbove = bottomSpace < aboveSpace;

  if (offset.dx - toolTipWidth / 2 >= 0 &&
      offset.dx + toolTipWidth / 2 <= screenWidth) {
    alignment = ToolTipAlignment.center;
  } else if (offset.dx - toolTipWidth / 2 < 0) {
    alignment = ToolTipAlignment.left;
  } else if (offset.dx + toolTipWidth / 2 > screenWidth) {
    alignment = ToolTipAlignment.right;
  } else {
    alignment = ToolTipAlignment.center;
  }

  double top = widgetStartingY + renderBox.size.height;
  double left = widgetStartingX;
  double bottom = screenHeight - widgetStartingY;
  double right = screenWidth - widgetStartingX - renderBox.size.width;

  return ToolTipCoordinates(
    showAbove: showAbove,
    top: top,
    bottom: bottom,
    left: left,
    right: right,
    toolTipAlignment: alignment,
  );
}
