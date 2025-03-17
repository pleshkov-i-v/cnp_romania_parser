import 'package:cnp_romania_parser/src/internal/exceptions/invalid_cnp_exception.dart';
import 'package:cnp_romania_parser/src/models/cnp_serial_number.dart';
import 'package:cnp_romania_parser/src/internal/parser/cnp_parsing_internal_result.dart';

class CnpSerialNumberDecoder {
  const CnpSerialNumberDecoder();

  /// Decodes the serial number from the provided [CnpParsingInternalResult].
  ///
  /// Throws an [InvalidCnpException] if:
  /// - The serial number is not in the valid range (1 to 999).
  /// - An error occurs during the instantiation of [CnpSerialNumber].
  CnpSerialNumber decode(CnpParsingInternalResult parsingResult) {
    final serialNumber = parsingResult.nnn;

    // Validate that the serial number is within the allowed range.
    if (serialNumber < 1 || serialNumber > 999) {
      throw InvalidCnpException(
          'Invalid serial number: $serialNumber. It must be between 1 and 999.');
    }

    // Try to create and return a CnpSerialNumber instance.
    try {
      return CnpSerialNumber(value: serialNumber);
    } catch (e) {
      throw InvalidCnpException('Error decoding serial number: $e');
    }
  }
}
