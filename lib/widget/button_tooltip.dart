import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tooltip_plotline/config/controller/controller.dart';
import 'package:tooltip_plotline/config/model/tooltip_model.dart';
import 'package:tooltip_plotline/screens/render_screen.dart';
import 'package:tooltip_plotline/widget/custom_button.dart';
import 'package:tooltip_plotline/widget/custom_tooltip.dart';

class CreateCustomToolTip extends StatelessWidget {
  const CreateCustomToolTip({
    super.key,
    required this.buttonKey,
    required this.params,
    required this.context,
  });
  final String buttonKey;
  final CustomToolTipParams params;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return CustomToolTip(
      context: context,
      message: params.message,
      bgColor: Color(int.parse("0xFF${params.bgColor.toUpperCase()}")),
      textColor: Color(int.parse("0xFF${params.textColor.toUpperCase()}")),
      width: params.width,
      arrowHeight: params.arrowHeight,
      arrowWidth: params.arrowWidth,
      padding: params.padding,
      textSize: params.textSize,
      radius: params.radius,
      imageRadius: params.imageRadius,
      imageURL: params.imageURL,
      gap: params.gap,
      child: CustomButton(
        onPressed: () {
          ListController listController =
              Provider.of<ListController>(context, listen: false);
          listController.buttonSelected = buttonKey;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const RenderScreen(
                shouldPop: true,
              ),
            ),
          );
        },
        text: buttonKey,
      ),
    );
  }
}
