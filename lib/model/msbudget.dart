// final String tableBudget = 'msbudget';
//
// class MsBudgetFields {
//   static final List<dynamic> values = [
//     budget_id,
//     equipment_id,
//     site_id,
//     fuel_consumption
//   ];
//
//   static final String budget_id = 'budget_id';
//   static final String equipment_id = 'equipment_id';
//   static final String site_id = 'site_id';
//   static final String fuel_consumption = 'fuel_consumption';
// }
//
// class MsBudget {
//   String budget_id;
//   String equipment_id;
//   String site_id;
//   String fuel_consumption;
//
//   MsBudget({
//     required this.budget_id,
//     required this.equipment_id,
//     required this.site_id,
//     required this.fuel_consumption
//   });
//
//   MsBudget copy({
//     String? budget_id,
//     String? equipment_id,
//     String? site_id,
//     String? fuel_consumption
//   }) =>
//       MsBudget(
//           budget_id: budget_id ?? this.budget_id,
//           equipment_id: equipment_id ?? this.equipment_id,
//           site_id: site_id ?? this.site_id,
//           fuel_consumption: fuel_consumption ?? this.site_id
//       );
//
//   static MsBudget fromJson(Map<String, Object?> json) => MsBudget(
//       budget_id: json[MsBudgetFields.budget_id] as String,
//       equipment_id: json[MsBudgetFields.equipment_id] as String,
//       site_id: json[MsBudgetFields.site_id] as String,
//       fuel_consumption: json[MsBudgetFields.fuel_consumption] as String
//   );
//
//   Map<String, Object?> toJson() => {
//     MsBudgetFields.budget_id: budget_id,
//     MsBudgetFields.equipment_id: equipment_id,
//     MsBudgetFields.site_id: site_id,
//     MsBudgetFields.fuel_consumption: fuel_consumption
//   };
// }
