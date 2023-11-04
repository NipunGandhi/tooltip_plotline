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
    required this.rootContext,
  });
  final String buttonKey;
  final CustomToolTipParams params;
  final BuildContext rootContext;

  @override
  Widget build(BuildContext context) {
    return CustomToolTip(
      context: rootContext,
      message: params.message,
      bgColor: Color(int.parse("0xFF${params.bgColor.toUpperCase()}")),
      textColor: Color(int.parse("0xFF${params.textColor.toUpperCase()}")),
      width: 300,
      arrowHeight: params.arrowHeight,
      arrowWidth: params.arrowWidth,
      padding: params.padding,
      textSize: params.textSize,
      radius: params.radius,
      tooltipChildRadius: BorderRadius.circular(params.imageRadius ?? 0),
      tooltipChild: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.network(
            params.imageURL!,
            height: 100,
            width: 100,
          ),
          Image.network(
            params.imageURL!,
            height: 100,
            width: 100,
          ),
        ],
      ),
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
