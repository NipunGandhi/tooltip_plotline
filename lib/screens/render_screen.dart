import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tooltip_plotline/config/colors/colors.dart';
import 'package:tooltip_plotline/config/controller/controller.dart';
import 'package:tooltip_plotline/config/model/tooltip_model.dart';
import 'package:tooltip_plotline/widget/custom_button.dart';
import 'package:tooltip_plotline/widget/custom_dropdown.dart';
import 'package:tooltip_plotline/widget/custom_textfield.dart';
import 'package:tooltip_plotline/widget/oneline_converter.dart';

import '../config/utils/hive_services.dart';

class RenderScreen extends StatefulWidget {
  const RenderScreen({super.key});
  @override
  State<RenderScreen> createState() => _RenderScreenState();
}

class _RenderScreenState extends State<RenderScreen> {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController textSizeController = TextEditingController();
  TextEditingController paddingController = TextEditingController();
  TextEditingController textColorController = TextEditingController();
  TextEditingController bgColorController = TextEditingController();
  TextEditingController cornerRadiusController = TextEditingController();
  TextEditingController widthController = TextEditingController();
  TextEditingController arrowHeightController = TextEditingController();
  TextEditingController arrowWidthController = TextEditingController();

  @override
  void initState() {
    ListController initController =
        Provider.of<ListController>(context, listen: false);
    initializingValues(initController);
    super.initState();
  }

  Future<void> initializingValues(ListController initController) async {
    final storedMap = await LocalStorage().fetch();
    if (storedMap != null) {
      final convertedMap = <String, CustomToolTipParams>{};
      storedMap.forEach((key, value) {
        if (key is String && value is CustomToolTipParams) {
          convertedMap[key] = value;
        }
      });
      initController.map = convertedMap;
      print(initController.map);
    }
    if (initController.map.containsKey(initController.buttonSelected)) {
      CustomToolTipParams selectedParams =
          initController.map[initController.buttonSelected]!;
      textEditingController.text = selectedParams.message;
      textSizeController.text = selectedParams.textSize.toString();
      paddingController.text = selectedParams.padding.left.toString();
      textColorController.text = selectedParams.textColor;
      bgColorController.text = selectedParams.bgColor;
      cornerRadiusController.text = selectedParams.radius.toString();
      widthController.text = selectedParams.width.toString();
      arrowHeightController.text = selectedParams.arrowHeight.toString();
      arrowWidthController.text = selectedParams.arrowWidth.toString();
    }
  }

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
                      initializingValues(listController);
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
                            textColor: textColorController.text,
                            bgColor: bgColorController.text,
                            radius: double.parse(cornerRadiusController.text),
                            width: double.parse(widthController.text),
                            padding: EdgeInsets.all(
                                double.parse(paddingController.text)),
                            arrowWidth: double.parse(arrowWidthController.text),
                            arrowHeight:
                                double.parse(arrowHeightController.text),
                          );
                          LocalStorage().store(listController.map);
                          listController.update();
                          Navigator.pop(context);
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
}
