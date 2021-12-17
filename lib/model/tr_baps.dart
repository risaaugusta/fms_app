final String tableBaps = 'tr_baps';

class TrBapsFields {
  static final List<String> values = [
    // baps_id,
    site_id,
    // shift_id,
    // operator_id,
    approval_id,
    notes,
    baps_status,
    // created_by,
    created_at,
    // modified_by,
    modified_at,
  ];

  // static final String baps_id = 'baps_id';
  static final String site_id = 'site_id';
  // static final String shift_id = 'shift_id';
  // static final String operator_id = 'operator_id';
  static final String approval_id = 'approval_id';
  static final String notes = 'notes';
  static final String baps_status = 'baps_status';
  // static final String created_by = 'created_by';
  static final String created_at = 'created_at';
  // static final String modified_by = 'modified_by';
  static final String modified_at = 'modified_at';
}

class TrBaps {
  // int? id;
  // String baps_id;
  String site_id;
  // String shift_id;
  // String operator_id;
  String approval_id;
  String notes;
  String baps_status;
  // String created_by;
  String created_at;
  // String modified_by;
  String modified_at;

  TrBaps({
    // required this.baps_id,
    required this.site_id,
    // required this.shift_id,
    // required this.operator_id,
    required this.approval_id,
    required this.notes,
    required this.baps_status,
    // required this.created_by,
    required this.created_at,
    required this.modified_at,
    // required this.modified_by,
  });

  TrBaps copy({
    // String? baps_id,
    String? site_id,
    // String? shift_id,
    // String? operator_id,
    String? approval_id,
    String? notes,
    String? baps_status,
    // String? created_by,
    String? created_at,
    // String? modified_by,
    String? modified_at,
  }) =>
      TrBaps(
        // baps_id: baps_id ?? this.baps_id,
        site_id: site_id ?? this.site_id,
        // shift_id: shift_id ?? this.shift_id,
        // operator_id: operator_id ?? this.operator_id,
        approval_id: approval_id ?? this.approval_id,
        notes: notes ?? this.notes,
        baps_status: baps_status ?? this.baps_status,
        // created_by: created_by ?? this.created_by,
        created_at: created_at ?? this.created_at,
        // modified_by: modified_by ?? this.modified_by,
        modified_at: modified_at ?? this.modified_at,
      );

  static TrBaps fromJson(Map<String, Object?> json) => TrBaps(
    // baps_id: json[TrBapsFields.baps_id] as String,
    site_id: json[TrBapsFields.site_id] as String,
    // shift_id: json[TrBapsFields.shift_id] as String,
    // operator_id: json[TrBapsFields.operator_id] as String,
    approval_id: json[TrBapsFields.approval_id] as String,
    notes: json[TrBapsFields.notes] as String,
    baps_status: json[TrBapsFields.baps_status] as String,
    // created_by: json[TrBapsFields.created_by] as String,
    created_at: json[TrBapsFields.created_at] as String,
    modified_at: json[TrBapsFields.modified_at] as String,
    // modified_by: json[TrBapsFields.modified_by] as String,
  );

  Map<String, Object?> toJson() => {
    // TrBapsFields.baps_id: baps_id,
    TrBapsFields.site_id: site_id,
    // TrBapsFields.shift_id: shift_id,
    // TrBapsFields.operator_id: operator_id,
    TrBapsFields.approval_id: approval_id,
    TrBapsFields.notes: notes,
    TrBapsFields.baps_status: baps_status,
    // TrBapsFields.created_by: created_by,
    TrBapsFields.created_at: created_at,
    // TrBapsFields.modified_by: modified_by,
    TrBapsFields.modified_at: modified_at,
  };

}
