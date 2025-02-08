class CnpSerialNumber {
  final int value;
  final String stringValue;
  CnpSerialNumber({required this.value})
      : assert(value >= 1 && value <= 999),
        stringValue = value.toString().padLeft(3, '0');
}
