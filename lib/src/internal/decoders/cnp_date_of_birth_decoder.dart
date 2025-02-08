import 'package:cnp_romania_parser/src/internal/exceptions/invalid_cnp_exception.dart';
import 'package:cnp_romania_parser/src/internal/parser/cnp_parsing_internal_result.dart';

class CnpDateOfBirthDecoder {
  const CnpDateOfBirthDecoder();
  DateTime decode(CnpParsingInternalResult parsingResult) {
    try {
      final shortYear = parsingResult.yy;
      final residentCentury = shortYear < DateTime.now().year ? 20 : 19;
      final centuryMap = {
        1: 1900,
        2: 1900,
        3: 1800,
        4: 1800,
        5: 2000,
        6: 2000,
        7: residentCentury,
        8: residentCentury,
      };

      final fullYear = centuryMap[parsingResult.s]! + shortYear;

      return DateTime(fullYear, parsingResult.mm, parsingResult.dd);
    } catch (e) {
      throw InvalidCnpException();
    }
  }
}
