import 'package:flutter/material.dart';
import 'package:tooltip_plotline/widget/custom_button.dart';
import 'package:tooltip_plotline/widget/custom_dropdown.dart';
import 'package:tooltip_plotline/widget/custom_textfield.dart';

class RenderScreen extends StatelessWidget {
  RenderScreen({super.key});
  final String selectedTarget = 'Button 1';
  final TextEditingController textEditingController = TextEditingController();
  final TextEditingController textSizeController = TextEditingController();
  final TextEditingController paddingController = TextEditingController();
  final TextEditingController textColorController = TextEditingController();
  final TextEditingController bgColorController = TextEditingController();
  final TextEditingController cornerRadiusController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 36.0, horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Dropdown for selecting the target element
                BuildDropDown(
                    label: 'Target Element', selectedTarget: selectedTarget),

                // Text field for tooltip text
                BuildTextField(
                    label: 'Tooltip Text', controller: textEditingController),

                // Text field for text size
                BuildTextField(
                    label: 'Text Size', controller: textSizeController),

                // Text field for padding
                BuildTextField(label: 'Padding', controller: paddingController),

                // Text field for text color
                BuildTextField(
                    label: 'Text Color', controller: textColorController),

                // Text field for background color
                BuildTextField(
                    label: 'Background Color', controller: bgColorController),

                // Text field for corner radius
                BuildTextField(
                    label: 'Corner Radius', controller: cornerRadiusController),

                // Submit button
                CustomButton(
                  width: 40,
                  color: Colors.blue,
                  onPressed: () {
                    final String tooltipText = textEditingController.text;
                    final double textSize =
                        double.tryParse(textSizeController.text) ?? 16.0;
                    final double padding =
                        double.tryParse(paddingController.text) ?? 8.0;
                    final Color textColor = getColor(textColorController.text);
                    final Color bgColor = getColor(bgColorController.text);
                    final double cornerRadius =
                        double.tryParse(cornerRadiusController.text) ?? 0.0;

                    // Do something with the values, e.g., show a tooltip
                    // For demonstration, we will print the values here
                    print('Selected Target: $selectedTarget');
                    print('Tooltip Text: $tooltipText');
                    print('Text Size: $textSize');
                    print('Padding: $padding');
                    print('Text Color: $textColor');
                    print('Background Color: $bgColor');
                    print('Corner Radius: $cornerRadius');
                  },
                  text: 'Submit',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color getColor(String colorHex) {
    try {
      return Color(int.parse(colorHex.replaceAll("#", "0xFF")));
    } catch (e) {
      return Colors.black;
    }
  }
}
