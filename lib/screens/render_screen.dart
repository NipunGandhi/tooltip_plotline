import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tooltip_plotline/config/colors/colors.dart';
import 'package:tooltip_plotline/config/controller/controller.dart';
import 'package:tooltip_plotline/config/model/tooltip_model.dart';
import 'package:tooltip_plotline/widget/custom_button.dart';
import 'package:tooltip_plotline/widget/custom_dropdown.dart';
import 'package:tooltip_plotline/widget/custom_textfield.dart';
import 'package:tooltip_plotline/widget/oneline_converter.dart';

class RenderScreen extends StatelessWidget {
  RenderScreen({super.key});
  final TextEditingController textEditingController = TextEditingController();
  final TextEditingController textSizeController = TextEditingController();
  final TextEditingController paddingController = TextEditingController();
  final TextEditingController textColorController = TextEditingController();
  final TextEditingController bgColorController = TextEditingController();
  final TextEditingController cornerRadiusController = TextEditingController();
  final TextEditingController widthController = TextEditingController();
  final TextEditingController arrowHeightController = TextEditingController();
  final TextEditingController arrowWidthController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ListController listController =
        Provider.of<ListController>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 36.0, horizontal: 24),
            child: LayoutBuilder(builder: (context, constraint) {
              return Column(
                children: [
                  BuildDropDown(
                    label: 'Select Button',
                    selectedTarget: listController.buttonSelected,
                    items: listController.map.keys.toList(),
                    onChanged: (String? newValue) {
                      listController.buttonSelected = newValue!;
                    },
                  ),
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
                          label: 'Tooltip Width', controller: widthController),
                    ],
                  ),
                  OneLine(
                    width: constraint.maxWidth,
                    widgets: [
                      BuildTextField(
                          label: 'Arrow Height',
                          controller: arrowHeightController),
                      BuildTextField(
                          label: 'Arrow Width',
                          controller: arrowWidthController),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                        color: Colors.blue,
                        onPressed: () {
                          listController.map[listController.buttonSelected] =
                              CustomToolTipParams(
                            message: textEditingController.text,
                            textSize: double.parse(textSizeController.text),
                            textColor: Colors.blue,
                            bgColor: Colors.yellow,
                            radius: double.parse(cornerRadiusController.text),
                            width: double.parse(widthController.text),
                            padding: EdgeInsets.all(
                                double.parse(paddingController.text)),
                            arrowWidth: double.parse(arrowWidthController.text),
                            arrowHeight:
                                double.parse(arrowHeightController.text),
                          );
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
