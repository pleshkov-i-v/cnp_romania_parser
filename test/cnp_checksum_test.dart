import 'package:cnp_romania_parser/src/cnp_decoder.dart';
import 'package:cnp_romania_parser/src/internal/decoders/cnp_county_decoder.dart';
import 'package:cnp_romania_parser/src/internal/decoders/cnp_date_of_birth_decoder.dart';
import 'package:cnp_romania_parser/src/internal/decoders/cnp_serial_number_decoder.dart';
import 'package:cnp_romania_parser/src/internal/decoders/cnp_sex_decoder.dart';
import 'package:cnp_romania_parser/src/internal/exceptions/invalid_cnp_exception.dart';
import 'package:cnp_romania_parser/src/internal/validator/cnp_check_digit_calculator.dart';
import 'package:test/test.dart';

void main() {
  test('Wrong CNP length - throws', () {
    final decoder = const CnpDecoder(
      CnpSexDecoder(),
      CnpDateOfBirthDecoder(),
      CnpCountyDecoder(),
      CnpSerialNumberDecoder(),
      CnpCheckDigitCalculator(),
    );

    expect(() => decoder.decodeCnp(''), throwsA(isA<InvalidCnpException>()));
    expect(() => decoder.decodeCnp('1'), throwsA(isA<InvalidCnpException>()));
    expect(() => decoder.decodeCnp('123456789012'),
        throwsA(isA<InvalidCnpException>()));
    expect(() => decoder.decodeCnp('12345678901234'),
        throwsA(isA<InvalidCnpException>()));
    // not correct month
    expect(() => decoder.decodeCnp('17402501415486'),
        throwsA(isA<InvalidCnpException>()));
  });

  test('Correct CNP - returns result', () {
    final decoder = const CnpDecoder(
      CnpSexDecoder(),
      CnpDateOfBirthDecoder(),
      CnpCountyDecoder(),
      CnpSerialNumberDecoder(),
      CnpCheckDigitCalculator(),
    );

    expect(decoder.decodeCnp('2990219469000'), 0);
    expect(decoder.decodeCnp('1740501415486'), 6);
  });
}
