extension StringToDigitExtension on String {
  Iterable<int> toDigits() sync* {
    for (int i = 0; i < length; i++) {
      yield codeUnitAt(i) - 48;
    }
  }
}
