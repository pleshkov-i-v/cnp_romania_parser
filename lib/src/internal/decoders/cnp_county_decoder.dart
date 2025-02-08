import 'package:cnp_romania_parser/src/internal/exceptions/invalid_cnp_exception.dart';
import 'package:cnp_romania_parser/src/internal/decoders/cnp_county_map.dart';
import 'package:cnp_romania_parser/src/models/cnp_county.dart';
import 'package:cnp_romania_parser/src/internal/parser/cnp_parsing_internal_result.dart';

class CnpCountyDecoder {
  const CnpCountyDecoder();
  CnpCounty decode(CnpParsingInternalResult parsingResult) {
    try {
      final countyCode = parsingResult.jj;
      return CnpCountyMap.map[countyCode]!;
    } catch (e) {
      throw InvalidCnpException();
    }
  }
}
