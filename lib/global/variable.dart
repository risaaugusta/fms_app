part of '../ui/pages/pages.dart';

class Refueling{
  static String fFilling='';
  static String fTotalisatorAwal='';
  static String fTotalisatorAkhir='';
  static String fHmEquipment='';
  static String fStorageOperator='';
  static String fEquipmentOperator='';
}

class FuelTransfer{
  static String tTransactionsId='';
  static String tSiteId='';
  static String tShiftId='';
  static int tStorageSource=0;
  static int tFlowmeterSource=0;
  static int tTotalisatorSourceBegin=0;
  static int tTotalisatorSourceEnd=0;
  static int tStorageDestination=0;
  static int tFlowmeterDst=0;
  static int tTotalisatorDstBegin=0;
  static int tTotalisatorDstEnd=0;
  static int tAttendanceId=0;
  static String tApprovalId='';
  static String tIsActive='';
  static String tCreatedBy='';
  static String tCreatedAt='';
  static String tModifiedBy='';
  static String tModifiedAt='';
}

class Baps{
  static String bBapsId='';
  static String bSiteId='';
  static String bShiftId='';
  static int bOperatorId=0;
  static String bApprovalId='';
  static String bNotes='';
  static String bBapsStatus='';
  static String bCreatedBy='';
  static String bCreatedAt='';
  static String bModifiedBy='';
  static String bModifiedAt='';
}

class Equipment{
  static String eEquipmentId= '';
  static String eManufacturer='';
  static String eModelNumber='';
  static double eTankCapacity=0;
  static String eCategory='';
  static String category_desc='';
  static String auth_group='';
  static String auth_text='';
  static String company_code='';
  static String changed_by_system='';
  static String created_by='';
  static String created_at='';
  static String updatedBy='';
  static String updated_at='';
  static String load_category='';
  static String load_category_unit='';
}

class Attendance{
  static int attendance_id=0;
  static String site_id='';
  static String equipment_id='';
  static String shift_id='';
  static int operator_id=0;
  static String login_at='';
  static String updated_by='';
  static String updated_at='';
  static String is_active='';
  static String phone_id='';
}

class Distribution{
  static int transactions_id=0;
  static String equipment_id='';
  static String fuel_filling='';
  static int fuel_totalisator_awal=0;
  static int fuel_totalisator_akhir=0;
  static String hm_equipment='';
  static String created_at='';
  static String updated_at='';
  static int total = fuel_totalisator_awal + fuel_totalisator_akhir;
}

class Global{
  static String time = formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd, ' ', HH, ':', nn,':',ss]);
}

