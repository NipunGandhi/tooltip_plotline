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
    required this.message,
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
  }) {
    if (MediaQuery.of(context).size.width < width) {
      throw ("Tooltip's width cannot be more than screens width");
    }
  }

  @override
  State<CustomToolTip> createState() => _CustomToolTipState();
}

class _CustomToolTipState extends State<CustomToolTip> {
  bool _isVisible = false;
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
                      ClipRRect(
                        borderRadius: BorderRadius.circular(widget.radius),
                        child: Image.network(
                            "data:image/jpeg;base64,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"),
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
    setState(() {
      _isVisible = true;
    });
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    setState(() {
      _isVisible = false;
    });
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
      onTap: () {
        if (_isVisible) {
          _removeOverlay();
        }
      },
      child: widget.child,
    );
  }
}
