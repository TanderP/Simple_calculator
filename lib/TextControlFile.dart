import 'package:flutter/services.dart';

//

// simple calculator
//https://github.com/TanderP/Simple_calculator.git

//
class CustomTextInputFormatter extends TextInputFormatter {
  // Allow -  and .
  static const allowedCharacters = [
    '-',
    '.',
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9'
  ];

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // filter char
    final filteredText = newValue.text
        .split('')
        .where((char) => allowedCharacters.contains(char))
        .join('');

    // add leading 0
    if (filteredText.startsWith('.') || filteredText.startsWith('-.')) {
      return TextEditingValue(
        text: '0$filteredText',
        selection: TextSelection.collapsed(offset: filteredText.length + 1),
      );
    }

    // 0 controller to control the first 0
    if (filteredText.startsWith('0') &&
        filteredText.length > 1 &&
        !filteredText.startsWith('0.')) {
      return TextEditingValue(
        text: filteredText.substring(1),
        selection: TextSelection.collapsed(offset: filteredText.length - 1),
      );
    }

    // only 1 - sign
    final minusCount = filteredText.split('-').length - 1;
    if (minusCount > 1 || (minusCount == 1 && !filteredText.startsWith('-'))) {
      final finalText = filteredText.replaceAll('-', '');
      return TextEditingValue(
        text: finalText,
        selection: TextSelection.collapsed(offset: finalText.length),
      );
    }

    return TextEditingValue(
      text: filteredText,
      selection: TextSelection.collapsed(offset: filteredText.length),
    );
  }
}
