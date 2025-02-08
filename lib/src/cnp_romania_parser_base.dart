import 'package:cnp_romania_parser/src/cnp_decoder.dart';
import 'package:cnp_romania_parser/src/internal/decoders/cnp_county_decoder.dart';
import 'package:cnp_romania_parser/src/internal/decoders/cnp_date_of_birth_decoder.dart';
import 'package:cnp_romania_parser/src/internal/decoders/cnp_serial_number_decoder.dart';
import 'package:cnp_romania_parser/src/internal/decoders/cnp_sex_decoder.dart';
import 'package:cnp_romania_parser/src/internal/validator/cnp_check_digit_calculator.dart';
import 'package:cnp_romania_parser/src/models/cnp_parsing_result.dart';

class CnpRomaniaParser {
  const CnpRomaniaParser();

  final CnpDecoder _cnpDecoder = const CnpDecoder(
    CnpSexDecoder(),
    CnpDateOfBirthDecoder(),
    CnpCountyDecoder(),
    CnpSerialNumberDecoder(),
    CnpCheckDigitCalculator(),
  );

  CnpParsingResult parse(String cnp) => _cnpDecoder.decodeCnp(cnp);
}
