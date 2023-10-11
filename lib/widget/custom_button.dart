import 'package:flutter/material.dart';
import 'package:tooltip_plotline/config/colors/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final Color? color;
  final Color? fontColor;
  final double? height;
  final double? width;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final TextStyle? textStyle;
  const CustomButton({
    required this.text,
    required this.onPressed,
    this.color,
    this.fontColor,
    this.height,
    this.width,
    this.padding,
    this.margin,
    this.textStyle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            color: color ?? PlotlineColor.background2,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          height: height,
          width: width,
          padding: padding ?? const EdgeInsets.all(15),
          margin: margin,
          child: Center(
            child: Text(
              text,
              style: textStyle != null
                  ? textStyle!.copyWith(color: fontColor ?? PlotlineColor.darkFont1)
                  : Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: fontColor ?? PlotlineColor.darkFont1),
            ),
          ),
        ),
      ),
    );
  }
}