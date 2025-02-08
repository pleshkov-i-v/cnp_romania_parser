import 'package:cnp_romania_parser/src/internal/exceptions/invalid_cnp_exception.dart';
import 'package:cnp_romania_parser/src/models/cnp_gender.dart';
import 'package:cnp_romania_parser/src/internal/parser/cnp_parsing_internal_result.dart';

class CnpSexDecoder {
  const CnpSexDecoder();
  CnpGender decode(CnpParsingInternalResult parsingResult) {
    final s = parsingResult.s;
    if (s < 1 || s > 8) {
      throw InvalidCnpException();
    }
    // odd - male, even - female
    return s % 2 == 0 ? CnpGender.female : CnpGender.male;
  }
}
