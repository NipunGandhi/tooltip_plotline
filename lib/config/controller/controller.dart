import 'package:flutter/material.dart';
import 'package:tooltip_plotline/config/model/tooltip_model.dart';

class ListController extends ChangeNotifier {
  Map<String, CustomToolTipParams> map = {
    "Button 1": CustomToolTipParams(
      message: "This is a dummy tooltip message.",
      textSize: 18,
      textColor: "00FF00",
      bgColor: "FF0000",
      radius: 15,
      width: 250.0,
      padding: const EdgeInsets.all(12.0),
      arrowWidth: 25,
      arrowHeight: 25,
    ),
    "Button 2": CustomToolTipParams(
      message: "Button 2 message",
      textSize: 18,
      textColor: "00FF00",
      bgColor: "FF0000",
      radius: 15,
      width: 250.0,
      padding: const EdgeInsets.all(12.0),
      arrowWidth: 25,
      arrowHeight: 25,
    ),
    "Button 3": CustomToolTipParams(
      message: "This is a dummy tooltip message.",
      textSize: 18,
      textColor: "00FF00",
      bgColor: "FF0000",
      radius: 15,
      width: 250.0,
      padding: const EdgeInsets.all(12.0),
      arrowWidth: 25,
      arrowHeight: 25,
    ),
    "Button 4": CustomToolTipParams(
      message: "This is a dummy tooltip message.",
      textSize: 18,
      textColor: "00FF00",
      bgColor: "FF0000",
      radius: 15,
      width: 250.0,
      padding: const EdgeInsets.all(12.0),
      arrowWidth: 25,
      arrowHeight: 25,
    ),
    "Button 5": CustomToolTipParams(
      message: "This is a dummy tooltip message.",
      textSize: 18,
      textColor: "00FF00",
      bgColor: "FF0000",
      radius: 15,
      width: 250.0,
      padding: const EdgeInsets.all(12.0),
      arrowWidth: 25,
      arrowHeight: 25,
    ),
  };
  String buttonSelected = "Button 1";

  void update(){
    notifyListeners();
  }
}
