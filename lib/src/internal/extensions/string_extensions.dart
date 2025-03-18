extension StringToDigitExtension on String {
  Iterable<int> toDigits() sync* {
    for (int i = 0; i < length; i++) {
      // Subtract 48 from the code unit to convert the character to its numeric value.
      yield codeUnitAt(i) - 48;
    }
  }
}
