import 'package:cnp_romania_parser/src/internal/exceptions/invalid_cnp_exception.dart';
import 'package:cnp_romania_parser/src/internal/extensions/string_extensions.dart';

class CnpCheckDigitCalculator {
  const CnpCheckDigitCalculator();
  int getCheckDigit(String originalValue) {
    if (originalValue.length != 13) {
      throw InvalidCnpException();
    }

    final checkDigits = '279146358279'.toDigits();
    final originalValueDigits = originalValue.toDigits().toList();
    final sum = checkDigits.indexed.fold<int>(
        0,
        (int sum, (int, int) checkDigitItem) =>
            sum + checkDigitItem.$2 * originalValueDigits[checkDigitItem.$1]);
    final checkValue = sum % 11;

    return checkValue == 10 ? 1 : checkValue;
  }
}
