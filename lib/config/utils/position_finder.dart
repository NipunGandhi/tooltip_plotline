import 'package:flutter/material.dart';
import 'package:tooltip_plotline/config/utils/alignment_finder.dart';
import 'package:tooltip_plotline/config/enum/enum.dart';
import 'package:tooltip_plotline/config/model/model.dart';

ToolTipCoordinates findPosition(BuildContext context, Offset offset,
    RenderBox renderBox, double toolTipWidth) {
  double widgetStartingX = offset.dx;
  double widgetStartingY = offset.dy;
  double widgetWidth = renderBox.size.width;
  double widgetHeight = renderBox.size.height;

  /// Screen Height and Width
  final double screenHeight = MediaQuery.of(context).size.height;
  final double screenWidth = MediaQuery.of(context).size.width;

  /// Calculates the above and bottom screen size
  final double bottomSpace = (screenHeight) -
      widgetStartingY -
      (widgetHeight / 2) -
      MediaQuery.of(context).padding.bottom;
  final double aboveSpace =
      widgetStartingY - MediaQuery.of(context).padding.top + (widgetHeight / 2);

  /// One with more height will be selected
  final bool showAbove = bottomSpace < aboveSpace;

  /// Self made function to find alignment Type of tooltip
  ToolTipAlignment alignment =
  alignmentFinder(offset, toolTipWidth, screenWidth, widgetWidth);

  double top = widgetStartingY + widgetHeight;
  double left = widgetStartingX;
  double bottom = screenHeight - widgetStartingY;
  double right = screenWidth - widgetStartingX - widgetWidth;

  if (alignment == ToolTipAlignment.center || widgetWidth >= toolTipWidth) {
    var difference = (toolTipWidth - widgetWidth) / 2;
    left = widgetStartingX - difference;
  }

  return ToolTipCoordinates(
    showAbove: showAbove,
    top: top,
    bottom: bottom,
    left: left,
    right: right,
    toolTipAlignment: alignment,
  );
}
