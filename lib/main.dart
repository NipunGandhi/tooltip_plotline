import 'package:flutter/material.dart';
import 'package:tooltip_plotline/screens/render_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RenderScreen(),
    );
  }
}
