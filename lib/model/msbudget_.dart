// To parse this JSON data, do
//
//     final msbudget = msbudgetFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';
final String tableBudget = 'msbudget';
Msbudget msbudgetFromMap(String str) => Msbudget.fromMap(json.decode(str));

class Msbudget {
  Msbudget({
    @required this.success,
    @required this.message,
    @required this.data,
  });

  final bool? success;
  final String? message;
  final List<Datum>? data;

  factory Msbudget.fromMap(Map<String, dynamic> json) => Msbudget(
    success: json["Success"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
  );

}

class Datum {
  Datum({
    @required this.budgetId,
    @required this.equipmentId,
    @required this.siteId,
    @required this.fuelConsumption,
    @required this.modelNumber,
  });

  final int? budgetId;
  final String? equipmentId;
  final String? siteId;
  final String? fuelConsumption;
  final String? modelNumber;

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    budgetId: json["budget_id"],
    equipmentId: json["equipment_id"],
    siteId: json["site_id"],
    fuelConsumption: json["fuel_consumption"],
    modelNumber: json["model_number"],
  );

  Map<String,dynamic> toJson() => {
    "budget_id": budgetId,
    "equipment_id": equipmentId,
    "site_id": siteId,
    "fuel_consumption": fuelConsumption,
    "model_number": modelNumber,
  };
}
