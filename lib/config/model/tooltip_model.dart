import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'tooltip_model.g.dart';

@HiveType(typeId: 1)
class CustomToolTipParams {
  @HiveField(0)
  final String message;
  @HiveField(1)
  final String? imageURL;
  @HiveField(2)
  final double? imageRadius;
  @HiveField(3)
  final double textSize;
  @HiveField(4)
  final String textColor;
  @HiveField(5)
  final String bgColor;
  @HiveField(6)
  final double radius;
  @HiveField(7)
  final double width;
  @HiveField(8)
  final EdgeInsets padding;
  @HiveField(9)
  final double arrowWidth;
  @HiveField(10)
  final double arrowHeight;
  @HiveField(11)
  final double? gap;


  CustomToolTipParams( {
    required this.message,
    this.imageURL,
    this.imageRadius,
    this.gap,
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
