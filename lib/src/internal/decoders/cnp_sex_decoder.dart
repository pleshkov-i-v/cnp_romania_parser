import 'package:cnp_romania_parser/src/internal/exceptions/invalid_cnp_exception.dart';
import 'package:cnp_romania_parser/src/models/cnp_gender.dart';
import 'package:cnp_romania_parser/src/internal/parser/cnp_parsing_internal_result.dart';

class CnpSexDecoder {
  const CnpSexDecoder();

  CnpGender decode(CnpParsingInternalResult parsingResult) {
    final s = parsingResult.s;

    // Check that the value 's' is within the allowed range (1 to 9)
    if (s < 1 || s > 9) {
      throw InvalidCnpException('Invalid value for s: $s. It must be between 1 and 9.');
    }

    // If s equals 9, this usually indicates that the CNP belongs to a foreign citizen,
    // and gender information might be undefined. In this case, return an unknown gender.
    if (s == 9) {
      return CnpGender.unknown; // Assumes that CnpGender.unknown is defined
    }

    // For other values: odd means male, even means female.
    return s % 2 == 0 ? CnpGender.female : CnpGender.male;
  }
}
