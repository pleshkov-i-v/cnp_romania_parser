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
    if (value.length != 13) {
      throw InvalidCnpException();
    }

    try {
      final digits = value.toDigits().toList();
      return CnpParsingInternalResult(
        originalValue: value,
        s: digits[0],
        yy: digits[1] * 10 + digits[2],
        mm: digits[3] * 10 + digits[4],
        dd: digits[5] * 10 + digits[6],
        jj: digits[7] * 10 + digits[8],
        nnn: digits[9] * 100 + digits[10] * 10 + digits[11],
        c: digits[12],
      );
    } catch (e) {
      // Something went wrong. Doesn't matter what.
      throw InvalidCnpException();
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
