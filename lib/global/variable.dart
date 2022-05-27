part of '../ui/pages/pages.dart';

class FuelTransfer{
  static String transfer_id = '';
  static String storage_source = '';
  static String totalisator_source_begin = '';
  static String get totalisator_source_end{
    String totalisatorAkhir = (double.parse(FuelTransfer.totalisator_source_begin == '' ? '0' : FuelTransfer.totalisator_source_begin)
        + double.parse(FuelTransfer.volume_pengisian == '' ? '0' : FuelTransfer.volume_pengisian)).toString();
    return totalisatorAkhir;
  }
  static String sounding_source_begin = '';
  static String sounding_source_end = '';
  static String flowmeter_source = '';
  static String volume_pengisian = '';
  static String storage_dst = '';
  static String sounding_dst_begin = '';
  static String sounding_dst_end= '';
  static String shift_id = '';
  static String site_id = '';
  static String created_by = '';
  static String created_at = '';
}

class Baps{
  static String baps_id='';
  static String baps_no='';
  static String site_id='';
  static String storage_id='';
  static String transaction_time='';
  static String sj_solar_transportir_no='';
  static String do_vendor_no='';
  static String no_po='';
  static String volume_sj_voucher='';
  static String supplier_name='';
  static String driver_name='';
  static String vehicle_no='';
  static String capacity='';
  static String material_number='SOLAR';
  static String segel_begin='';
  static String segel_end='';
  static String totalisator_begin='';
  static String get totalisator_end{
    String totalisatorAkhir = (double.parse(Baps.totalisator_begin == '' ? '0' : Baps.totalisator_begin) + double.parse(Baps.volume_pengisian == '' ? '0' : Baps.volume_pengisian)).toString();
    return totalisatorAkhir;
  }
  static String photo_totalisator_begin='';
  static String photo_totalisator_end='';
  static String sounding_begin='';
  static String  sounding_end='';
  static String  volume_pengisian='';
  static String   sg_observed='';
  static String  sg_do='';
  static String get deviation{
    String deviation = (double.parse(Baps.volume_sj_voucher == '' ? '0' : Baps.volume_sj_voucher) - double.parse(Baps.volume_pengisian == '' ? '0' : Baps.volume_pengisian)).toString();
    return deviation;
  }
  static String  temp_observed='';
  static String  temp_do='';
  static String  driver_signing='';
  static String  witness_signing='';
  static String  witness_name='';
  static String  receiver_signing='';
  static String  receiver_name='';
  static String  created_by='';
  static String  created_at='';
  static String  modified_by='';
  static String  modified_at='';
}

class Sounding{
  static String sounding_id='';
  static String site_id='';
  static String shift_id='';
  static String sounding='';
  static String storage_id='';
  static String created_by='';
  static String created_at='';
}

class Refueling{
  static String refueling_id='';
  static String unit_code='';
  static String unit_type='';
  static String hm_input='';
  static String nama_operator='';
  static String totalisator_begin='';
  static String get totalisator_end{
    String totalisatorEnd = (double.parse(Refueling.totalisator_begin == '' ? '0' : Refueling.totalisator_begin) + double.parse(Refueling.fuel_consumption == '' ? '0' : Refueling.fuel_consumption)).toString();
    return totalisatorEnd;
  }
  static String fuel_consumption='';
  // static String last_hm= (Global.trRefueling[0]).toString();
  // static String budget =  (Global.trRefueling[0]).toString() ;
  static Future<String> get budget_  async {
    double last_hm = await Global.getHmInput();
    double budget =  await Global.getFuelConsumption();
    String budget_ = (budget == null ? 0 : budget * (last_hm == null ? 0 : last_hm - double.parse(Refueling.hm_input == '' ? '0' : Refueling.hm_input))).toString();
    return budget_;
  }

  static String get budget   {
    double last_hm = (Global.trRefueling[0]['hm_input']);
    double budget =   (Global.msbudget[0]['fuel_consumption']);
    String budget_ = (budget == '' ? '0' : budget * (last_hm == null ? 0 : last_hm - double.parse(Refueling.hm_input == '' ? '0' : Refueling.hm_input))).toString();
    return budget_;
  }

  static String get status{
    if (double.parse(Refueling.fuel_consumption == '' ? '0' : Refueling.fuel_consumption) > double.parse(Refueling.budget == '' ? '0' : Refueling.budget)){
      String status = 'Over';
      return status;
    }else if(double.parse(Refueling.fuel_consumption == '' ? '0' : Refueling.fuel_consumption) < double.parse(Refueling.budget == '' ? '0' : Refueling.budget)){
      String status = 'Kurang';
      return status;
    }else{
      String status = 'Normal';
      return status;
    }
  }
  static String photo_meter_fuel='';
  static String photo_hm_unit='';
  static String created_by='';
  static String created_at='';
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
  static String attendance_id='';
  static String site_id='';
  static String employeeName='';
  static String shift_id='';
  static String shift_desc='';
  static String storage_id='';
  static String nik='';
  static String login_at='';
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

class UpdatePassword{
  static String current_password='';
  static String new_password='';
  static String password_confirmation='';
}

class Global{
  static Future<List<Map>> getData() async {
     List<Map> attendance = await FmsDatabase.instance.readHistoryAttendance();
     List<Map> baps = await FmsDatabase.instance.readBaps();
     List<Map> sounding = await FmsDatabase.instance.readSounding();
     List<Map> transfer = await FmsDatabase.instance.readTransfer();
     List<Map> refueling = await FmsDatabase.instance.readRefueling();

     List<Map> join = [...attendance.map((e) => {'created_at': e['login_at'], 'text': "Data Baru Attendance", 'type':'attendance','id':e['attendance_id'], 'check': false}),
       ...baps.map((e) => {'created_at': e['created_at'], 'text': "Data Baru BAPS",'type':'baps','id':e['baps_id'],'check': false}),
       ...sounding.map((e) => {'created_at': e['created_at'], 'text': "Data Baru Sounding",'type':'sounding','id':e['sounding_id'],'check': false}),
       ...transfer.map((e) => {'created_at': e['created_at'], 'text': "Data Baru Transfer",'type':'transfer','id':e['transfer_id'],'check': false}),
       ...refueling.map((e) => {'created_at': e['created_at'], 'text': "Data Baru Refueling",'type':'refueling','id':e['refueling_id'],'check': false})];
     join.removeWhere((e) => e["created_at"] == null);
     return join;
  }

  static Future<List<Map>> getHistory() async {
    List<Map> historyRefueling = await FmsDatabase.instance.readHistoryRefueling();
    List<Map> refueling = await FmsDatabase.instance.readRefueling();

    List<Map> join = [
      ...historyRefueling.map((e) => {'created_at': e['created_at'], 'unit_code':e['unit_code'], 'fuel_consumption': e['fuel_consumption']}),
      ...refueling.map((e) => {'created_at': e['created_at'], 'unit_code':e['unit_code'], 'fuel_consumption': e['fuel_consumption']})];
    join.removeWhere((e) => e["created_at"] == null);
    return join;
  }
  static String time = formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd, ' ', HH, ':', nn,':',ss]);
  static String bapsTime = formatDate(DateTime.now(), [yyyy, '/', mm, ]);
  static String today = formatDate(DateTime.now(), [HH, '.', nn, ]);
  static DateTime newDate = DateTime.now();
  static int notifTime = newDate.subtract(Duration(hours: newDate.hour, minutes: newDate.minute)).millisecondsSinceEpoch;
  static int limitTime = newDate.subtract(Duration(hours: 18, minutes: 00)).millisecondsSinceEpoch;
  static String pathTtd='';
  static String host='http://10.10.0.223';
  static String nik ='';
  static String username ='';
  static String password ='';
  static String email ='';
  static String kode ='';
  static String barcode ='';
  static String SiteId ='';
  static int duration = 0;
  static String StorageId ='';
  static String ShiftId ='';
  static String equipmentStatusDownloaded ='';
  static String employeeStatusDownloaded ='';
  static String shiftStatusDownloaded ='';
  static String storageStatusDownloaded ='';
  static String siteStatusDownloaded ='';
  static String budgetStatusDownloaded ='';
  static String refuelingStatusDownloaded ='';
  static String bapsSynchStatus ='';
  static String soundingSynchStatus ='';
  static String transferSynchStatus ='';
  static String refuelingSynchStatus ='';
  static String attendanceSynchStatus ='';
  static List<Map> Attendance = [];
  static List<Map> msbudget = [];
  static List<Map> trRefueling = [];
  static List<Map> historyRefueling = [];

  static Base64String(Uint8List data) {
    return base64Encode(data);
  }

  static getLocalStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    nik =  (await prefs.getString("nik"))!;
    username = (await prefs.getString("username"))!;
    barcode = (await prefs.getString("barcode"))!;
    SiteId = (await prefs.getString("SiteId"))!;
    duration = (await prefs.getInt("duration"))!;
    Attendance = await FmsDatabase.instance.readAttendance();
    msbudget = await FmsDatabase.instance.readBudget(barcode);
    historyRefueling = await FmsDatabase.instance.readLastRefueling(barcode);
    trRefueling = await FmsDatabase.instance.readLastRefueling(barcode);
  }

  static Future<double> getHmInput() async {
    return (await FmsDatabase.instance.readLastRefueling(barcode))[0]['hm_input'];
  }

  static Future<double> getFuelConsumption() async {
    return (await FmsDatabase.instance.readBudget(barcode))[0]['fuel_consumption'];
  }

  static clearStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', '');
    await prefs.setString('username', '');
    await prefs.setString('nik', '');
    await prefs.setString('barcode', '');
    await prefs.setString('SiteId', '');
    await FmsDatabase.instance.dropAllAttendance();
    await FmsDatabase.instance.dropAllHistoryAttendance();
    await FmsDatabase.instance.dropAllBaps();
    await FmsDatabase.instance.dropHistoryRefueling();
    await FmsDatabase.instance.dropBudget();
    await FmsDatabase.instance.dropShift();
    await FmsDatabase.instance.dropStorage();
    await FmsDatabase.instance.dropEmployee();
    await FmsDatabase.instance.dropEquipment();
    await FmsDatabase.instance.dropAllSounding();
    await FmsDatabase.instance.dropAllTransfer();
    await FmsDatabase.instance.dropAllRefueling();
  }


}
