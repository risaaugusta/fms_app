final String tableEmployee = 'MsEmployee';

class MsEmployeeFields {
  static final List<String> values = [
    EmployeeID,
    EmployeeName,
    EmployeeAddress,
    EmployeePhone,
    positionID ,
    SiteId,
    DeptID,
    CreatedBy,
    UpdatedBy ,
    created_at,
    UpdatedBy,
    created_at,
    EMAIL_ADDRESS,
  ];

  static final String EmployeeID = 'EmployeeID';
  static final String EmployeeName = 'EmployeeName';
  static final String EmployeeAddress = 'EmployeeAddress';
  static final String EmployeePhone = 'EmployeePhone';
  static final String positionID = 'positionID';
  static final String SiteId = 'SiteId';
  static final String DeptID = 'DeptID';
  static final String CreatedBy = 'CreatedBy';
  static final String created_at = 'created_at';
  static final String UpdatedBy = 'UpdatedBy';
  static final String updated_at = 'updated_at';
  static final String EMAIL_ADDRESS = 'EMAIL_ADDRESS';
}

class MsEmployee {
  String EmployeeID;
  String EmployeeName;
  String EmployeeAddress;
  double EmployeePhone;
  String positionID;
  String SiteId;
  String DeptID;
  String CreatedBy;
  String UpdatedBy;
  String created_at;
  String updated_at;
  String EMAIL_ADDRESS;

  MsEmployee({
    required this.EmployeeID,
    required this.EmployeeName,
    required this.EmployeeAddress,
    required this.EmployeePhone,
    required this.positionID,
    required this.SiteId,
    required this.DeptID,
    required this.CreatedBy,
    required this.UpdatedBy,
    required this.created_at,
    required this.updated_at,
    required this.EMAIL_ADDRESS,
  });

  MsEmployee copy({
    String? EmployeeID,
    String? EmployeeName,
    String? EmployeeAddress,
    double? EmployeePhone,
    String? positionID,
    String? SiteId,
    String? DeptID,
    String? CreatedBy,
    String? created_at,
    String? UpdatedBy,
    String? updated_at,
    String? EMAIL_ADDRESS,
  }) =>
      MsEmployee(
        EmployeeID: EmployeeID ?? this.EmployeeID,
        EmployeeName: EmployeeName ?? this.EmployeeName,
        EmployeeAddress: EmployeeAddress ?? this.EmployeeAddress,
        EmployeePhone: EmployeePhone ?? this.EmployeePhone,
        positionID: positionID ?? this.positionID,
        SiteId: SiteId ?? this.SiteId,
        DeptID: DeptID ?? this.DeptID,
        CreatedBy: CreatedBy ?? this.CreatedBy,
        UpdatedBy: UpdatedBy ?? this.UpdatedBy,
        created_at: created_at ?? this.created_at,
        updated_at: updated_at ?? this.updated_at,
        EMAIL_ADDRESS: EMAIL_ADDRESS ?? this.EMAIL_ADDRESS,
      );

  static MsEmployee fromJson(Map<String, Object?> json) => MsEmployee(
    EmployeeID: json[MsEmployeeFields.EmployeeID] as String,
    EmployeeName: json[MsEmployeeFields.EmployeeName] as String,
    EmployeeAddress: json[MsEmployeeFields.EmployeeAddress] as String,
    EmployeePhone: json[MsEmployeeFields.EmployeePhone] as double,
    positionID: json[MsEmployeeFields.positionID] as String,
    SiteId: json[MsEmployeeFields.SiteId] as String,
    DeptID: json[MsEmployeeFields.DeptID] as String,
    CreatedBy: json[MsEmployeeFields.CreatedBy] as String,
    UpdatedBy: json[MsEmployeeFields.UpdatedBy] as String,
    created_at: json[MsEmployeeFields.created_at] as String,
    updated_at: json[MsEmployeeFields.updated_at] as String,
    EMAIL_ADDRESS: json[MsEmployeeFields.EMAIL_ADDRESS] as String,
  );

  Map<String, Object?> toJson() => {
    MsEmployeeFields.EmployeeID: EmployeeID,
    MsEmployeeFields.EmployeeName: EmployeeName,
    MsEmployeeFields.EmployeeAddress: EmployeeAddress,
    MsEmployeeFields.EmployeePhone: EmployeePhone,
    MsEmployeeFields.positionID: positionID,
    MsEmployeeFields.SiteId: SiteId,
    MsEmployeeFields.DeptID: DeptID,
    MsEmployeeFields.CreatedBy: CreatedBy,
    MsEmployeeFields.created_at: created_at,
    MsEmployeeFields.UpdatedBy: UpdatedBy,
    MsEmployeeFields.created_at: created_at,
    MsEmployeeFields.updated_at: updated_at,
    MsEmployeeFields.EMAIL_ADDRESS: EMAIL_ADDRESS,
  };
}
