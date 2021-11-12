final String tableName = 'tr_fuel_distribution';

class TrFuelDistributionFields {
  static final List<String> values = [
    // id
    // transactionsId,
    equipment_id,
    // storage_id,
    // site_id,
    // shiftId,
    fuel_filling,
    fuel_totalisator_awal,
    fuel_totalisator_akhir,
    hm_equipment,
    // storage_operator,
    // equipment_operator,
    // equipmentBudget,
    // isActive,
    // createdBy,
    created_at,
    // updatedBy,
    // updatedAt,
    // attendaceId,
  ];

  // static final String id = '_id';
  // static final String transactionsId = 'transactionsId';
  static final String equipment_id = 'equipment_id';
  // static final String storage_id = 'storage_id';
  // static final String site_id = 'site_id';
  // static final String shiftId = 'shiftId';
  static final String fuel_filling = 'fuel_filling';
  static final String fuel_totalisator_awal = 'fuel_totalisator_awal';
  static final String fuel_totalisator_akhir = 'fuel_totalisator_akhir';
  static final String hm_equipment = 'hm_equipment';
  // static final String storage_operator = 'storage_operator';
  // static final String equipment_operator = 'equipment_operator';
  // static final String equipmentBudget = 'equipmentBudget';
  // static final String isActive = 'isActive';
  // static final String createdBy = 'createdBy';
  static final String created_at = 'created_at';
  // static final String updatedBy = 'updatedBy';
  // static final String updatedAt = 'updatedAt';
  // static final String attendaceId = 'attendaceId';
}

class TrFuelDistribution {
  // int? id;
  // String transactionsId;
  String equipment_id;
  // String storage_id;
  // String site_id;
  // String shiftId;
  String fuel_filling;
  String fuel_totalisator_awal;
  String fuel_totalisator_akhir;
  String hm_equipment;
  // String storage_operator;
  // String equipment_operator;
  // String equipmentBudget;
  // String isActive;
  // String createdBy;
  String created_at;
  // String updatedBy;
  // String updatedAt;
  // String attendaceId;

  TrFuelDistribution({
    // this.id,
    // required this.transactionsId,
    required this.equipment_id,
    // required this.storage_id,
    // required this.site_id,
    // required this.shiftId,
    required this.fuel_filling,
    required this.fuel_totalisator_awal,
    required this.fuel_totalisator_akhir,
    required this.hm_equipment,
    // required this.storage_operator,
    // required this.equipment_operator,
    // required this.equipmentBudget,
    // required this.isActive,
    // required this.createdBy,
    required this.created_at,
    // required this.updatedBy,
    // required this.updatedAt,
    // required this.attendaceId,
  });

  TrFuelDistribution copy({
    // int? id,
    // String? transactionsId,
    String? equipment_id,
    // String? storage_id,
    // String? site_id,
    // String? shiftId,
    String? fuel_filling,
    String? fuel_totalisator_awal,
    String? fuel_totalisator_akhir,
    String? hm_equipment,
    // String? storage_operator,
    // String? equipment_operator,
    // String? equipmentBudget,
    // String? isActive,
    // String? createdBy,
    String? created_at,
    // String? updatedBy,
    // String? updatedAt,
    // String? attendaceId,
  }) =>
      TrFuelDistribution(
        // id: id ?? this.id,
        // transactionsId: transactionsId ?? this.transactionsId,
        equipment_id: equipment_id ?? this.equipment_id,
        // storage_id: storage_id ?? this.storage_id,
        // site_id: site_id ?? this.site_id,
        // shiftId: shiftId ?? this.shiftId,
        fuel_filling: fuel_filling ?? this.fuel_filling,
        fuel_totalisator_awal: fuel_totalisator_awal ?? this.fuel_totalisator_awal,
        fuel_totalisator_akhir: fuel_totalisator_akhir ?? this.fuel_totalisator_akhir,
        hm_equipment: hm_equipment ?? this.hm_equipment,
        // storage_operator: storage_operator ?? this.storage_operator,
        // equipment_operator: equipment_operator ?? this.equipment_operator,
        // equipmentBudget: equipmentBudget ?? this.equipmentBudget,
        // isActive: isActive ?? this.isActive,
        // createdBy: createdBy ?? this.createdBy,
        created_at: created_at ?? this.created_at,
        // updatedBy: updatedBy ?? this.updatedBy,
        // updatedAt: updatedAt ?? this.updatedAt,
        // attendaceId: attendaceId ?? this.attendaceId,
      );

  static TrFuelDistribution fromJson(Map<String, Object?> json) => TrFuelDistribution(
    // id: json[TrFuelDistributionFields.id] as int?,
    // transactionsId: json[TrFuelDistributionFields.transactionsId] as String,
    equipment_id: json[TrFuelDistributionFields.equipment_id] as String,
    // storage_id: json[TrFuelDistributionFields.storage_id] as String,
    // site_id: json[TrFuelDistributionFields.site_id] as String,
    // shiftId: json[TrFuelDistributionFields.shiftId] as String,
    fuel_filling: json[TrFuelDistributionFields.fuel_filling] as String,
    fuel_totalisator_awal: json[TrFuelDistributionFields.fuel_totalisator_awal] as String,
    fuel_totalisator_akhir: json[TrFuelDistributionFields.fuel_totalisator_akhir] as String,
    hm_equipment: json[TrFuelDistributionFields.hm_equipment] as String,
    // storage_operator: json[TrFuelDistributionFields.storage_operator] as String,
    // equipment_operator: json[TrFuelDistributionFields.equipment_operator] as String,
    // equipmentBudget: json[TrFuelDistributionFields.equipmentBudget] as String,
    // isActive: json[TrFuelDistributionFields.isActive] as String,
    // createdBy: json[TrFuelDistributionFields.createdBy] as String,
    created_at: json[TrFuelDistributionFields.created_at] as String,
    // updatedBy: json[TrFuelDistributionFields.updatedBy] as String,
    // updatedAt: json[TrFuelDistributionFields.updatedAt] as String,
    // attendaceId: json[TrFuelDistributionFields.attendaceId] as String,
  );

  Map<String, Object?> toJson() => {
    // TrFuelDistributionFields.id: id,
    // TrFuelDistributionFields.transactionsId: transactionsId,
    TrFuelDistributionFields.equipment_id: equipment_id,
    // TrFuelDistributionFields.storage_id: storage_id,
    // TrFuelDistributionFields.site_id: site_id,
    // TrFuelDistributionFields.shiftId: shiftId,
    TrFuelDistributionFields.fuel_filling: fuel_filling,
    TrFuelDistributionFields.fuel_totalisator_awal: fuel_totalisator_awal,
    TrFuelDistributionFields.fuel_totalisator_akhir: fuel_totalisator_akhir,
    TrFuelDistributionFields.hm_equipment: hm_equipment,
    // TrFuelDistributionFields.storage_operator: storage_operator,
    // TrFuelDistributionFields.equipment_operator: equipment_operator,
    // TrFuelDistributionFields.equipmentBudget: equipmentBudget,
    // TrFuelDistributionFields.isActive: isActive,
    // TrFuelDistributionFields.createdBy: createdBy,
    TrFuelDistributionFields.created_at: created_at,
    // TrFuelDistributionFields.updatedBy: updatedBy,
    // TrFuelDistributionFields.updatedAt: updatedAt,
    // TrFuelDistributionFields.attendaceId: attendaceId,
  };


}
