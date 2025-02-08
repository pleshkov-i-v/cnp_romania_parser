import 'package:cnp_romania_parser/cnp_romania_parser.dart';

void main() {
  final parser = CnpRomaniaParser();

  var result = parser.parse('1234567890123');
  var values = result.values;
  print('1234567890123 -> isValid: ${result.isValid}'); //resurns false

  result = parser.parse('1740501415486');
  values = result.values;
  print(
      '1234567890123 -> isValid: ${result.isValid}, DOB: ${values?.dateOfBirth}'); //resurns true
}
