import 'package:cnp_romania_parser/src/models/cnp_values.dart';

class CnpParsingResult {
  final bool isValid;
  final CnpValues? values;

  const CnpParsingResult({
    required this.isValid,
    required this.values,
  });
}
