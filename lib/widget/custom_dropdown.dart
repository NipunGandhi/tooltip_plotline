import 'package:flutter/material.dart';

class BuildDropDown extends StatelessWidget {
  const BuildDropDown(
      {super.key, required this.label, required this.selectedTarget});
  final String label;
  final String selectedTarget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
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
            onChanged: (String? newValue) {
              // selectedTarget = newValue!;
            },
            items: <String>[
              'Button 1',
              'Button 2',
              'Button 3',
              'Button 4',
              'Button 5',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
