import 'package:cnp_romania_parser/src/internal/exceptions/invalid_cnp_exception.dart';
import 'package:cnp_romania_parser/src/internal/extensions/string_extensions.dart';

class CnpParsingInternalResult {
  final String originalValue;
  final int s;
  final int yy;
  final int mm;
  final int dd;
  final int jj;
  final int nnn;
  final int c;

  const CnpParsingInternalResult({
    required this.originalValue,
    required this.s,
    required this.yy,
    required this.mm,
    required this.dd,
    required this.jj,
    required this.nnn,
    required this.c,
  });

  factory CnpParsingInternalResult.parse(String value) {
    // Check that the CNP has exactly 13 characters
    if (value.length != 13) {
      throw InvalidCnpException('CNP must be 13 characters long');
    }

    try {
      final digits = value.toDigits().toList();
      if (digits.length != 13) {
        throw InvalidCnpException('Error converting string to digits');
      }

      // Extract components from the CNP
      final int s = digits[0];
      final int yy = digits[1] * 10 + digits[2];
      final int mm = digits[3] * 10 + digits[4];
      final int dd = digits[5] * 10 + digits[6];
      final int jj = digits[7] * 10 + digits[8];
      final int nnn = digits[9] * 100 + digits[10] * 10 + digits[11];
      final int c = digits[12];

      // Validate allowed ranges for the components:
      // 's' should usually be between 1 and 9 (depending on the CNP specification)
      if (s < 1 || s > 9) {
        throw InvalidCnpException('Invalid value for the first digit (s)');
      }
      // Month should be between 1 and 12
      if (mm < 1 || mm > 12) {
        throw InvalidCnpException('Invalid month value (mm)');
      }
      // Day should be between 1 and 31 (detailed validation for month/day can be added later)
      if (dd < 1 || dd > 31) {
        throw InvalidCnpException('Invalid day value (dd)');
      }

      // Calculate the control digit using the key "279146358279"
      final List<int> key = [2, 7, 9, 1, 4, 6, 3, 5, 8, 2, 7, 9];
      int total = 0;
      for (int i = 0; i < 12; i++) {
        total += digits[i] * key[i];
      }
      int remainder = total % 11;
      int calculatedControl = (remainder == 10) ? 1 : remainder;

      // Validate the control digit
      if (calculatedControl != c) {
        throw InvalidCnpException('Invalid control digit');
      }

      return CnpParsingInternalResult(
        originalValue: value,
        s: s,
        yy: yy,
        mm: mm,
        dd: dd,
        jj: jj,
        nnn: nnn,
        c: c,
      );
    } catch (e) {
      throw InvalidCnpException('Error parsing CNP: $e');
    }
  }

  static CnpParsingInternalResult? tryParse(String value) {
    try {
      return CnpParsingInternalResult.parse(value);
    } catch (e) {
      return null;
    }
  }
}
