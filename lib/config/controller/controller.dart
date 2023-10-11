import 'package:flutter/material.dart';
import 'package:tooltip_plotline/config/model/tooltip_model.dart';

class ListController extends ChangeNotifier {
  Map<String, CustomToolTipParams> map = {};
  String buttonSelected = "Button 1";
}
