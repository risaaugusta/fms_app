final String tableName = 'tr_fuel_distribution';

class TrFuelDistributionFields {
  static final List<String> values = [
    // transactions_id,
    equipment_id,
    // storage_id,
    site_id,
    // shift_id,
    fuel_filling,
    fuel_totalisator_awal,
    fuel_totalisator_akhir,
    hm_equipment,
    // storage_operator,
    // equipment_operator,
    // equipment_budget,
    // is_active,
    // created_by,
    created_at,
    // updated_by,
    updated_at,
    // attendance_id,
    image_directory,
    image_name,
  ];

  // // static final String id = '_id';
  // static final String transactions_id = 'transactions_id';
  static final String equipment_id = 'equipment_id';
  // static final String storage_id = 'storage_id';
  static final String site_id = 'site_id';
  // static final String shift_id = 'shift_id';
  static final String fuel_filling = 'fuel_filling';
  static final String fuel_totalisator_awal = 'fuel_totalisator_awal';
  static final String fuel_totalisator_akhir = 'fuel_totalisator_akhir';
  static final String hm_equipment = 'hm_equipment';
  // static final String storage_operator = 'storage_operator';
  // static final String equipment_operator = 'equipment_operator';
  // static final String equipment_budget = 'equipment_budget';
  // static final String is_active = 'is_active';
  // static final String created_by = 'created_by';
  static final String created_at = 'created_at';
  // static final String updated_by = 'updated_by';
  static final String updated_at = 'updated_at';
  static final String image_directory = 'image_directory';
  static final String image_name = 'image_name';
// static final String attendance_id = 'attendance_id';
}

class TrFuelDistribution {
  // int? id;
  // int? transactions_id;
  String equipment_id;
  // String storage_id;
  String site_id;
  // String shift_id;
  String fuel_filling;
  String fuel_totalisator_awal;
  String fuel_totalisator_akhir;
  String hm_equipment;
  // String storage_operator;
  // String equipment_operator;
  // String equipment_budget;
  // String is_active;
  // String created_by;
  String created_at;
  // String updated_by;
  String updated_at;
  String image_directory;
  String image_name;
  // String attendance_id;

  TrFuelDistribution({
    // this.id,
    // this.transactions_id,
    required this.equipment_id,
    // required this.storage_id,
    required this.site_id,
    // required this.shiftId,
    required this.fuel_filling,
    required this.fuel_totalisator_awal,
    required this.fuel_totalisator_akhir,
    required this.hm_equipment,
    // required this.storage_operator,
    // required this.equipment_operator,
    // required this.equipment_budget,
    // required this.isActive,
    // required this.createdBy,
    required this.created_at,
    // required this.updatedBy,
    required this.updated_at,
    required this.image_directory,
    required this.image_name,
    // required this.attendaceId,
  });

  TrFuelDistribution copy({
    // int? id,
    int? transactions_id,
    String? equipment_id,
    // String? storage_id,
    String? site_id,
    // String? shiftId,
    String? fuel_filling,
    String? fuel_totalisator_awal,
    String? fuel_totalisator_akhir,
    String? hm_equipment,
    String? storage_operator,
    String? equipment_operator,
    // String? equipment_budget,
    // String? isActive,
    // String? createdBy,
    String? created_at,
    // String? updatedBy,
    String? updated_at,
    String? image_directory,
    String? image_name,
    // String? attendaceId,
  }) =>
      TrFuelDistribution(
        // id: id ?? this.id,
        // transactions_id: transactions_id ?? this.transactions_id,
        equipment_id: equipment_id ?? this.equipment_id,
        // storage_id: storage_id ?? this.storage_id,
        site_id: site_id ?? this.site_id,
        // shiftId: shiftId ?? this.shiftId,
        fuel_filling: fuel_filling ?? this.fuel_filling,
        fuel_totalisator_awal: fuel_totalisator_awal ?? this.fuel_totalisator_awal,
        fuel_totalisator_akhir: fuel_totalisator_akhir ?? this.fuel_totalisator_akhir,
        hm_equipment: hm_equipment ?? this.hm_equipment,
        // storage_operator: storage_operator ?? this.storage_operator,
        // equipment_operator: equipment_operator ?? this.equipment_operator,
        // equipment_budget: equipment_budget ?? this.equipment_budget,
        // isActive: isActive ?? this.isActive,
        // createdBy: createdBy ?? this.createdBy,
        created_at: created_at ?? this.created_at,
        // updatedBy: updatedBy ?? this.updatedBy,
        updated_at: updated_at ?? this.updated_at,
        image_directory: updated_at ?? this.image_directory,
        image_name: updated_at ?? this.image_name,
        // attendaceId: attendaceId ?? this.attendaceId,
      );

  static TrFuelDistribution fromJson(Map<String, Object?> json) => TrFuelDistribution(
    // id: json[TrFuelDistributionFields.id] as int?,
    // transactions_id: json[TrFuelDistributionFields.transactions_id] as int?,
    equipment_id: json[TrFuelDistributionFields.equipment_id] as String,
    // storage_id: json[TrFuelDistributionFields.storage_id] as String,
    site_id: json[TrFuelDistributionFields.site_id] as String,
    // shiftId: json[TrFuelDistributionFields.shiftId] as String,
    fuel_filling: json[TrFuelDistributionFields.fuel_filling] as String,
    fuel_totalisator_awal: json[TrFuelDistributionFields.fuel_totalisator_awal] as String,
    fuel_totalisator_akhir: json[TrFuelDistributionFields.fuel_totalisator_akhir] as String,
    hm_equipment: json[TrFuelDistributionFields.hm_equipment] as String,
    // storage_operator: json[TrFuelDistributionFields.storage_operator] as String,
    // equipment_operator: json[TrFuelDistributionFields.equipment_operator] as String,
    // equipment_budget: json[TrFuelDistributionFields.equipment_budget] as String,
    // isActive: json[TrFuelDistributionFields.isActive] as String,
    // createdBy: json[TrFuelDistributionFields.createdBy] as String,
    created_at: json[TrFuelDistributionFields.created_at] as String,
    // updatedBy: json[TrFuelDistributionFields.updatedBy] as String,
    updated_at: json[TrFuelDistributionFields.updated_at] as String,
    image_directory: json[TrFuelDistributionFields.image_directory] as String,
    image_name: json[TrFuelDistributionFields.image_name] as String,
    // attendaceId: json[TrFuelDistributionFields.attendaceId] as String,
  );

  Map<String, Object?> toJson() => {
    // TrFuelDistributionFields.id: id,
    // TrFuelDistributionFields.transactions_id: transactions_id,
    TrFuelDistributionFields.equipment_id: equipment_id,
    // TrFuelDistributionFields.storage_id: storage_id,
    TrFuelDistributionFields.site_id: site_id,
    // TrFuelDistributionFields.shiftId: shiftId,
    TrFuelDistributionFields.fuel_filling: fuel_filling,
    TrFuelDistributionFields.fuel_totalisator_awal: fuel_totalisator_awal,
    TrFuelDistributionFields.fuel_totalisator_akhir: fuel_totalisator_akhir,
    TrFuelDistributionFields.hm_equipment: hm_equipment,
    // TrFuelDistributionFields.storage_operator: storage_operator,
    // TrFuelDistributionFields.equipment_operator: equipment_operator,
    // TrFuelDistributionFields.equipment_budget: equipment_budget,
    // TrFuelDistributionFields.isActive: isActive,
    // TrFuelDistributionFields.createdBy: createdBy,
    TrFuelDistributionFields.created_at: created_at,
    // TrFuelDistributionFields.updatedBy: updatedBy,
    TrFuelDistributionFields.updated_at: updated_at,
    TrFuelDistributionFields.image_directory: image_directory,
    TrFuelDistributionFields.image_name: image_name,
    // TrFuelDistributionFields.attendaceId: attendaceId,
  };

}
