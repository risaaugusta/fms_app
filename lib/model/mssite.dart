final String tableSite = 'mssite';

class MsSiteFields {
  static final List<String> values = [
    companiID,
    siteID,
    siteName
  ];

  static final String companiID = 'companiID';
  static final String siteID = 'siteID';
  static final String siteName = 'siteName';
}

class MsSite {
  String companiID;
  String siteID;
  String siteName;

  MsSite({
    required this.companiID,
    required this.siteID,
    required this.siteName
  });

  MsSite copy({
    String? companiID,
    String? siteID,
    String? siteName
  }) =>
      MsSite(
          companiID: companiID ?? this.companiID,
          siteID: siteID ?? this.siteID,
          siteName: siteName ?? this.siteName
      );

  static MsSite fromJson(Map<String, Object?> json) => MsSite(
      companiID: json[MsSiteFields.companiID] as String,
      siteID: json[MsSiteFields.siteID] as String,
      siteName: json[MsSiteFields.siteName] as String
  );

  Map<String, Object?> toJson() => {
    MsSiteFields.companiID: companiID,
    MsSiteFields.siteID: siteID,
    MsSiteFields.siteName: siteName
  };
}
