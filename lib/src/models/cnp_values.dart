import 'package:cnp_romania_parser/src/models/cnp_county.dart';
import 'package:cnp_romania_parser/src/models/cnp_gender.dart';
import 'package:cnp_romania_parser/src/models/cnp_serial_number.dart';

class CnpValues {
  final CnpGender gender;
  final DateTime dateOfBirth;
  final CnpCounty county;
  final CnpSerialNumber serialNumber;

  const CnpValues({
    required this.gender,
    required this.dateOfBirth,
    required this.county,
    required this.serialNumber,
  });
}
