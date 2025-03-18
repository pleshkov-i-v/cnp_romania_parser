import 'package:cnp_romania_parser/src/internal/exceptions/invalid_cnp_exception.dart';
import 'package:cnp_romania_parser/src/internal/decoders/cnp_county_map.dart';
import 'package:cnp_romania_parser/src/models/cnp_county.dart';
import 'package:cnp_romania_parser/src/internal/parser/cnp_parsing_internal_result.dart';

class CnpCountyDecoder {
  const CnpCountyDecoder();

  /// Decodes the county information from the parsed CNP result.
  /// Throws [InvalidCnpException] if the county code is invalid.
  CnpCounty decode(CnpParsingInternalResult parsingResult) {
    final countyCode = parsingResult.jj;
    final county = CnpCountyMap.map[countyCode];

    if (county == null) {
      throw InvalidCnpException('Invalid county code: $countyCode');
    }

    return county;
  }
}
