final String tableAttendance = 'tr_fuel_attendance';
final String tableHistoryAttendance = 'history_fuel_attendance';

class TrFuelAttendanceFields {
  static final List<String> values = [
    attendance_id,
    nik,
    employee_name,
    shift_id,
    shift_desc,
    site_id,
    storage_id,
    login_at
  ];

  static final String attendance_id = 'attendance_id';
  static final String site_id = 'site_id';
  static final String shift_id = 'shift_id';
  static final String shift_desc = 'shift_desc';
  static final String nik = 'nik';
  static final String employee_name = 'employee_name';
  static final String storage_id = 'storage_id';
  static final String login_at = 'login_at';
}

class TrFuelAttendance {
  // int attendance_id;
  String nik;
  String employee_name;
  String shift_id;
  String shift_desc;
  String storage_id;
  String site_id;
  String login_at;

  TrFuelAttendance({
    // required this.attendance_id,
    required this.employee_name,
    required this.nik,
    required this.shift_id,
    required this.site_id,
    required this.shift_desc,
    required this.storage_id,
    required this.login_at,
  });

  TrFuelAttendance copy({
    // int? attendance_id,
    String? site_id,
    String? shift_id,
    String? shift_desc,
    String? nik,
    String? employee_name,
    String? storage_id,
    String? login_at,
  }) =>
      TrFuelAttendance(
        // attendance_id: attendance_id ?? this.attendance_id,
        nik: site_id ?? this.nik,
        shift_id: shift_id ?? this.shift_id,
        shift_desc: shift_desc ?? this.shift_desc,
        site_id: site_id ?? this.site_id,
        employee_name: employee_name ?? this.employee_name,
        storage_id: storage_id ?? this.storage_id,
        login_at: login_at ?? this.login_at,
      );

  static TrFuelAttendance fromJson(Map<String, Object?> json) => TrFuelAttendance(
    // attendance_id: json[TrFuelAttendanceFields.attendance_id] as int,
    site_id: json[TrFuelAttendanceFields.site_id] as String,
    shift_id: json[TrFuelAttendanceFields.shift_id] as String,
    shift_desc: json[TrFuelAttendanceFields.shift_desc] as String,
    nik: json[TrFuelAttendanceFields.nik] as String,
    storage_id: json[TrFuelAttendanceFields.storage_id] as String,
    employee_name: json[TrFuelAttendanceFields.employee_name] as String,
    login_at: json[TrFuelAttendanceFields.login_at] as String,
  );

  Map<String, Object?> toJson() => {
    // TrFuelAttendanceFields.attendance_id: attendance_id,
    TrFuelAttendanceFields.site_id: site_id,
    TrFuelAttendanceFields.shift_id: shift_id,
    TrFuelAttendanceFields.shift_desc: shift_desc,
    TrFuelAttendanceFields.employee_name: employee_name,
    TrFuelAttendanceFields.nik: nik,
    TrFuelAttendanceFields.storage_id: storage_id,
    TrFuelAttendanceFields.login_at: login_at,
  };
}
