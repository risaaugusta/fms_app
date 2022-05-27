final String tableRefueling = 'tr_refueling';

class TrRefuelingFields {
  static final List<String> values = [
    refueling_id,
    unit_code,
    shift_id,
    unit_type,
    site_id,
    hm_input,
    nama_operator,
    totalisator_begin,
    totalisator_end,
    fuel_consumption,
    budget,
    status,
    photo_meter_fuel,
    photo_hm_unit,
    created_by,
    created_at,
    material_number
  ];

  static final String refueling_id = 'refueling_id';
  static final String unit_code = 'unit_code';
  static final String shift_id = 'shift_id';
  static final String unit_type = 'unit_type';
  static final String site_id = 'site_id';
  static final String hm_input = 'hm_input';
  static final String nama_operator = 'nama_operator';
  static final String totalisator_begin = 'totalisator_begin';
  static final String totalisator_end = 'totalisator_end';
  static final String fuel_consumption = 'fuel_consumption';
  static final String budget = 'budget';
  static final String status = 'status';
  static final String photo_meter_fuel = 'photo_meter_fuel';
  static final String photo_hm_unit = 'photo_hm_unit';
  static final String created_at = 'created_at';
  static final String created_by = 'created_by';
  static final String material_number = 'material_number';
}

class TrRefueling {
  // int refueling_id;
  String created_at;
  String shift_id;
  String unit_type;
  String unit_code;
  String site_id;
  String hm_input;
  String nama_operator;
  String totalisator_begin;
  String totalisator_end;
  String fuel_consumption;
  String budget;
  String status;
  String photo_meter_fuel;
  String photo_hm_unit;
  String created_by;
  String material_number;

  TrRefueling({
    // required this.refueling_id,
    required this.created_at,
    required this.shift_id,
    required this.unit_code,
    required this.unit_type,
    required this.site_id,
    required this.hm_input,
    required this.nama_operator,
    required this.totalisator_begin,
    required this.totalisator_end,
    required this.fuel_consumption,
    required this.budget,
    required this.status,
    required this.photo_meter_fuel,
    required this.photo_hm_unit,
    required this.created_by,
    required this.material_number,
  });

  TrRefueling copy({
    // int? refueling_id,
    String? unit_code,
    String? shift_id,
    String? created_at,
    String? site_id,
    String? unit_type,
    String? hm_input,
    String? nama_operator,
    String? totalisator_begin,
    String? totalisator_end,
    String? fuel_consumption,
    String? budget,
    String? status,
    String? photo_meter_fuel,
    String? photo_hm_unit,
    String? created_by,
    String? material_number
  }) =>
      TrRefueling(
        // refueling_id: refueling_id ?? this.refueling_id,
        created_at: unit_code ?? this.created_at,
        shift_id: shift_id ?? this.shift_id,
        unit_code: unit_code ?? this.unit_code,
        unit_type: unit_type ?? this.unit_type,
        site_id: unit_type ?? this.site_id,
        hm_input: hm_input ?? this.hm_input,
        nama_operator: nama_operator ?? this.nama_operator,
        totalisator_begin: totalisator_begin ?? this.totalisator_begin,
        totalisator_end: totalisator_end ?? this.totalisator_end,
        fuel_consumption: fuel_consumption ?? this.fuel_consumption,
        budget: budget ?? this.budget,
        status: status ?? this.status,
        photo_meter_fuel: photo_meter_fuel ?? this.photo_meter_fuel,
        photo_hm_unit: unit_type ?? this.photo_hm_unit,
        created_by: created_by ?? this.created_by,
        material_number: material_number ?? this.material_number
      );

  static TrRefueling fromJson(Map<String, Object?> json) => TrRefueling(
    // refueling_id: json[TrRefuelingFields.refueling_id] as int,
    unit_code: json[TrRefuelingFields.unit_code] as String,
    shift_id: json[TrRefuelingFields.shift_id] as String,
    created_at: json[TrRefuelingFields.created_at] as String,
    unit_type: json[TrRefuelingFields.unit_type] as String,
    site_id: json[TrRefuelingFields.site_id] as String,
    hm_input: json[TrRefuelingFields.hm_input] as String,
    nama_operator: json[TrRefuelingFields.nama_operator] as String,
    totalisator_begin: json[TrRefuelingFields.totalisator_begin] as String,
    totalisator_end: json[TrRefuelingFields.totalisator_end] as String,
    fuel_consumption: json[TrRefuelingFields.fuel_consumption] as String,
    budget: json[TrRefuelingFields.budget] as String,
    status: json[TrRefuelingFields.status] as String,
    photo_meter_fuel: json[TrRefuelingFields.photo_meter_fuel] as String,
    photo_hm_unit: json[TrRefuelingFields.photo_hm_unit] as String,
    created_by: json[TrRefuelingFields.created_by] as String,
    material_number: json[TrRefuelingFields.material_number] as String
  );

  Map<String, Object?> toJson() => {
    // TrRefuelingFields.refueling_id: refueling_id,
    TrRefuelingFields.unit_code: unit_code,
    TrRefuelingFields.shift_id: shift_id,
    TrRefuelingFields.created_at: created_at,
    TrRefuelingFields.created_by: created_by,
    TrRefuelingFields.unit_type: unit_type,
    TrRefuelingFields.site_id: site_id,
    TrRefuelingFields.hm_input: hm_input,
    TrRefuelingFields.nama_operator: nama_operator,
    TrRefuelingFields.totalisator_begin: totalisator_begin,
    TrRefuelingFields.totalisator_end: totalisator_end,
    TrRefuelingFields.fuel_consumption: fuel_consumption,
    TrRefuelingFields.budget: budget,
    TrRefuelingFields.status: status,
    TrRefuelingFields.photo_meter_fuel: photo_meter_fuel,
    TrRefuelingFields.photo_hm_unit: photo_hm_unit,
    TrRefuelingFields.material_number: material_number
  };
}
