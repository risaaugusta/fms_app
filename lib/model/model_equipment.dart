part of '../database/db_package.dart';

class MsEquipment{
  final String equipment_id;
  final String manufacturer;
  final String model_number;
  final double tank_capacity;
  final String category;
  final String category_desc;
  final String auth_group;
  final String auth_text;
  final String company_code;
  final String created_at;
  final double load_capacity;
  final double load_capacity_unit;

  MsEquipment({
    this.equipment_id ='',
    this.manufacturer = '',
    this.model_number = '',
    this.tank_capacity = 0,
    this.category = '',
    this.category_desc = '',
    this.auth_group = '',
    this.auth_text = '',
    this.company_code = '',
    this.created_at = '',
    this.load_capacity = 0,
    this.load_capacity_unit = 0,
  });

  factory MsEquipment.fromJson(Map<String, dynamic> json) {
    return MsEquipment(
      equipment_id: json['equipment_id'] != null ? json['equipment_id'] : '',
      manufacturer: json['manufacturer'] != null ? json['manufacturer'] : '',
      model_number: json['model_number'] != null ? json['model_number'] : '',
      tank_capacity: json['tank_capacity'] as double,
      category: json['category'] != null ? json['category'] : '',
      category_desc: json['category_desc'] != null ? json['category_desc'] : '',
      auth_group: json['auth_group'] != null ? json['auth_group'] : '',
      auth_text: json['auth_text'] != null ? json['auth_text'] : '',
      company_code: json['company_code'] != null ? json['company_code'] : '',
      created_at: json['created_at'] != null ? json['created_at'] : '',
      load_capacity: json['load_capacity'] as double,
      load_capacity_unit: json['load_capacity_unit'] as double,
    );
  }

  // Fetch Ms Equipment Data
  List<dynamic> msequipmentDataFuture = [];
  Future<List<dynamic>> fetchMsEquipment(String equipmentIdValue) async{
    msequipmentDataFuture = await FMSdb().fetchMsEquipment(equipmentIdValue);
    return msequipmentDataFuture ;
  }
}