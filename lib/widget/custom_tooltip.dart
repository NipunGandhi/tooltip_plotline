import 'package:flutter/material.dart';

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

  const CustomToolTip({
    super.key,
    required this.child,
    required this.message,
    this.width = 100.0,
    this.padding = const EdgeInsets.all(8.0),
    this.showDuration = const Duration(milliseconds: 1500),
    this.textSize = 16,
    this.textColor = Colors.white,
    this.bgColor = Colors.black,
    this.radius = 3,
    this.arrowWidth = 3,
    this.arrowHeight = 3,
  });

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

    final double screenHeight = MediaQuery.of(context).size.height;
    final double bottomSpace = (screenHeight) - offset.dy - (renderBox.size.height / 2);

    // TODO: Make it dynamic
    // 38.85714 is height of status bar
    final double aboveSpace = offset.dy - 38.857142857142854 + (renderBox.size.height / 2);
    final bool showAbove = bottomSpace < aboveSpace;


    _overlayEntry = OverlayEntry(
      builder: (BuildContext context) {
        return Positioned(
          width: widget.width,
          child: Material(
            elevation: 4,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(widget.radius),
                color: widget.bgColor,
              ),
              padding: widget.padding,
              child: Center(
                child: Text(
                  widget.message,
                  style: TextStyle(
                    fontSize: widget.textSize,
                    color: widget.textColor,
                  ),
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
