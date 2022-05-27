final String tableStorage = 'msstorage';

class MsStorageFields {
  static final List<String> values = [
    storageId,
    unitId,
    storageCode,
    sLocDescription,
    capacity,
    isAudited,
    isActive,
    dateTime,
    createdBy,
    createdTime,
    modifiedBy,
    modifiedTime,
    siteID
  ];

  static final String storageId = 'storageId';
  static final String unitId = 'unitId';
  static final String storageCode = 'storageCode';
  static final String sLocDescription = 'sLocDescription';
  static final String capacity = 'capacity';
  static final String isAudited = 'isAudited';
  static final String isActive = 'isActive';
  static final String dateTime = 'dateTime';
  static final String createdBy = 'createdBy';
  static final String createdTime = 'createdTime';
  static final String modifiedBy = 'modifiedBy';
  static final String modifiedTime = 'modifiedTime';
  static final String siteID = 'siteID';
}

class MsStorage {
  String storageId;
  String unitId;
  String storageCode;
  String sLocDescription;
  String capacity;
  String isAudited;
  String isActive;
  String dateTime;
  String createdBy;
  String createdTime;
  String modifiedBy;
  String modifiedTime;
  String siteID;

  MsStorage({
    required this.storageId,
    required this.unitId,
    required this.storageCode,
    required this.sLocDescription,
    required this.capacity,
    required this.isAudited,
    required this.isActive,
    required this.dateTime,
    required this.createdBy,
    required this.createdTime,
    required this.modifiedBy,
    required this.modifiedTime,
    required this.siteID
  });

  MsStorage copy({
    String? storageId,
    String? unitId,
    String? storageCode,
    String? sLocDescription,
    String? capacity,
    String? isAudited,
    String? isActive,
    String? dateTime,
    String? createdBy,
    String? createdTime,
    String? modifiedBy,
    String? modifiedTime,
    String? siteID,
  }) =>
      MsStorage(
        storageId: storageId ?? this.storageId,
        unitId: unitId ?? this.unitId,
        storageCode: storageCode ?? this.storageCode,
        sLocDescription: sLocDescription ?? this.sLocDescription,
        capacity: capacity ?? this.capacity,
        isAudited: isAudited ?? this.isAudited,
        isActive: isActive ?? this.isActive,
        dateTime: dateTime ?? this.dateTime,
        createdBy: createdBy ?? this.createdBy,
        createdTime: createdBy ?? this.createdTime,
        modifiedBy: createdBy ?? this.modifiedBy,
        modifiedTime: createdBy ?? this.modifiedTime,
        siteID: createdBy ?? this.siteID,
      );

  static MsStorage fromJson(Map<String, Object?> json) => MsStorage(
    storageId: json[MsStorageFields.storageId] as String,
    unitId: json[MsStorageFields.unitId] as String,
    storageCode: json[MsStorageFields.storageCode] as String,
    sLocDescription: json[MsStorageFields.sLocDescription] as String,
    capacity: json[MsStorageFields.capacity] as String,
    isAudited: json[MsStorageFields.isAudited] as String,
    isActive: json[MsStorageFields.isActive] as String,
    dateTime: json[MsStorageFields.dateTime] as String,
    createdBy: json[MsStorageFields.createdBy] as String,
    createdTime: json[MsStorageFields.createdTime] as String,
    modifiedBy: json[MsStorageFields.modifiedBy] as String,
    modifiedTime: json[MsStorageFields.modifiedTime] as String,
    siteID: json[MsStorageFields.siteID] as String,
  );

  Map<String, Object?> toJson() => {
    MsStorageFields.storageId: storageId,
    MsStorageFields.unitId: unitId,
    MsStorageFields.storageCode: storageCode,
    MsStorageFields.sLocDescription: sLocDescription,
    MsStorageFields.capacity: capacity,
    MsStorageFields.isAudited: isAudited,
    MsStorageFields.isActive: isActive,
    MsStorageFields.dateTime: dateTime,
    MsStorageFields.createdBy: createdBy,
    MsStorageFields.createdTime: createdTime,
    MsStorageFields.modifiedBy: modifiedBy,
    MsStorageFields.modifiedTime: modifiedTime,
    MsStorageFields.siteID: siteID,
  };
}
