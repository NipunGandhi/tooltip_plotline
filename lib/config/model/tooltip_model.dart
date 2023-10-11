import 'package:flutter/material.dart';

class CustomToolTipParams {
  final String message;
  final String? imageURL;
  final EdgeInsets? imageRadius;
  final double textSize;
  final Color textColor;
  final Color bgColor;
  final double radius;
  final double width;
  final EdgeInsets padding;
  final double arrowWidth;
  final double arrowHeight;

  CustomToolTipParams({
    required this.message,
    this.imageURL,
    this.imageRadius,
    required this.width,
    required this.padding,
    required this.textSize,
    required this.textColor,
    required this.bgColor,
    required this.radius,
    required this.arrowWidth,
    required this.arrowHeight,
  });
}