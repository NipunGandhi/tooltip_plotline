import 'package:flutter/material.dart';

void findPosition(BuildContext context, Offset offset, RenderBox renderBox) {
  final double screenHeight = MediaQuery.of(context).size.height;
  final double bottomSpace = (screenHeight) - offset.dy - (renderBox.size.height / 2) - MediaQuery.of(context).padding.bottom;
  final double aboveSpace = offset.dy - MediaQuery.of(context).padding.top + (renderBox.size.height / 2);
  final bool showAbove = bottomSpace < aboveSpace;
}