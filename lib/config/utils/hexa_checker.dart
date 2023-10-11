import 'package:flutter/services.dart';

class AlphaNumericFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newText = newValue.text.replaceAll(RegExp(r'[^a-fA-F0-9]'), '');

    if (newText.length > 6) {
      return TextEditingValue(
        text: newText.substring(0, 6),
        selection: const TextSelection.collapsed(offset: 6),
      );
    }

    return TextEditingValue(
      text: newText,
      selection: newValue.selection,
    );
  }
}