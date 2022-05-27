final String tableSounding = 'tr_sounding';

class TrSoundingFields {
  static final List<String> values = [
    sounding_id,
    site_id,
    shift_id,
    storage_id,
    created_by,
    created_at
  ];

  static final String sounding_id = 'sounding_id';
  static final String site_id = 'site_id';
  static final String shift_id = 'shift_id';
  static final String created_at = 'created_at';
  static final String sounding = 'sounding';
  static final String storage_id = 'storage_id';
  static final String created_by = 'created_by';
}

class TrSounding {
  // int sounding_id;
  String created_at;
  String sounding;
  String shift_id;
  String storage_id;
  String site_id;
  String created_by;

  TrSounding({
    // required this.sounding_id,
    required this.sounding,
    required this.created_at,
    required this.shift_id,
    required this.site_id,
    required this.storage_id,
    required this.created_by
  });

  TrSounding copy({
    // int? sounding_id,
    String? site_id,
    String? shift_id,
    String? created_at,
    String? sounding,
    String? storage_id,
    String? created_by
  }) =>
      TrSounding(
        // sounding_id: sounding_id ?? this.sounding_id,
        created_at: site_id ?? this.created_at,
        shift_id: shift_id ?? this.shift_id,
        site_id: site_id ?? this.site_id,
        sounding: sounding ?? this.sounding,
        storage_id: storage_id ?? this.storage_id,
        created_by: created_by ?? this.created_by
      );

  static TrSounding fromJson(Map<String, Object?> json) => TrSounding(
    // sounding_id: json[TrSoundingFields.sounding_id] as int,
    site_id: json[TrSoundingFields.site_id] as String,
    shift_id: json[TrSoundingFields.shift_id] as String,
    created_at: json[TrSoundingFields.created_at] as String,
    storage_id: json[TrSoundingFields.storage_id] as String,
    sounding: json[TrSoundingFields.sounding] as String,
    created_by: json[TrSoundingFields.created_by] as String
  );

  Map<String, Object?> toJson() => {
    // TrSoundingFields.sounding_id: sounding_id,
    TrSoundingFields.site_id: site_id,
    TrSoundingFields.shift_id: shift_id,
    TrSoundingFields.sounding: sounding,
    TrSoundingFields.created_at: created_at,
    TrSoundingFields.storage_id: storage_id,
    TrSoundingFields.created_by: created_by
  };
}
