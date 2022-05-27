final String tableEquipment = 'msequipment';

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
     createdBy,
   created_at,
    updatedBy,
    updated_at,
   load_capacity,
   load_capacity_unit,
   planner_group,
   main_work_center
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
  static final String  createdBy = ' createdBy';
  static final String created_at = 'created_at';
  static final String updatedBy = 'updatedBy';
  static final String updated_at = 'updated_at';
  static final String load_capacity = 'load_capacity';
  static final String load_capacity_unit = 'load_capacity_unit';
  static final String planner_group = 'planner_group';
  static final String main_work_center = 'main_work_center';
}

class MsEquipment {
  String equipment_id;
  String manufacturer;
  String model_number;
  String tank_capacity;
  String category;
  String category_desc;
  String auth_group;
  String auth_text;
  String company_code;
  String changed_by_system;
  String  createdBy;
  String created_at;
  String updatedBy;
  String updated_at;
  String load_capacity;
  String load_capacity_unit;
  String planner_group;
  String main_work_center;

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
    required this. createdBy,
    required this.created_at,
    required this.updatedBy,
    required this.updated_at,
    required this.load_capacity,
    required this.load_capacity_unit,
    required this.planner_group,
    required this.main_work_center
  });

  MsEquipment copy({
    String? equipment_id,
    String? manufacturer,
    String? model_number,
    String? tank_capacity,
    String? category,
    String? category_desc,
    String? auth_group,
    String? auth_text,
    String? company_code,
    String? changed_by_system,
    String?  createdBy,
    String? created_at,
    String? updatedBy,
    String? updated_at,
    String? load_capacity,
    String? load_capacity_unit,
    String? planner_group,
    String? main_work_center
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
         createdBy:  createdBy ?? this. createdBy,
        created_at: company_code ?? this.created_at,
        updatedBy: updatedBy ?? this.updatedBy,
        updated_at: updated_at ?? this.updated_at,
        load_capacity: load_capacity ?? this.load_capacity,
        load_capacity_unit: load_capacity ?? this.load_capacity_unit,
        planner_group: planner_group ?? this.planner_group,
        main_work_center: main_work_center ?? this.main_work_center
      );

  static MsEquipment fromJson(Map<String, dynamic> json) => MsEquipment(
    equipment_id: json[MsEquipmentFields.equipment_id] as String,
    manufacturer: json[MsEquipmentFields.manufacturer] as String,
    model_number: json[MsEquipmentFields.model_number] as String,
    tank_capacity: json[MsEquipmentFields.tank_capacity] as String,
    category: json[MsEquipmentFields.category] as String,
    category_desc: json[MsEquipmentFields.category_desc] as String,
    auth_group: json[MsEquipmentFields.auth_group] as String,
    auth_text: json[MsEquipmentFields.auth_text] as String,
    company_code: json[MsEquipmentFields.company_code] as String,
    changed_by_system: json[MsEquipmentFields.changed_by_system] as String,
     createdBy: json[MsEquipmentFields. createdBy] as String,
    created_at: json[MsEquipmentFields.created_at] as String,
    updatedBy: json[MsEquipmentFields.updatedBy] as String,
    updated_at: json[MsEquipmentFields.updated_at] as String,
    load_capacity: json[MsEquipmentFields.load_capacity] as String ,
    load_capacity_unit: json[MsEquipmentFields.load_capacity_unit] as String,
    planner_group: json[MsEquipmentFields.planner_group] as String,
    main_work_center: json[MsEquipmentFields.main_work_center] as String
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
    MsEquipmentFields. createdBy:  createdBy,
    MsEquipmentFields.created_at: created_at,
    MsEquipmentFields.updatedBy: updatedBy,
    MsEquipmentFields.updated_at: updated_at,
    MsEquipmentFields.load_capacity: load_capacity,
    MsEquipmentFields.load_capacity_unit: load_capacity_unit,
    MsEquipmentFields.planner_group: planner_group,
    MsEquipmentFields.main_work_center: main_work_center
  };
}
