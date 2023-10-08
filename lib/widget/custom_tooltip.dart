import 'package:flutter/material.dart';

class CustomToolTip extends StatefulWidget {
  final Widget child;
  final String message;
  final double maxWidth;
  final EdgeInsets padding;
  final Duration showDuration;

  const CustomToolTip({
    super.key,
    required this.child,
    required this.message,
    this.maxWidth = 200.0,
    this.padding = const EdgeInsets.all(8.0),
    this.showDuration = const Duration(milliseconds: 1500),
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

    _overlayEntry = OverlayEntry(
      builder: (BuildContext context) {
        return Positioned(
          top: offset.dy + renderBox.size.height + 8.0,
          left: offset.dx - (widget.maxWidth - renderBox.size.width) / 2,
          width: widget.maxWidth,
          child: Material(
            elevation: 4,
            child: Padding(
              padding: widget.padding,
              child: Text(
                widget.message,
                style: const TextStyle(fontSize: 16),
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
