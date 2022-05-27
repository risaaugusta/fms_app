// To parse this JSON data, do
//
//     final msrefueling = msrefuelingFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';
final String tableLastRefueling = 'history_refueling';
Msrefueling msrefuelingFromMap(String str) => Msrefueling.fromMap(json.decode(str));

class Msrefueling {
  Msrefueling({
    @required this.success,
    @required this.message,
    @required this.data,
  });

  final bool? success;
  final String? message;
  final List<Refuel>? data;

  factory Msrefueling.fromMap(Map<String, dynamic> json) => Msrefueling(
    success: json["Success"],
    message: json["message"],
    data: List<Refuel>.from(json["data"].map((x) => Refuel.fromMap(x))),
  );
}

class Refuel {
  Refuel({
    @required this.refuelingId,
    @required this.unitCode,
    @required this.unitType,
    @required this.hmInput,
    @required this.namaOperator,
    @required this.totalisatorBegin,
    @required this.totalisatorEnd,
    @required this.fuelConsumption,
    @required this.budget,
    this.photoMeterFuel,
    this.photoHmUnit,
    @required this.shiftId,
    @required this.siteId,
    @required this.createdBy,
    @required this.createdAt,
    @required this.status,
  });

  final int? refuelingId;
  final String? unitCode;
  final String? unitType;
  final String? hmInput;
  final String? namaOperator;
  final String? totalisatorBegin;
  final String? totalisatorEnd;
  final String? fuelConsumption;
  final String? budget;
  final dynamic? photoMeterFuel;
  final dynamic? photoHmUnit;
  final dynamic? shiftId;
  final String? siteId;
  final String? createdBy;
  final String? createdAt;
  final String? status;

  factory Refuel.fromMap(Map<String, dynamic> json) => Refuel(
    refuelingId: json["refueling_id"],
    unitCode: json["unit_code"],
    unitType: json["unit_type"],
    hmInput: json["hm_input"],
    namaOperator: json["nama_operator"],
    totalisatorBegin: json["totalisator_begin"],
    totalisatorEnd: json["totalisator_end"],
    fuelConsumption: json["fuel_consumption"],
    budget: json["budget"],
    photoMeterFuel: null,
    photoHmUnit: null,
    shiftId: json["shift_id"],
    siteId: json["site_id"],
    createdBy: json["created_by"],
    createdAt: json["created_at"],
    status: json["status"],
  );

  Map<String,dynamic> toJson() => {
    "refueling_id": refuelingId,
    "unit_code": unitCode,
    "unit_type": unitType,
    "hm_input": hmInput,
    "nama_operator": namaOperator,
    "totalisator_begin": totalisatorBegin,
    "totalisator_end": totalisatorEnd,
    "fuel_consumption": fuelConsumption,
    "budget": budget,
    "photo_meter_fuel": null,
    "photo_hm_unit": null,
    "shift_id": shiftId,
    "site_id": siteId,
    "created_by": createdBy,
    "created_at": createdAt,
    "status": status,
  };
}
