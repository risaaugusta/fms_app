final String tableAttendance = 'tr_fuel_attendance';

class TrFuelAttendanceFields {
  static final List<String> values = [
    attendance_id,
    site_id,
    equipment_id,
    shift_id,
    operator_id,
    login_at,
    updated_by,
    updated_at,
    is_active,
    phone_id,
  ];

  static final String attendance_id = 'attendance_id';
  static final String site_id = 'site_id';
  static final String equipment_id = 'equipment_id';
  static final String shift_id = 'shift_id';
  static final String operator_id = 'operator_id';
  static final String login_at = 'login_at';
  static final String updated_by = 'updated_by';
  static final String updated_at = 'updated_at';
  static final String is_active = 'is_active';
  static final String phone_id = 'phone_id';
}

class TrFuelAttendance {
  // int attendance_id;
  String site_id;
  String equipment_id;
  String shift_id;
  String operator_id;
  String login_at;
  // String updated_by;
  String updated_at;
  // String is_active;
  // String phone_id;

  TrFuelAttendance({
    // required this.attendance_id,
    required this.site_id,
    required this.equipment_id,
    required this.shift_id,
    required this.operator_id,
    required this.login_at,
    // required this.updated_by,
    required this.updated_at,
    // required this.is_active,
    // required this.phone_id,
  });

  TrFuelAttendance copy({
    // int? attendance_id,
    String? site_id,
    String? equipment_id,
    String? shift_id,
    String? operator_id,
    String? login_at,
    // String? updated_by,
    String? updated_at,
    // String? is_active,
    // String? phone_id,
  }) =>
      TrFuelAttendance(
        // attendance_id: attendance_id ?? this.attendance_id,
        site_id: site_id ?? this.site_id,
        equipment_id: equipment_id ?? this.equipment_id,
        shift_id: shift_id ?? this.shift_id,
        operator_id: operator_id ?? this.operator_id,
        login_at: login_at ?? this.login_at,
        // updated_by: updated_by ?? this.updated_by,
        updated_at: updated_at ?? this.updated_at,
        // is_active: is_active ?? this.is_active,
        // phone_id: is_active ?? this.phone_id,
      );

  static TrFuelAttendance fromJson(Map<String, Object?> json) => TrFuelAttendance(
    // attendance_id: json[TrFuelAttendanceFields.attendance_id] as int,
    site_id: json[TrFuelAttendanceFields.site_id] as String,
    equipment_id: json[TrFuelAttendanceFields.equipment_id] as String,
    shift_id: json[TrFuelAttendanceFields.shift_id] as String,
    operator_id: json[TrFuelAttendanceFields.operator_id] as String,
    login_at: json[TrFuelAttendanceFields.login_at] as String,
    // updated_by: json[TrFuelAttendanceFields.updated_by] as String,
    updated_at: json[TrFuelAttendanceFields.updated_at] as String,
    // is_active: json[TrFuelAttendanceFields.is_active] as String,
    // phone_id: json[TrFuelAttendanceFields.phone_id] as String,
  );

  Map<String, Object?> toJson() => {
    // TrFuelAttendanceFields.attendance_id: attendance_id,
    TrFuelAttendanceFields.site_id: site_id,
    TrFuelAttendanceFields.equipment_id: equipment_id,
    TrFuelAttendanceFields.shift_id: shift_id,
    TrFuelAttendanceFields.operator_id: operator_id,
    TrFuelAttendanceFields.login_at: login_at,
    // TrFuelAttendanceFields.updated_by: updated_by,
    TrFuelAttendanceFields.updated_at: updated_at,
    // TrFuelAttendanceFields.is_active: is_active,
    // TrFuelAttendanceFields.phone_id: phone_id,
  };
}
