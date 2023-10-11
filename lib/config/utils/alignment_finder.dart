import 'package:flutter/material.dart';
import 'package:tooltip_plotline/config/enum/enum.dart';

//TODO: Check logic if tooltip is smaller
ToolTipAlignment alignmentFinder(Offset offset, double toolTipWidth,
    double screenWidth, double widgetWidth) {
  var difference = (toolTipWidth - widgetWidth) / 2;

  if ((offset.dx >= difference &&
      screenWidth - offset.dx - widgetWidth >= difference) || widgetWidth >= toolTipWidth) {
    // print(ToolTipAlignment.center);
    return ToolTipAlignment.center;
  } else if (offset.dx - toolTipWidth / 2 <= 0) {
    // print(ToolTipAlignment.left);
    return ToolTipAlignment.left;
  } else {
    return ToolTipAlignment.right;
  }
}
