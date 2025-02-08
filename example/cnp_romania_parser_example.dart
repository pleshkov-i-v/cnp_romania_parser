import 'package:cnp_romania_parser/cnp_romania_parser.dart';

void main() {
  final parser = CnpRomaniaParser();

  var result = parser.parse('1234567890123');
  var values = result.values;
  print('Result for invalid CNP: 1234567890123');
  print('IsValid: ${result.isValid}');
  print('Values: ${result.values}');

  result = parser.parse('1740501415486');
  values = result.values!;
  print('Result for valid CNP: 1740501415486');
  print('IsValid: ${result.isValid}');
  print('DOB: ${values.dateOfBirth}');
  print('County code: ${values.county.index}');
  print('County ISO code: ${values.county.iso}');
  print('County name: ${values.county.name}');
  print('Serial number: ${values.serialNumber.stringValue}');
}
