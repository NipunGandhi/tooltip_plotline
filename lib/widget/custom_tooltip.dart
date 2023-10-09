import 'package:flutter/material.dart';
import 'package:tooltip_plotline/config/enum.dart';
import '../config/model.dart';
import '../config/utils.dart';

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
    this.width = 400.0,
    this.padding = const EdgeInsets.all(8.0),
    this.showDuration = const Duration(milliseconds: 1500),
    this.textSize = 16,
    this.textColor = Colors.white,
    this.bgColor = Colors.black,
    this.radius = 3,
    this.arrowWidth = 3,
    this.arrowHeight = 3,
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
          top: position.showAbove ? null : position.top,
          left: position.toolTipAlignment == ToolTipAlignment.left
              ? position.left
              : null,
          right: position.toolTipAlignment == ToolTipAlignment.right
              ? position.right
              : null,
          bottom: position.showAbove ? position.bottom : null,
          width: widget.width,
          child: Material(
            elevation: 4,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(widget.radius),
                color: widget.bgColor,
              ),
              padding: widget.padding,
              child: Text(
                widget.message,
                style: TextStyle(
                  fontSize: widget.textSize,
                  color: widget.textColor,
                ),
              ),
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
