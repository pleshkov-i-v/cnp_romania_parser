import 'package:cnp_romania_parser/src/internal/exceptions/invalid_cnp_exception.dart';
import 'package:cnp_romania_parser/src/internal/parser/cnp_parsing_internal_result.dart';

class CnpDateOfBirthDecoder {
  const CnpDateOfBirthDecoder();

  DateTime decode(CnpParsingInternalResult parsingResult) {
    try {
      final shortYear = parsingResult.yy;
      // Get the last two digits of the current year for proper comparison.
      final currentTwoDigitYear = DateTime.now().year % 100;
      // Determine resident century:
      // If the short year is less than or equal to the current two-digit year,
      // assume the century is 2000; otherwise, assume 1900.
      final residentCentury = shortYear <= currentTwoDigitYear ? 2000 : 1900;

      // Map first digit of CNP to the corresponding century.
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

      if (!centuryMap.containsKey(parsingResult.s)) {
        throw InvalidCnpException('Invalid first digit for determining century');
      }

      // Calculate the full year of birth.
      final fullYear = centuryMap[parsingResult.s]! + shortYear;

      // The DateTime constructor will throw an error if the month or day values are invalid.
      return DateTime(fullYear, parsingResult.mm, parsingResult.dd);
    } catch (e) {
      throw InvalidCnpException('Error decoding date of birth: $e');
    }
  }
}
