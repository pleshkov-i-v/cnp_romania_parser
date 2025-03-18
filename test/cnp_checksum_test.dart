import 'package:cnp_romania_parser/src/cnp_decoder.dart';
import 'package:cnp_romania_parser/src/internal/decoders/cnp_county_decoder.dart';
import 'package:cnp_romania_parser/src/internal/decoders/cnp_date_of_birth_decoder.dart';
import 'package:cnp_romania_parser/src/internal/decoders/cnp_serial_number_decoder.dart';
import 'package:cnp_romania_parser/src/internal/decoders/cnp_sex_decoder.dart';
import 'package:cnp_romania_parser/src/internal/exceptions/invalid_cnp_exception.dart';
import 'package:cnp_romania_parser/src/internal/validator/cnp_check_digit_calculator.dart';
import 'package:test/test.dart';

void main() {
  group('CNP Decoder Tests', () {
    // Create a decoder instance with all necessary decoders and the check digit calculator.
    const decoder = CnpDecoder(
      CnpSexDecoder(),
      CnpDateOfBirthDecoder(),
      CnpCountyDecoder(),
      CnpSerialNumberDecoder(),
      CnpCheckDigitCalculator(),
    );

    test('Should throw InvalidCnpException for wrong CNP lengths', () {
      expect(() => decoder.decodeCnp(''), throwsA(isA<InvalidCnpException>()));
      expect(() => decoder.decodeCnp('1'), throwsA(isA<InvalidCnpException>()));
      expect(() => decoder.decodeCnp('123456789012'), throwsA(isA<InvalidCnpException>()));
      expect(() => decoder.decodeCnp('12345678901234'), throwsA(isA<InvalidCnpException>()));
    });

    test('Should throw InvalidCnpException for invalid month value', () {
      // Example: invalid month (25) - month must be between 1 and 12.
      expect(() => decoder.decodeCnp('17402501415486'), throwsA(isA<InvalidCnpException>()));
    });

    test('Should throw InvalidCnpException for non-digit characters', () {
      // Example: CNP contains non-numeric characters.
      expect(() => decoder.decodeCnp('29902194abc000'), throwsA(isA<InvalidCnpException>()));
    });
  });
}
