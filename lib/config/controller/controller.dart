import 'package:flutter/material.dart';
import 'package:tooltip_plotline/config/model/tooltip_model.dart';

class ListController extends ChangeNotifier {
  Map<String, CustomToolTipParams> map = {
    "Button 1": CustomToolTipParams(
      message: "This is a dummy tooltip message.",
      textSize: 18,
      textColor: "FFFFFF",
      bgColor: "000000",
      radius: 15,
      width: 250.0,
      padding: const EdgeInsets.all(12.0),
      arrowWidth: 25,
      arrowHeight: 25,
      imageRadius: 15,
      imageURL:
          'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80',
      gap: 10,
    ),
    "Button 2": CustomToolTipParams(
      message: "Button 2 message",
      textSize: 18,
      textColor: "FFFFFF",
      bgColor: "000000",
      radius: 15,
      width: 250.0,
      padding: const EdgeInsets.all(12.0),
      arrowWidth: 25,
      imageRadius: 15,
      imageURL:
          'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80',
      gap: 10,
      arrowHeight: 25,
    ),
    "Button 3": CustomToolTipParams(
      message: "This is a dummy tooltip message.",
      textSize: 18,
      textColor: "FFFFFF",
      bgColor: "000000",
      radius: 15,
      width: 250.0,
      padding: const EdgeInsets.all(12.0),
      arrowWidth: 25,
      arrowHeight: 25,
      imageRadius: 15,
      imageURL:
          'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80',
      gap: 10,
    ),
    "Button 4": CustomToolTipParams(
      message: "This is a dummy tooltip message.",
      textSize: 18,
      textColor: "FFFFFF",
      bgColor: "000000",
      radius: 15,
      width: 250.0,
      padding: const EdgeInsets.all(12.0),
      arrowWidth: 25,
      arrowHeight: 25,
      imageRadius: 15,
      imageURL:
          'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80',
      gap: 10,
    ),
    "Button 5": CustomToolTipParams(
      message: "This is a dummy tooltip message.",
      textSize: 18,
      textColor: "FFFFFF",
      bgColor: "000000",
      radius: 15,
      width: 250.0,
      padding: const EdgeInsets.all(12.0),
      arrowWidth: 25,
      arrowHeight: 25,
      imageRadius: 15,
      imageURL:
          'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80',
      gap: 10,
    ),
  };
  String buttonSelected = "Button 1";

  void update() {
    notifyListeners();
  }
}
