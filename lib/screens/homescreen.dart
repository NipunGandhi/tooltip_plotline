import 'package:flutter/material.dart';
import 'package:tooltip_plotline/widget/custom_button.dart';
import 'package:tooltip_plotline/widget/custom_tooltip.dart';

import '../config/colors.dart';

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
                  message: "high",
                  child: CustomButton(
                    onPressed: () {},
                    text: 'Button 1',
                  ),
                ),
                CustomToolTip(
                  message: "Hello",
                  child: CustomButton(
                    onPressed: () {},
                    text: 'Button 2',
                  ),
                ),
              ],
            ),
            CustomToolTip(
              message: "Hello",
              child: CustomButton(
                onPressed: () {},
                text: 'Button 3',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomToolTip(
                  message: "Hello",
                  child: CustomButton(
                    onPressed: () {},
                    text: 'Button 4',
                  ),
                ),
                CustomToolTip(
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
