final String tableBapsDetail = 'tr_baps_detail';

class TrBapsDetailFields {
  static final List<String> values = [
    // baps_id,
    sj_solar_transportir_no,
    do_vendor_no,
    pr_po_no,
    supplier_name,
    driver_name,
    vehicle_no,
    volume,
    storage_id,
    segel_begin,
    segel_end,
    totalisator_begin,
    totalisator_end,
    flowmeter,
    deviation,
    sounding_begin,
    sounding_end,
    sg_observed,
    sg_do,
    temp_observed,
    temp_do,
    // operator_id,
    // baps_id,
  ];

  // static final String baps_id = 'baps_id';
  static final String sj_solar_transportir_no = 'sj_solar_transportir_no';
  static final String do_vendor_no = 'do_vendor_no';
  static final String pr_po_no = 'pr_po_no';
  static final String supplier_name = 'supplier_name';
  static final String driver_name = 'driver_name';
  static final String vehicle_no = 'vehicle_no';
  static final String volume = 'volume';
  static final String storage_id = 'storage_id';
  static final String segel_begin = 'segel_begin';
  static final String segel_end = 'segel_end';
  static final String totalisator_begin = 'totalisator_begin';
  static final String totalisator_end = 'totalisator_end';
  static final String flowmeter = 'flowmeter';
  static final String deviation = 'deviation';
  static final String sounding_begin = 'sounding_begin';
  static final String sounding_end = 'sounding_end';
  static final String sg_observed = 'sg_observed';
  static final String sg_do = 'sg_do';
  static final String temp_observed = 'temp_observed';
  static final String temp_do = 'temp_do';
  // static final String operator_id = 'operator_id';
  // static final String baps_id = 'baps_id';
}

class TrBapsDetail {
  // int? id;
  // String baps_id;
  String sj_solar_transportir_no;
  String do_vendor_no;
  String pr_po_no;
  String supplier_name;
  String driver_name;
  String vehicle_no;
  String volume;
  String storage_id;
  String segel_begin;
  String segel_end;
  String totalisator_begin;
  String totalisator_end;
  String flowmeter;
  String deviation;
  String sounding_begin;
  String sounding_end;
  String sg_observed;
  String sg_do;
  String temp_observed;
  String temp_do;
  // String operator_id;
  // String baps_id;

  TrBapsDetail({
    // required this.baps_id,
    required this.sj_solar_transportir_no,
    required this.do_vendor_no,
    required this.pr_po_no,
    required this.supplier_name,
    required this.driver_name,
    required this.vehicle_no,
    required this.volume,
    required this.storage_id,
    required this.segel_end,
    required this.segel_begin,
    required this.totalisator_begin,
    required this.totalisator_end,
    required this.flowmeter,
    required this.deviation,
    required this.sounding_begin,
    required this.sounding_end,
    required this.sg_observed,
    required this.sg_do,
    required this.temp_observed,
    required this.temp_do,
    // required this.operator_id,
    // required this.baps_id,
  });

  TrBapsDetail copy({
    // String? baps_id,
    String? sj_solar_transportir_no,
    String? do_vendor_no,
    String? pr_po_no,
    String? supplier_name,
    String? driver_name,
    String? vehicle_no,
    String? volume,
    String? storage_id,
    String? segel_begin,
    String? segel_end,
    String? totalisator_begin,
    String? totalisator_end,
    String? flowmeter,
    String? deviation,
    String? sounding_begin,
    String? sounding_end,
    String? sg_observed,
    String? sg_do,
    String? temp_observed,
    String? temp_do,
    // String? operator_id,
    // String? baps_id,
  }) =>
      TrBapsDetail(
        // baps_id: baps_id ?? this.baps_id,
        sj_solar_transportir_no: sj_solar_transportir_no ?? this.sj_solar_transportir_no,
        do_vendor_no: do_vendor_no ?? this.do_vendor_no,
        pr_po_no: pr_po_no ?? this.pr_po_no,
        supplier_name: supplier_name ?? this.supplier_name,
        driver_name: driver_name ?? this.driver_name,
        vehicle_no: vehicle_no ?? this.vehicle_no,
        volume: volume ?? this.volume,
        storage_id: storage_id ?? this.storage_id,
        segel_begin: segel_begin ?? this.segel_begin,
        segel_end: segel_end ?? this.segel_end,
        totalisator_begin: totalisator_begin ?? this.totalisator_begin,
        totalisator_end: totalisator_end ?? this.totalisator_end,
        flowmeter: flowmeter ?? this.flowmeter,
        deviation: deviation ?? this.deviation,
        sounding_begin: sounding_begin ?? this.sounding_begin,
        sounding_end: sounding_end ?? this.sounding_end,
        sg_observed: sg_observed ?? this.sg_observed,
        sg_do: sg_do ?? this.sg_do,
        temp_observed: temp_observed ?? this.temp_observed,
        temp_do: temp_do ?? this.temp_do,
        // operator_id: operator_id ?? this.operator_id,
        // baps_id: baps_id ?? this.baps_id,
      );

  static TrBapsDetail fromJson(Map<String, Object?> json) => TrBapsDetail(
    // baps_id: json[TrBapsDetailFields.baps_id] as String,
    sj_solar_transportir_no: json[TrBapsDetailFields.sj_solar_transportir_no] as String,
    do_vendor_no: json[TrBapsDetailFields.do_vendor_no] as String,
    pr_po_no: json[TrBapsDetailFields.pr_po_no] as String,
    supplier_name: json[TrBapsDetailFields.supplier_name] as String,
    driver_name: json[TrBapsDetailFields.driver_name] as String,
    vehicle_no: json[TrBapsDetailFields.vehicle_no] as String,
    volume: json[TrBapsDetailFields.volume] as String,
    storage_id: json[TrBapsDetailFields.storage_id] as String,
    segel_end: json[TrBapsDetailFields.segel_end] as String,
    segel_begin: json[TrBapsDetailFields.segel_begin] as String,
    totalisator_begin: json[TrBapsDetailFields.totalisator_begin] as String,
    totalisator_end: json[TrBapsDetailFields.totalisator_end] as String,
    flowmeter: json[TrBapsDetailFields.flowmeter] as String,
    deviation: json[TrBapsDetailFields.deviation] as String,
    sounding_begin: json[TrBapsDetailFields.sounding_begin] as String,
    sounding_end: json[TrBapsDetailFields.sounding_end] as String,
    sg_observed: json[TrBapsDetailFields.sg_observed] as String,
    sg_do: json[TrBapsDetailFields.sg_do] as String,
    temp_observed: json[TrBapsDetailFields.temp_observed] as String,
    temp_do: json[TrBapsDetailFields.temp_do] as String,
    // operator_id: json[TrBapsDetailFields.operator_id] as String,
    // baps_id: json[TrBapsDetailFields.baps_id] as String,
  );

  Map<String, Object?> toJson() => {
    // TrBapsDetailFields.baps_id: baps_id,
    TrBapsDetailFields.sj_solar_transportir_no: sj_solar_transportir_no,
    TrBapsDetailFields.do_vendor_no: do_vendor_no,
    TrBapsDetailFields.pr_po_no: pr_po_no,
    TrBapsDetailFields.supplier_name: supplier_name,
    TrBapsDetailFields.driver_name: driver_name,
    TrBapsDetailFields.vehicle_no: vehicle_no,
    TrBapsDetailFields.volume: volume,
    TrBapsDetailFields.storage_id: storage_id,
    TrBapsDetailFields.segel_begin: segel_begin,
    TrBapsDetailFields.segel_end: segel_end,
    TrBapsDetailFields.totalisator_begin: totalisator_begin,
    TrBapsDetailFields.totalisator_end: totalisator_end,
    TrBapsDetailFields.flowmeter: flowmeter,
    TrBapsDetailFields.deviation: deviation,
    TrBapsDetailFields.sounding_begin: sounding_begin,
    TrBapsDetailFields.sounding_end: sounding_end,
    TrBapsDetailFields.sg_observed: sg_observed,
    TrBapsDetailFields.sg_do: sg_do,
    TrBapsDetailFields.temp_observed: temp_observed,
    TrBapsDetailFields.temp_do: temp_do,
    // TrBapsDetailFields.operator_id: operator_id,
    // TrBapsDetailFields.baps_id: baps_id,
  };

}
