final String tableTransfer = 'tr_fuel_transfer';

class TrFuelTransferFields {
  static final List<String> values = [
    // id
    // transactions_id,
    site_id,
    // shift_id,
    storage_destination,
    storage_source,
    flowmeter_source,
    totalisator_source_begin,
    totalisator_source_end,
    totalisator_dst_begin,
    totalisator_dst_end,
    flowmeter_dst,
    // attendance_id,
    // approval_id,
    // is_active,
    // created_by,
    created_at,
    // modified_by,
    modified_at,
  ];

  // static final String id = '_id';
  // static final String transactions_id = 'transactions_id';
  static final String site_id = 'site_id';
  // static final String shift_id = 'shift_id';
  static final String storage_destination = 'storage_destination';
  static final String storage_source = 'storage_source';
  static final String flowmeter_source = 'flowmeter_source';
  static final String totalisator_source_begin = 'totalisator_source_begin';
  static final String totalisator_source_end = 'totalisator_source_end';
  static final String totalisator_dst_begin = 'totalisator_dst_begin';
  static final String totalisator_dst_end = 'totalisator_dst_end';
  static final String flowmeter_dst = 'flowmeter_dst';
  // static final String attendance_id = 'attendance_id';
  // static final String approval_id = 'approval_id';
  // static final String created_by = 'created_by';
  static final String created_at = 'created_at';
  // static final String modified_by = 'modified_by';
  static final String modified_at = 'modified_at';
// static final String is_active = 'is_active';
}

class TrFuelTransfer {
  // int? id;
  // String transactions_id;
  String site_id;
  // String shift_id;
  String storage_source;
  String flowmeter_source;
  String totalisator_source_begin;
  String totalisator_source_end;
  String storage_destination;
  String flowmeter_dst;
  String totalisator_dst_begin;
  String totalisator_dst_end;
  // String attendance_id;
  // String approval_id;
  // String created_by;
  String created_at;
  // String modified_by;
  String modified_at;
  // String is_active;

  TrFuelTransfer({
    // this.id,
    // required this.transactions_id,
    required this.site_id,
    // required this.shift_id,
    required this.storage_source,
    required this.storage_destination,
    required this.flowmeter_source,
    required this.totalisator_source_begin,
    required this.totalisator_source_end,
    required this.totalisator_dst_begin,
    required this.totalisator_dst_end,
    required this.flowmeter_dst,
    // required this.attendance_id,
    // required this.approval_id,
    // required this.created_by,
    required this.created_at,
    // required this.modified_by,
    required this.modified_at,
    // required this.is_active,
  });

  TrFuelTransfer copy({
    // int? id,
    // String? transactions_id,
    String? site_id,
    // String? shift_id,
    String? storage_destination,
    String? storage_source,
    String? flowmeter_source,
    String? totalisator_source_begin,
    String? totalisator_source_end,
    String? totalisator_dst_begin,
    String? totalisator_dst_end,
    String? flowmeter_dst,
    // String? attendance_id,
    // String? approval_id,
    // String? created_by,
    String? created_at,
    // String? modified_by,
    String? modified_at,
    // String? is_active,
  }) =>
      TrFuelTransfer(
        // id: id ?? this.id,
        // transactions_id: transactions_id ?? this.transactions_id,
        site_id: site_id ?? this.site_id,
        // shift_id: shift_id ?? this.shift_id,
        storage_source: storage_source ?? this.storage_source,
        flowmeter_source: flowmeter_source ?? this.flowmeter_source,
        totalisator_source_begin: totalisator_source_begin ?? this.totalisator_source_begin,
        totalisator_source_end: totalisator_source_end ?? this.totalisator_source_end,
        storage_destination: storage_destination ?? this.storage_destination,
        flowmeter_dst: flowmeter_dst ?? this.flowmeter_dst,
        totalisator_dst_begin: totalisator_dst_begin ?? this.totalisator_dst_begin,
        totalisator_dst_end: totalisator_dst_end ?? this.totalisator_dst_end,
        // attendance_id: attendance_id ?? this.attendance_id,
        // approval_id: approval_id ?? this.approval_id,
        // created_by: approval_id ?? this.created_by,
        created_at: created_at ?? this.created_at,
        // modified_by: approval_id ?? this.modified_by,
        modified_at: modified_at ?? this.modified_at,
        // is_active: is_active ?? this.is_active,
      );

  static TrFuelTransfer fromJson(Map<String, Object?> json) => TrFuelTransfer(
    // id: json[TrFuelTransferFields.id] as int?,
    // transactions_id: json[TrFuelTransferFields.transactions_id] as String,
    site_id: json[TrFuelTransferFields.site_id] as String,
    // shift_id: json[TrFuelTransferFields.shift_id] as String,
    storage_source: json[TrFuelTransferFields.storage_source] as String,
    flowmeter_source: json[TrFuelTransferFields.flowmeter_source] as String,
    totalisator_source_begin: json[TrFuelTransferFields.totalisator_source_begin] as String,
    totalisator_source_end: json[TrFuelTransferFields.totalisator_source_end] as String,
    storage_destination: json[TrFuelTransferFields.storage_destination] as String,
    flowmeter_dst: json[TrFuelTransferFields.flowmeter_dst] as String,
    totalisator_dst_begin: json[TrFuelTransferFields.totalisator_dst_begin] as String,
    totalisator_dst_end: json[TrFuelTransferFields.totalisator_dst_end] as String,
    // attendance_id: json[TrFuelTransferFields.attendance_id] as String,
    // approval_id: json[TrFuelTransferFields.approval_id] as String,
    // created_by: json[TrFuelTransferFields.created_by] as String,
    created_at: json[TrFuelTransferFields.created_at] as String,
    // modified_by: json[TrFuelTransferFields.modified_by] as String,
    modified_at: json[TrFuelTransferFields.modified_at] as String,
    // is_active: json[TrFuelTransferFields.is_active] as String,
  );

  Map<String, Object?> toJson() => {
    // TrFuelTransferFields.id: id,
    // TrFuelTransferFields.transactions_id: transactions_id,
    TrFuelTransferFields.site_id: site_id,
    // TrFuelTransferFields.shift_id: shift_id,
    TrFuelTransferFields.storage_source: storage_source,
    TrFuelTransferFields.flowmeter_source: flowmeter_source,
    TrFuelTransferFields.totalisator_source_begin: totalisator_source_begin,
    TrFuelTransferFields.totalisator_source_end: totalisator_source_end,
    TrFuelTransferFields.storage_destination: storage_destination,
    TrFuelTransferFields.flowmeter_dst: flowmeter_dst,
    TrFuelTransferFields.totalisator_dst_begin: totalisator_dst_begin,
    TrFuelTransferFields.totalisator_dst_end: totalisator_dst_end,
    // TrFuelTransferFields.attendance_id: attendance_id,
    // TrFuelTransferFields.approval_id: approval_id,
    // TrFuelTransferFields.created_by: created_by,
    TrFuelTransferFields.created_at: created_at,
    // TrFuelTransferFields.modified_by: modified_by,
    TrFuelTransferFields.modified_at: modified_at,
    // TrFuelTransferFields.is_active: is_active,
  };

}
