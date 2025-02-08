import 'package:cnp_romania_parser/src/internal/exceptions/invalid_cnp_exception.dart';
import 'package:cnp_romania_parser/src/internal/parser/cnp_parsing_internal_result.dart';
import 'package:test/test.dart';

void main() {
  test('Wrong CNP length - throws', () {
    expect(() => CnpParsingInternalResult.parse(''),
        throwsA(isA<InvalidCnpException>()));
    expect(() => CnpParsingInternalResult.parse('1'),
        throwsA(isA<InvalidCnpException>()));
    expect(() => CnpParsingInternalResult.parse('123456789012'),
        throwsA(isA<InvalidCnpException>()));
    expect(() => CnpParsingInternalResult.parse('12345678901234'),
        throwsA(isA<InvalidCnpException>()));
  });

  test('Valid CNP - returns result', () {
    final result = CnpParsingInternalResult.parse('1740501415486');
    expect(result.s, 1);
    expect(result.yy, 74);
    expect(result.mm, 5);
    expect(result.dd, 1);
    expect(result.jj, 41);
    expect(result.nnn, 548);
    expect(result.c, 6);
  });
}
