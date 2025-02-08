import 'package:cnp_romania_parser/src/internal/decoders/cnp_county_decoder.dart';
import 'package:cnp_romania_parser/src/internal/decoders/cnp_date_of_birth_decoder.dart';
import 'package:cnp_romania_parser/src/internal/decoders/cnp_serial_number_decoder.dart';
import 'package:cnp_romania_parser/src/internal/decoders/cnp_sex_decoder.dart';
import 'package:cnp_romania_parser/src/internal/parser/cnp_parsing_internal_result.dart';
import 'package:cnp_romania_parser/src/internal/validator/cnp_check_digit_calculator.dart';
import 'package:cnp_romania_parser/src/models/cnp_parsing_result.dart';
import 'package:cnp_romania_parser/src/models/cnp_values.dart';

class CnpDecoder {
  const CnpDecoder(
    this._sexDecoder,
    this._dateOfBirthDecoder,
    this._countyDecoder,
    this._serialNumberDecoder,
    this._checkDigitCalculator,
  );

  final CnpSexDecoder _sexDecoder;
  final CnpDateOfBirthDecoder _dateOfBirthDecoder;
  final CnpCountyDecoder _countyDecoder;
  final CnpSerialNumberDecoder _serialNumberDecoder;
  final CnpCheckDigitCalculator _checkDigitCalculator;
  CnpParsingResult decodeCnp(String cnp) {
    final result = CnpParsingInternalResult.parse(cnp);
    final calculatedCheckDigit = _checkDigitCalculator.getCheckDigit(cnp);
    final isValid = calculatedCheckDigit == result.c;
    if (!isValid) {
      return CnpParsingResult(
        isValid: false,
        values: null,
      );
    }

    final gender = _sexDecoder.decode(result);
    final dateOfBirth = _dateOfBirthDecoder.decode(result);
    final county = _countyDecoder.decode(result);
    final serialNumber = _serialNumberDecoder.decode(result);

    return CnpParsingResult(
      isValid: true,
      values: CnpValues(
        gender: gender,
        dateOfBirth: dateOfBirth,
        county: county,
        serialNumber: serialNumber,
      ),
    );
  }
}
