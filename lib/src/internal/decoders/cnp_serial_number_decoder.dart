import 'package:cnp_romania_parser/src/internal/exceptions/invalid_cnp_exception.dart';
import 'package:cnp_romania_parser/src/models/cnp_serial_number.dart';
import 'package:cnp_romania_parser/src/internal/parser/cnp_parsing_internal_result.dart';

class CnpSerialNumberDecoder {
  const CnpSerialNumberDecoder();
  CnpSerialNumber decode(CnpParsingInternalResult parsingResult) {
    final serialNumber = parsingResult.nnn;
    if (serialNumber < 1 || serialNumber > 999) {
      throw InvalidCnpException();
    }

    try {
      return CnpSerialNumber(value: serialNumber);
    } catch (e) {
      throw InvalidCnpException();
    }
  }
}
