final String tableEquipment = 'MsEquipment';

class MsEquipmentFields {
  static final List<String> values = [
   equipment_id,
   manufacturer,
   model_number,
   tank_capacity,
   category,
   category_desc,
   auth_group,
   auth_text,
   company_code,
    changed_by_system,
    created_by,
   created_at,
    updatedBy,
    updated_at,
   load_category,
   load_category_unit,
  ];

  static final String equipment_id = 'equipment_id';
  static final String manufacturer = 'manufacturer';
  static final String model_number = 'model_number';
  static final String tank_capacity = 'tank_capacity';
  static final String category = 'category';
  static final String category_desc = 'category_desc';
  static final String auth_group = 'auth_group';
  static final String auth_text = 'auth_text';
  static final String company_code = 'company_code';
  static final String changed_by_system = 'changed_by_system';
  static final String created_by = 'created_by';
  static final String created_at = 'created_at';
  static final String updatedBy = 'updatedBy';
  static final String updated_at = 'updated_at';
  static final String load_category = 'load_category';
  static final String load_category_unit = 'load_category_unit';
}

class MsEquipment {
  String equipment_id;
  String manufacturer;
  String model_number;
  double tank_capacity;
  String category;
  String category_desc;
  String auth_group;
  String auth_text;
  String company_code;
  String changed_by_system;
  String created_by;
  String created_at;
  String updatedBy;
  String updated_at;
  String load_category;
  String load_category_unit;

  MsEquipment({
    required this.equipment_id,
    required this.manufacturer,
    required this.model_number,
    required this.tank_capacity,
    required this.category,
    required this.category_desc,
    required this.auth_group,
    required this.auth_text,
    required this.company_code,
    required this.changed_by_system,
    required this.created_by,
    required this.created_at,
    required this.updatedBy,
    required this.updated_at,
    required this.load_category,
    required this.load_category_unit,
  });

  MsEquipment copy({
    String? equipment_id,
    String? manufacturer,
    String? model_number,
    double? tank_capacity,
    String? category,
    String? category_desc,
    String? auth_group,
    String? auth_text,
    String? company_code,
    String? changed_by_system,
    String? created_by,
    String? created_at,
    String? updatedBy,
    String? updated_at,
    String? load_category,
    String? load_category_unit,
  }) =>
      MsEquipment(
        equipment_id: equipment_id ?? this.equipment_id,
        manufacturer: manufacturer ?? this.manufacturer,
        model_number: model_number ?? this.model_number,
        tank_capacity: tank_capacity ?? this.tank_capacity,
        category: category ?? this.category,
        category_desc: category_desc ?? this.category_desc,
        auth_group: auth_group ?? this.auth_group,
        auth_text: auth_text ?? this.auth_text,
        company_code: company_code ?? this.company_code,
        changed_by_system: changed_by_system ?? this.changed_by_system,
        created_by: created_by ?? this.created_by,
        created_at: company_code ?? this.created_at,
        updatedBy: updatedBy ?? this.updatedBy,
        updated_at: updated_at ?? this.updated_at,
        load_category: company_code ?? this.load_category,
        load_category_unit: company_code ?? this.load_category_unit,
      );

  static MsEquipment fromJson(Map<String, Object?> json) => MsEquipment(
    equipment_id: json[MsEquipmentFields.equipment_id] as String,
    manufacturer: json[MsEquipmentFields.manufacturer] as String,
    model_number: json[MsEquipmentFields.model_number] as String,
    tank_capacity: json[MsEquipmentFields.tank_capacity] as double,
    category: json[MsEquipmentFields.category] as String,
    category_desc: json[MsEquipmentFields.category_desc] as String,
    auth_group: json[MsEquipmentFields.auth_group] as String,
    auth_text: json[MsEquipmentFields.auth_text] as String,
    company_code: json[MsEquipmentFields.company_code] as String,
    changed_by_system: json[MsEquipmentFields.changed_by_system] as String,
    created_by: json[MsEquipmentFields.created_by] as String,
    created_at: json[MsEquipmentFields.created_at] as String,
    updatedBy: json[MsEquipmentFields.updatedBy] as String,
    updated_at: json[MsEquipmentFields.updated_at] as String,
    load_category: json[MsEquipmentFields.load_category] as String,
    load_category_unit: json[MsEquipmentFields.load_category_unit] as String,
  );

  Map<String, Object?> toJson() => {
    MsEquipmentFields.equipment_id: equipment_id,
    MsEquipmentFields.manufacturer: manufacturer,
    MsEquipmentFields.model_number: model_number,
    MsEquipmentFields.tank_capacity: tank_capacity,
    MsEquipmentFields.category: category,
    MsEquipmentFields.category_desc: category_desc,
    MsEquipmentFields.auth_group: auth_group,
    MsEquipmentFields.auth_text: auth_text,
    MsEquipmentFields.company_code: company_code,
    MsEquipmentFields.changed_by_system: changed_by_system,
    MsEquipmentFields.created_by: created_by,
    MsEquipmentFields.created_at: created_at,
    MsEquipmentFields.updatedBy: updatedBy,
    MsEquipmentFields.updated_at: updated_at,
    MsEquipmentFields.load_category: load_category,
    MsEquipmentFields.load_category_unit: load_category_unit,
  };
}
