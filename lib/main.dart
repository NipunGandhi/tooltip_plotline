import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tooltip_plotline/config/controller/controller.dart';
import 'package:tooltip_plotline/config/model/edge_inset_adapter.dart';
import 'package:tooltip_plotline/config/model/tooltip_model.dart';
import 'package:tooltip_plotline/screens/render_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CustomToolTipParamsAdapter());
  Hive.registerAdapter(ColorAdapter());
  Hive.registerAdapter(EdgeInsetsAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> ListController())
      ],
      child: const MaterialApp(
        home: RenderScreen(),
      ),
    );
  }
}

