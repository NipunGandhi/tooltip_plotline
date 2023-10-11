import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tooltip_plotline/config/colors/colors.dart';
import 'package:tooltip_plotline/config/controller/controller.dart';
import 'package:tooltip_plotline/config/model/tooltip_model.dart';
import 'package:tooltip_plotline/config/utils/hexa_checker.dart';
import 'package:tooltip_plotline/screens/homescreen.dart';
import 'package:tooltip_plotline/widget/custom_button.dart';
import 'package:tooltip_plotline/widget/custom_dropdown.dart';
import 'package:tooltip_plotline/widget/custom_textfield.dart';
import 'package:tooltip_plotline/widget/oneline_converter.dart';
import 'package:tooltip_plotline/widget/warning.dart';

import '../config/utils/hive_services.dart';

class RenderScreen extends StatefulWidget {
  const RenderScreen({super.key, this.shouldPop = false});
  final bool shouldPop;
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
  TextEditingController imageURL = TextEditingController();
  TextEditingController imageRadius = TextEditingController();
  TextEditingController gap = TextEditingController();

  @override
  void initState() {
    ListController initController =
        Provider.of<ListController>(context, listen: false);
    initializingValues(initController);
    super.initState();
  }

  bool areControllersValid() {
    return textEditingController.text.isNotEmpty &&
        textSizeController.text.isNotEmpty &&
        textColorController.text.isNotEmpty &&
        bgColorController.text.isNotEmpty &&
        cornerRadiusController.text.isNotEmpty &&
        widthController.text.isNotEmpty &&
        paddingController.text.isNotEmpty &&
        arrowWidthController.text.isNotEmpty &&
        arrowHeightController.text.isNotEmpty;
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
      imageURL.text = selectedParams.imageURL.toString();
      imageRadius.text = selectedParams.radius.toString();
      gap.text = selectedParams.gap.toString();
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
                        label: 'Text Size',
                        controller: textSizeController,
                        textInputType: TextInputType.number,
                        formatter: [FilteringTextInputFormatter.digitsOnly],
                      ),
                      BuildTextField(
                        label: 'Padding',
                        controller: paddingController,
                        textInputType: TextInputType.number,
                        formatter: [FilteringTextInputFormatter.digitsOnly],
                      ),
                    ],
                  ),
                  BuildTextField(
                    label: 'Text Color',
                    controller: textColorController,
                    formatter: [AlphaNumericFormatter()],
                  ),
                  BuildTextField(
                      label: 'Background Color',
                      controller: bgColorController,
                      formatter: [AlphaNumericFormatter()]),
                  OneLine(
                    width: constraint.maxWidth,
                    widgets: [
                      BuildTextField(
                        label: 'Corner Radius',
                        controller: cornerRadiusController,
                        textInputType: TextInputType.number,
                        formatter: [FilteringTextInputFormatter.digitsOnly],
                      ),
                      BuildTextField(
                        label: 'Tooltip Width',
                        controller: widthController,
                        textInputType: TextInputType.number,
                        formatter: [FilteringTextInputFormatter.digitsOnly],
                      ),
                    ],
                  ),
                  OneLine(
                    width: constraint.maxWidth,
                    widgets: [
                      BuildTextField(
                        label: 'Arrow Height',
                        controller: arrowHeightController,
                        textInputType: TextInputType.number,
                        formatter: [FilteringTextInputFormatter.digitsOnly],
                      ),
                      BuildTextField(
                        label: 'Arrow Width',
                        controller: arrowWidthController,
                        textInputType: TextInputType.number,
                        formatter: [FilteringTextInputFormatter.digitsOnly],
                      ),
                    ],
                  ),
                  BuildTextField(label: 'Image URL', controller: imageURL),
                  BuildTextField(
                    label: 'Image Radius',
                    controller: imageRadius,
                    textInputType: TextInputType.number,
                    formatter: [FilteringTextInputFormatter.digitsOnly],
                  ),
                  BuildTextField(
                    label: 'Gap Between Image and Text',
                    controller: gap,
                    formatter: [FilteringTextInputFormatter.digitsOnly],
                    textInputType: TextInputType.number,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                        color: Colors.blue,
                        onPressed: () {
                          if (areControllersValid()) {
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
                              arrowWidth:
                                  double.parse(arrowWidthController.text),
                              arrowHeight:
                                  double.parse(arrowHeightController.text),
                              imageURL: imageURL.text,
                              imageRadius: double.parse(imageRadius.text),
                              gap: double.parse(gap.text),
                            );
                            LocalStorage().store(listController.map);
                            listController.update();
                            if (widget.shouldPop) {
                              Navigator.pop(context);
                            } else {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()),
                              );
                            }
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const Warning();
                              },
                            );
                          }
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
