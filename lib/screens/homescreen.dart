import 'package:flutter/material.dart';
import 'package:tooltip_plotline/widget/custom_button.dart';
import 'package:tooltip_plotline/widget/custom_tooltip.dart';

import '../config/colors/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  CustomToolTip(
                    context: context,
                    message: "high",
                    child: CustomButton(
                      onPressed: () {},
                      text: 'Button 1',
                    ),
                  ),
                  CustomToolTip(
                    context: context,
                    message: "Hello",
                    child: CustomButton(
                      onPressed: () {},
                      text: 'Button 2',
                    ),
                  ),
                ],
              ),
              CustomToolTip(
                context: context,
                width: 100,
                message: "oooooooooooooooooooHelloHelloHelloHelloooooooooooooooooooooooooooooHelloHelloHelloHellooooooooooooooooooooooooooooodasdasd12313123213dadsaNipufdadfasdasdasGandgudads",
                child: CustomButton(
                  onPressed: () {},
                  text: 'Button 3',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomToolTip(
                    context: context,
                    message: "Hello",
                    child: CustomButton(
                      onPressed: () {},
                      text: 'Button 4',
                    ),
                  ),
                  CustomToolTip(
                    context: context,
                    message: "Testing",
                    child: CustomButton(
                      onPressed: () {},
                      text: 'Button 5',
                    ),
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
