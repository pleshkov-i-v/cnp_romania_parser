class CnpCounty {
  // CNP jj value accoring to https://ro.wikipedia.org/wiki/Cod_numeric_personal_(Rom%C3%A2nia)
  final String index;

  /// County ISO code according to https://en.wikipedia.org/wiki/ISO_3166-2:RO
  final String iso;

  /// Romanian county name according to https://ro.wikipedia.org/wiki/Cod_numeric_personal_(Rom%C3%A2nia)
  final String name;

  const CnpCounty({
    required this.index,
    required this.iso,
    required this.name,
  });
}
