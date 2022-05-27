final String tableBaps = 'tr_baps';

class TrBapsFields {
  static final List<String> values = [
    // baps_id,
    baps_no,
    site_id,
    storage_id,
    transaction_time,
    sj_solar_transportir_no,
    do_vendor_no,
    no_po,
    volume_sj_voucher,
    supplier_name,
    driver_name,
    vehicle_no,
    capacity,
    material_number,
    segel_begin,
    segel_end,
    totalisator_begin,
    totalisator_end,
    photo_totalisator_begin,
    photo_totalisator_end,
    sounding_begin,
    sounding_end,
    volume_pengisian,
    sg_observed,
    sg_do,
    deviation,
    temp_observed,
    temp_do,
    driver_signing,
    witness_signing,
    witness_name,
    receiver_signing,
    receiver_name,
    created_by,
    created_at,
    modified_by,
    modified_at,
    status_approval,
  ];

  // static final String baps_id = 'baps_id';
  static final String baps_no = 'baps_no';
  static final dynamic site_id = 'site_id';
  static final String storage_id = 'storage_id';
  static final String transaction_time = 'transaction_time';
  static final String sj_solar_transportir_no = 'sj_solar_transportir_no';
  static final String do_vendor_no = 'do_vendor_no';
  static final String no_po = 'no_po';
  static final String volume_sj_voucher = 'volume_sj_voucher';
  static final String supplier_name = 'supplier_name';
  static final String driver_name = 'driver_name';
  static final String vehicle_no = 'vehicle_no';
  static final String capacity = 'capacity';
  static final String material_number = 'material_number';
  static final String segel_begin = 'segel_begin';
  static final String segel_end = 'segel_end';
  static final String totalisator_begin = 'totalisator_begin';
  static final String totalisator_end = 'totalisator_end';
  static final String photo_totalisator_begin = 'photo_totalisator_begin';
  static final String photo_totalisator_end = 'photo_totalisator_end';
  static final String sounding_begin = 'sounding_begin';
  static final String sounding_end = 'sounding_end';
  static final String volume_pengisian = 'volume_pengisian';
  static final String sg_observed = 'sg_observed';
  static final String sg_do = 'sg_do';
  static final String deviation = 'deviation';
  static final String temp_observed = 'temp_observed';
  static final String temp_do = 'temp_do';
  static final String driver_signing = 'driver_signing';
  static final String witness_signing = 'witness_signing';
  static final String witness_name = 'witness_name';
  static final String receiver_signing = 'receiver_signing';
  static final String receiver_name = 'receiver_name';
  static final String created_by = 'created_by';
  static final String created_at = 'created_at';
  static final String modified_by = 'modified_by';
  static final String modified_at = 'modified_at';
  static final dynamic status_approval = 'status_approval';
}

class TrBaps {
  // int? id;
  // String baps_id;
  String baps_no;
  dynamic site_id;
  String storage_id;
  String transaction_time;
  String sj_solar_transportir_no;
  String do_vendor_no;
  String no_po;
  String volume_sj_voucher;
  String supplier_name;
  String driver_name;
  String vehicle_no;
  String capacity;
  String material_number;
  String totalisator_begin;
  String totalisator_end;
  String segel_begin;
  String segel_end;
  String photo_totalisator_begin;
  String photo_totalisator_end;
  String sounding_begin;
  String sounding_end;
  String volume_pengisian;
  String sg_observed;
  String sg_do;
  String deviation;
  String temp_observed;
  String temp_do;
  String driver_signing;
  String witness_signing;
  String witness_name;
  String receiver_signing;
  String receiver_name;
  String created_by;
  String created_at;
  String modified_by;
  String modified_at;
  dynamic status_approval;

  TrBaps({
    // required this.baps_id,
    required this.baps_no,
    required this.site_id,
    required this.storage_id,
    required this.transaction_time,
    required this.sj_solar_transportir_no,
    required this.do_vendor_no,
    required this.no_po,
    required this.volume_sj_voucher,
    required this.supplier_name,
    required this.driver_name,
    required this.vehicle_no,
    required this.capacity,
    required this.material_number,
    required this.segel_begin,
    required this.segel_end,
    required this.totalisator_begin,
    required this.totalisator_end,
    required this.photo_totalisator_begin,
    required this.photo_totalisator_end,
    required this.sounding_begin,
    required this.sounding_end,
    required this.volume_pengisian,
    required this.sg_observed,
    required this.sg_do,
    required this.deviation,
    required this.temp_observed,
    required this.temp_do,
    required this.driver_signing,
    required this.witness_signing,
    required this.witness_name,
    required this.receiver_signing,
    required this.receiver_name,
    required this.created_by,
    required this.created_at,
    required this.modified_at,
    required this.modified_by,
    required this.status_approval,
  });

  TrBaps copy({
    // String? baps_id,
    String? baps_no,
    dynamic? site_id,
    String? storage_id,
    String? transaction_time,
    String? sj_solar_transportir_no,
    String? do_vendor_no,
    String? no_po,
    String? volume_sj_voucher,
    String? supplier_name,
    String? driver_name,
    String? vehicle_no,
    String? capacity,
    String? material_number,
    String? segel_begin,
    String? segel_end,
    String? totalisator_begin,
    String? totalisator_end,
    String? photo_totalisator_begin,
    String? photo_totalisator_end,
    String? sounding_begin,
    String? sounding_end,
    String? volume_pengisian,
    String? sg_observed,
    String? sg_do,
    String? deviation,
    String? temp_observed,
    String? temp_do,
    String? driver_signing,
    String? witness_signing,
    String? witness_name,
    String? receiver_signing,
    String? receiver_name,
    String? created_by,
    String? created_at,
    String? modified_by,
    String? modified_at,
    dynamic? status_approval,
  }) =>
      TrBaps(
        // baps_id: baps_id ?? this.baps_id,
        baps_no: baps_no ?? this.baps_no,
        site_id: site_id ?? this.site_id,
        storage_id: storage_id ?? this.storage_id,
        transaction_time: transaction_time ?? this.transaction_time,
        sj_solar_transportir_no: sj_solar_transportir_no ?? this.sj_solar_transportir_no,
        do_vendor_no: do_vendor_no ?? this.do_vendor_no,
        no_po: no_po ?? this.no_po,
        volume_sj_voucher: volume_sj_voucher ?? this.volume_sj_voucher,
        supplier_name: supplier_name ?? this.supplier_name,
        driver_name: driver_name ?? this.driver_name,
        vehicle_no: vehicle_no ?? this.vehicle_no,
        capacity: capacity ?? this.capacity,
        material_number: material_number ?? this.material_number,
        segel_begin: segel_begin ?? this.segel_begin,
        segel_end: segel_end ?? this.segel_end,
        totalisator_begin: totalisator_begin ?? this.totalisator_begin,
        totalisator_end: totalisator_end ?? this.totalisator_end,
        photo_totalisator_begin: photo_totalisator_begin ?? this.photo_totalisator_begin,
        photo_totalisator_end: photo_totalisator_end ?? this.photo_totalisator_end,
        sounding_begin: sounding_begin ?? this.sounding_begin,
        sounding_end: sounding_end ?? this.sounding_end,
        volume_pengisian: volume_pengisian ?? this.volume_pengisian,
        sg_observed: sg_observed ?? this.sg_observed,
        sg_do: sg_do ?? this.sg_do,
        deviation: deviation ?? this.deviation,
        temp_observed: temp_observed ?? this.temp_observed,
        temp_do: temp_do ?? this.temp_do,
        driver_signing: driver_signing ?? this.driver_signing,
        witness_signing: witness_signing ?? this.witness_signing,
        witness_name: witness_name ?? this.witness_name,
        receiver_signing: receiver_signing ?? this.receiver_signing,
        receiver_name: receiver_name ?? this.receiver_name,
        created_by: created_by ?? this.created_by,
        created_at: created_at ?? this.created_at,
        modified_by: modified_by ?? this.modified_by,
        modified_at: modified_at ?? this.modified_at,
        status_approval: status_approval ?? this.status_approval,
      );

  static TrBaps fromJson(Map<String, Object?> json) => TrBaps(
    // baps_id: json[TrBapsFields.baps_id] as String,
    baps_no: json[TrBapsFields.baps_no] as String,
    site_id: json[TrBapsFields.site_id] as String,
    storage_id: json[TrBapsFields.storage_id] as String,
    transaction_time: json[TrBapsFields.transaction_time] as String,
    sj_solar_transportir_no: json[TrBapsFields.sj_solar_transportir_no] as String,
    do_vendor_no: json[TrBapsFields.do_vendor_no] as String,
    no_po: json[TrBapsFields.no_po] as String,
    volume_sj_voucher: json[TrBapsFields.volume_sj_voucher] as String,
    supplier_name: json[TrBapsFields.supplier_name] as String,
    driver_name: json[TrBapsFields.driver_name] as String,
    vehicle_no: json[TrBapsFields.vehicle_no] as String,
    capacity: json[TrBapsFields.capacity] as String,
    material_number: json[TrBapsFields.material_number] as String,
    segel_begin: json[TrBapsFields.segel_begin] as String,
    segel_end: json[TrBapsFields.segel_end] as String,
    totalisator_begin: json[TrBapsFields.totalisator_begin] as String,
    totalisator_end: json[TrBapsFields.totalisator_end] as String,
    photo_totalisator_begin: json[TrBapsFields.photo_totalisator_begin] as String,
    photo_totalisator_end: json[TrBapsFields.photo_totalisator_end] as String,
    sounding_begin: json[TrBapsFields.sounding_begin] as String,
    sounding_end: json[TrBapsFields.sounding_end] as String,
    volume_pengisian: json[TrBapsFields.volume_pengisian] as String,
    sg_observed: json[TrBapsFields.sg_observed] as String,
    sg_do: json[TrBapsFields.sg_do] as String,
    deviation: json[TrBapsFields.deviation] as String,
    temp_observed: json[TrBapsFields.temp_observed] as String,
    temp_do: json[TrBapsFields.temp_do] as String,
    driver_signing: json[TrBapsFields.driver_signing] as String,
    witness_signing: json[TrBapsFields.witness_signing] as String,
    witness_name: json[TrBapsFields.witness_name] as String,
    receiver_signing: json[TrBapsFields.receiver_signing] as String,
    receiver_name: json[TrBapsFields.receiver_name] as String,
    created_by: json[TrBapsFields.created_by] as String,
    created_at: json[TrBapsFields.created_at] as String,
    modified_at: json[TrBapsFields.modified_at] as String,
    modified_by: json[TrBapsFields.modified_by] as String,
    status_approval: json[TrBapsFields.status_approval] as dynamic,
  );

  Map<String, Object?> toJson() => {
    // TrBapsFields.baps_id: baps_id,
    TrBapsFields.baps_no: baps_no,
    TrBapsFields.site_id: site_id,
    TrBapsFields.storage_id: storage_id,
    TrBapsFields.transaction_time: transaction_time,
    TrBapsFields.sj_solar_transportir_no: sj_solar_transportir_no,
    TrBapsFields.do_vendor_no: do_vendor_no,
    TrBapsFields.no_po: no_po,
    TrBapsFields.volume_sj_voucher: volume_sj_voucher,
    TrBapsFields.supplier_name: supplier_name,
    TrBapsFields.driver_name: driver_name,
    TrBapsFields.vehicle_no: vehicle_no,
    TrBapsFields.capacity: capacity,
    TrBapsFields.material_number: material_number,
    TrBapsFields.segel_begin: segel_begin,
    TrBapsFields.segel_end: segel_end,
    TrBapsFields.totalisator_begin: totalisator_begin,
    TrBapsFields.totalisator_end: totalisator_end,
    TrBapsFields.photo_totalisator_begin: photo_totalisator_begin,
    TrBapsFields.photo_totalisator_end: photo_totalisator_end,
    TrBapsFields.sounding_begin: sounding_begin,
    TrBapsFields.sounding_end: sounding_end,
    TrBapsFields.volume_pengisian: volume_pengisian,
    TrBapsFields.sg_observed: sg_observed,
    TrBapsFields.sg_do: sg_do,
    TrBapsFields.deviation: deviation,
    TrBapsFields.temp_observed: temp_observed,
    TrBapsFields.temp_do: temp_do,
    TrBapsFields.driver_signing: driver_signing,
    TrBapsFields.witness_signing: witness_signing,
    TrBapsFields.witness_name: witness_name,
    TrBapsFields.receiver_signing: receiver_signing,
    TrBapsFields.receiver_name: receiver_name,
    TrBapsFields.created_by: created_by,
    TrBapsFields.created_at: created_at,
    TrBapsFields.modified_by: modified_by,
    TrBapsFields.modified_at: modified_at,
    TrBapsFields.status_approval: status_approval,
  };

}
