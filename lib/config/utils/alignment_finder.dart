import 'package:flutter/material.dart';
import 'package:tooltip_plotline/config/enum/enum.dart';

ToolTipAlignment alignmentFinder(
    Offset offset, double toolTipWidth, double screenWidth) {
  if (offset.dx - toolTipWidth / 2 >= 0 &&
      offset.dx + toolTipWidth / 2 <= screenWidth) {
    return ToolTipAlignment.center;
  } else if (offset.dx - toolTipWidth / 2 < 0) {
    return ToolTipAlignment.left;
  } else if (offset.dx + toolTipWidth / 2 > screenWidth) {
    return ToolTipAlignment.right;
  } else {
    return ToolTipAlignment.center;
  }
}
