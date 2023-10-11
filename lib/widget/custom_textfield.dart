import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BuildTextField extends StatelessWidget {
  const BuildTextField(
      {super.key, required this.label, required this.controller, this.textInputType, this.formatter});
  final String label;
  final TextEditingController controller;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? formatter;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: Colors.grey),
          ),
          child: TextField(
            controller: controller,
            inputFormatters: formatter,
            keyboardType: textInputType,
            decoration: const InputDecoration(
              hintText: 'Input',
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

