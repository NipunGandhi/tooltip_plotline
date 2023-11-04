import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tooltip_plotline/config/controller/controller.dart';
import 'package:tooltip_plotline/widget/button_tooltip.dart';
import '../config/colors/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ListController listController =
        Provider.of<ListController>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        backgroundColor: PlotlineColor.background1,
        body: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CreateCustomToolTip(
                    buttonKey: 'Button 1',
                    params: listController.map['Button 1']!,
                    rootContext: context,
                  ),
                  CreateCustomToolTip(
                    buttonKey: 'Button 2',
                    params: listController.map['Button 2']!,
                    rootContext: context,
                  ),
                ],
              ),
              CreateCustomToolTip(
                buttonKey: 'Button 3',
                params: listController.map['Button 3']!,
                rootContext: context,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CreateCustomToolTip(
                    buttonKey: 'Button 4',
                    params: listController.map['Button 4']!,
                    rootContext: context,
                  ),
                  CreateCustomToolTip(
                    buttonKey: 'Button 5',
                    params: listController.map['Button 5']!,
                    rootContext: context,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
