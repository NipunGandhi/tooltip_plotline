import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tooltip_plotline/config/controller/controller.dart';
import 'package:tooltip_plotline/screens/render_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ListController>(create: (_) => ListController()),
      ],
      child: MaterialApp(
        home: RenderScreen(),
      ),
    );
  }
}

