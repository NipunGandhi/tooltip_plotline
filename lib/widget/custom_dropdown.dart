import 'package:flutter/material.dart';

class BuildDropDown extends StatelessWidget {
  const BuildDropDown({
    Key? key,
    required this.label,
    required this.selectedTarget,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  final String label;
  final String selectedTarget;
  final List<String> items;
  final ValueChanged<String?> onChanged;

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
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: DropdownButtonFormField<String>(
            value: selectedTarget,
            onChanged: onChanged,
            items: items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
