import 'package:flutter/material.dart';
import 'package:tooltip_plotline/config/enum/enum.dart';
import 'package:tooltip_plotline/config/model/model.dart';

class Measurements {
  BorderRadius tooltipRadius(ToolTipCoordinates position, double radius) {
    return BorderRadius.only(
      topLeft: !position.showAbove &&
          position.toolTipAlignment == ToolTipAlignment.left
          ? Radius.zero
          : Radius.circular(radius),
      topRight: !position.showAbove &&
          position.toolTipAlignment == ToolTipAlignment.right
          ? Radius.zero
          : Radius.circular(radius),
      bottomLeft: position.showAbove &&
          position.toolTipAlignment == ToolTipAlignment.left
          ? Radius.zero
          : Radius.circular(radius),
      bottomRight: position.showAbove &&
          position.toolTipAlignment == ToolTipAlignment.right
          ? Radius.zero
          : Radius.circular(radius),
    );
  }
}