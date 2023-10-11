import 'package:flutter/material.dart';

class OneLine extends StatelessWidget {
  const OneLine({super.key, required this.widgets, required this.width});
  final List<Widget> widgets;
  final double width;

  @override
  Widget build(BuildContext context) {
    double childWidth = width / widgets.length;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: widgets
          .map((e) => SizedBox(width: childWidth - 10, child: e))
          .toList(),
    );
  }
}
