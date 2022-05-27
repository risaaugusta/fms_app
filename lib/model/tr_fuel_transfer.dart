final String tableTransfer = 'tr_fuel_transfer';

class TrFuelTransferFields {
  static final List<String> values = [
    storage_source,
    sounding_begin_source,
    totalisator_begin_source,
    volume,
    totalisator_end_source,
    sounding_end_source,
    photo_flowmeter, 
    storage_dst,
    sounding_begin_dst, 
    sounding_end_dst, 
    shift_id,
    site_id,
    material_number,
    created_by,
    created_at, 
  ];
 
  static final String storage_source = 'storage_source'; 
  static final String sounding_begin_source = 'sounding_begin_source';
  static final String totalisator_begin_source = 'totalisator_begin_source';
  static final String volume = 'volume';
  static final String totalisator_end_source = 'totalisator_end_source';
  static final String sounding_end_source = 'sounding_end_source';
  static final String photo_flowmeter = 'photo_flowmeter';
  static final String storage_dst = 'storage_dst';
  static final String sounding_begin_dst = 'sounding_begin_dst';
  static final String sounding_end_dst = 'sounding_end_dst';
  static final String shift_id = 'shift_id';
  static final String site_id = 'site_id';
  static final String material_number = 'material_number';
  static final String created_by = 'created_by';
  static final String created_at = 'created_at'; 
}

class TrFuelTransfer { 
  String storage_source;
  String photo_flowmeter;
  String totalisator_begin_source;
  String totalisator_end_source;
  String sounding_begin_source;
  String sounding_end_source;
  String volume;
  String storage_dst;
  String sounding_begin_dst;
  String sounding_end_dst;
  String shift_id;
  String site_id;
  String material_number;
  String created_by;
  String created_at; 

  TrFuelTransfer({
    required this.storage_source,
    required this.sounding_begin_source,
    required this.sounding_end_source,
    required this.photo_flowmeter,
    required this.totalisator_begin_source,
    required this.totalisator_end_source,
    required this.volume,
    required this.storage_dst,
    required this.sounding_begin_dst,
    required this.sounding_end_dst,
    required this.shift_id,
    required this.site_id,
    required this.material_number,
    required this.created_by,
    required this.created_at, 
  });

  TrFuelTransfer copy({ 
    String? storage_source, 
    String? sounding_begin_source,
    String? sounding_end_source,
    String? photo_flowmeter,
    String? totalisator_begin_source,
    String? totalisator_end_source,
    String? volume,
    String? storage_dst,
    String? sounding_begin_dst,
    String? sounding_end_dst,
    String? shift_id,
    String? site_id,
    String? material_number,
    String? created_by,
    String? created_at, 
  }) =>
      TrFuelTransfer(
        storage_source: storage_source ?? this.storage_source,
        photo_flowmeter: photo_flowmeter ?? this.photo_flowmeter,
        totalisator_begin_source: totalisator_begin_source ?? this.totalisator_begin_source,
        totalisator_end_source: totalisator_end_source ?? this.totalisator_end_source,
        sounding_begin_source: sounding_begin_source ?? this.sounding_begin_source,
        sounding_end_source: sounding_end_source ?? this.sounding_end_source,
        volume: volume ?? this.volume,
        storage_dst: storage_dst ?? this.storage_dst,
        sounding_begin_dst: sounding_begin_dst ?? this.sounding_begin_dst,
        sounding_end_dst: sounding_end_dst ?? this.sounding_end_dst,
        shift_id: shift_id ?? this.shift_id,
        material_number: material_number ?? this.material_number,
        site_id: site_id ?? this.site_id,
        created_by: created_by ?? this.created_by,
        created_at: created_at ?? this.created_at,
      );

  static TrFuelTransfer fromJson(Map<String, Object?> json) => TrFuelTransfer(
    storage_source: json[TrFuelTransferFields.storage_source] as String,
    photo_flowmeter: json[TrFuelTransferFields.photo_flowmeter] as String,
    totalisator_begin_source: json[TrFuelTransferFields.totalisator_begin_source] as String,
    totalisator_end_source: json[TrFuelTransferFields.totalisator_end_source] as String,
    sounding_begin_source: json[TrFuelTransferFields.sounding_begin_source] as String,
    sounding_end_source: json[TrFuelTransferFields.sounding_end_source] as String,
    storage_dst: json[TrFuelTransferFields.storage_dst] as String,
    sounding_begin_dst: json[TrFuelTransferFields.sounding_begin_dst] as String,
    sounding_end_dst: json[TrFuelTransferFields.sounding_end_dst] as String,
    volume: json[TrFuelTransferFields.volume] as String,
    shift_id: json[TrFuelTransferFields.shift_id] as String,
    site_id: json[TrFuelTransferFields.site_id] as String,
    material_number: json[TrFuelTransferFields.material_number] as String,
    created_by: json[TrFuelTransferFields.created_by] as String,
    created_at: json[TrFuelTransferFields.created_at] as String,
  );

  Map<String, Object?> toJson() => {
    TrFuelTransferFields.storage_source: storage_source,
    TrFuelTransferFields.photo_flowmeter: photo_flowmeter,
    TrFuelTransferFields.totalisator_begin_source: totalisator_begin_source,
    TrFuelTransferFields.totalisator_end_source: totalisator_end_source,
    TrFuelTransferFields.sounding_begin_source: sounding_begin_source,
    TrFuelTransferFields.sounding_end_source: sounding_end_source,
    TrFuelTransferFields.storage_dst: storage_dst,
    TrFuelTransferFields.sounding_begin_dst: sounding_begin_dst,
    TrFuelTransferFields.sounding_end_dst: sounding_end_dst,
    TrFuelTransferFields.volume: volume,
    TrFuelTransferFields.shift_id: shift_id,
    TrFuelTransferFields.site_id: site_id,
    TrFuelTransferFields.material_number: material_number,
    TrFuelTransferFields.created_by: created_by,
    TrFuelTransferFields.created_at: created_at,
  };

}
