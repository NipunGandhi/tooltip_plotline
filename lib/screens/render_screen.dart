import 'package:flutter/material.dart';
import 'package:tooltip_plotline/config/colors/colors.dart';
import 'package:tooltip_plotline/widget/custom_button.dart';
import 'package:tooltip_plotline/widget/custom_dropdown.dart';
import 'package:tooltip_plotline/widget/custom_textfield.dart';
import 'package:tooltip_plotline/widget/oneline_converter.dart';

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
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 36.0, horizontal: 24),
            child: LayoutBuilder(builder: (context, constraint) {
              return Column(
                children: [
                  BuildDropDown(
                      label: 'Target Element', selectedTarget: selectedTarget),
                  BuildTextField(
                      label: 'Tooltip Text', controller: textEditingController),
                  OneLine(
                    width: constraint.maxWidth,
                    widgets: [
                      BuildTextField(
                          label: 'Text Size', controller: textSizeController),
                      BuildTextField(
                          label: 'Padding', controller: paddingController),
                    ],
                  ),
                  BuildTextField(
                      label: 'Text Color', controller: textColorController),
                  BuildTextField(
                      label: 'Background Color', controller: bgColorController),
                  OneLine(
                    width: constraint.maxWidth,
                    widgets: [
                      BuildTextField(
                          label: 'Corner Radius',
                          controller: cornerRadiusController),
                      BuildTextField(
                          label: 'Tooltip Width',
                          controller: cornerRadiusController),
                    ],
                  ),
                  OneLine(
                    width: constraint.maxWidth,
                    widgets: [
                      BuildTextField(
                          label: 'Arrow Height',
                          controller: cornerRadiusController),
                      BuildTextField(
                          label: 'Arrow Width',
                          controller: cornerRadiusController),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                        color: Colors.blue,
                        onPressed: () {
                          final String tooltipText = textEditingController.text;
                          final double textSize =
                              double.tryParse(textSizeController.text) ?? 16.0;
                          final double padding =
                              double.tryParse(paddingController.text) ?? 8.0;
                          final Color textColor =
                              getColor(textColorController.text);
                          final Color bgColor =
                              getColor(bgColorController.text);
                          final double cornerRadius =
                              double.tryParse(cornerRadiusController.text) ??
                                  0.0;

                          print('Selected Target: $selectedTarget');
                          print('Tooltip Text: $tooltipText');
                          print('Text Size: $textSize');
                          print('Padding: $padding');
                          print('Text Color: $textColor');
                          print('Background Color: $bgColor');
                          print('Corner Radius: $cornerRadius');
                        },
                        text: 'Render Tooltip',
                        fontColor: PlotlineColor.lightFont1,
                      ),
                    ],
                  ),
                ],
              );
            }),
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
