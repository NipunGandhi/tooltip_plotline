import 'package:flutter/material.dart';
import 'package:tooltip_plotline/config/colors/colors.dart';
import 'package:tooltip_plotline/config/enum/enum.dart';
import 'package:tooltip_plotline/config/utils/measurement.dart';
import 'package:tooltip_plotline/config/utils/position_finder.dart';
import 'package:tooltip_plotline/widget/arrow_painter.dart';
import '../config/model/model.dart';

class CustomToolTip extends StatefulWidget {
  final Widget child;
  final String message;
  final String? imageURL;
  final EdgeInsets? imageRadius;
  final double textSize;
  final Color textColor;
  final Color bgColor;
  final double radius;
  final double width;
  final EdgeInsets padding;
  final Duration showDuration;
  final double arrowWidth;
  final double arrowHeight;
  final BuildContext context;

  CustomToolTip({
    super.key,
    required this.child,
    this.message = "No message given",
    this.width = 200.0,
    this.padding = const EdgeInsets.all(8.0),
    this.showDuration = const Duration(milliseconds: 1500),
    this.textSize = 16,
    this.textColor = Colors.white,
    this.bgColor = Colors.black,
    this.radius = 20,
    this.arrowWidth = 20,
    this.arrowHeight = 20,
    required this.context,
    this.imageURL,
    this.imageRadius,
  }) {
    if (MediaQuery.of(context).size.width < width) {
      throw ("Tooltip's width cannot be more than screens width");
    }
  }

  @override
  State<CustomToolTip> createState() => _CustomToolTipState();
}

class _CustomToolTipState extends State<CustomToolTip> {
  OverlayEntry? _overlayEntry;

  @override
  void dispose() {
    _removeOverlay();
    super.dispose();
  }

  void _showOverlay(BuildContext context) {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);

    ToolTipCoordinates position =
        findPosition(widget.context, offset, renderBox, widget.width);

    _overlayEntry = OverlayEntry(
      builder: (BuildContext context) {
        return Positioned(
          /// If [showAbove] parameter is [true] this means widget should be displayed on top
          /// so for that we will give positioning from bottom
          /// If [showAbove] parameter is [false] this means widget should be displayed on bottom
          /// so for that we will give positioning from top
          top: position.showAbove ? null : position.top,
          bottom: position.showAbove ? position.bottom : null,
          left: position.toolTipAlignment != ToolTipAlignment.right
              ? position.left
              : null,
          right: position.toolTipAlignment == ToolTipAlignment.right
              ? position.right
              : null,
          width: widget.width,
          child: Material(
            type: MaterialType.transparency,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (!position.showAbove)
                  CustomPaint(
                    foregroundPainter: ArrowPainter(
                      showAbove: position.showAbove,
                      object: widget.width,
                      tooltipAlignment: position,
                      width: widget.arrowWidth,
                      height: widget.arrowHeight,
                      color: widget.bgColor,
                    ),
                    child: Container(
                      height: widget.arrowHeight,
                      color: PlotlineColor.background1,
                    ),
                  ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        Measurements().tooltipRadius(position, widget.radius),
                    color: widget.bgColor,
                  ),
                  padding: widget.padding,
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          widget.message,
                          style: TextStyle(
                            fontSize: widget.textSize,
                            color: widget.textColor,
                          ),
                        ),
                      ),
                      if (widget.imageURL?.isNotEmpty == true)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(widget.radius),
                          child: Image.network(widget.imageURL!),
                        ),
                    ],
                  ),
                ),
                if (position.showAbove)
                  CustomPaint(
                    foregroundPainter: ArrowPainter(
                      showAbove: position.showAbove,
                      object: widget.width,
                      tooltipAlignment: position,
                      width: widget.arrowWidth,
                      color: widget.bgColor,
                      height: widget.arrowHeight,
                    ),
                    child: Container(
                      height: widget.arrowHeight,
                      color: PlotlineColor.background1,
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        _showOverlay(context);
        Future.delayed(
          widget.showDuration,
          _removeOverlay,
        );
      },
      child: widget.child,
    );
  }
}
