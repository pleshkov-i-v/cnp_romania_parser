# CNP parser

A parser for C.N.P. (short for ***C***od ***N***umeric ***P***ersonal or *Personal Identification Number*).

C.N.P. is a 13 digit unique number assigned to Romanian people at birth and to residents.

## Usage

This package provides an easy way to parse Romanian CNP (Personal Numeric Code). Here’s an example of how to use the CnpRomaniaParser to parse a CNP and validate it:

```dart
final parser = CnpRomaniaParser();
final result = parser.parse('1740501415486');  // Replace with the CNP you want to parse
final isValid = result.isValid;
```

## Examples

### Valid CNP

```dart
final parser = CnpRomaniaParser();
final result = parser.parse('1740501415486');  // Replace with the CNP you want to parse
final values = values = result.values!;
print('Result for valid CNP: 1740501415486');
print('IsValid: ${result.isValid}');
print('DOB: ${values.dateOfBirth}');
print('County code: ${values.county.index}');
print('County ISO code: ${values.county.iso}');
print('County name: ${values.county.name}');
print('Serial number: ${values.serialNumber.stringValue}');
```

Result:

```log
1740501415486 -> isValid: false
Result for valid CNP: 1740501415486
IsValid: true
DOB: 1974-05-01 00:00:00.000
County code: 41
County ISO code: B
County name: București Sector 1
Serial number: 548
```

### Invalid CNP

```dart
var result = parser.parse('1234567890123');
var values = result.values;
print('Result for invalid CNP: 1234567890123');
print('IsValid: ${result.isValid}');
print('Values: ${result.values}');
```

Result:

```log
1234567890123 -> isValid: false
Result for valid CNP: 1234567890123
IsValid: false
Values: null
```
