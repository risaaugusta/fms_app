part of 'db_package.dart';

class FmsDatabase {
  static final FmsDatabase instance = FmsDatabase._init();
  static Database? _database;

  FmsDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('fms.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: createDB );
  }

  Future createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY';
    final integerType = 'INTEGER NOT NULL';
    final textType = 'TEXT NOT NULL';
    await db.execute("""CREATE TABLE $tableEmployee(
      EmployeeID $idType,
      EmployeeName text,
      EmployeeAddress text,
      EmployeePhone text,
      positionID integer,
      SiteId text,
      DeptID integer,
      CreatedBy text,
      UpdatedBy text,
      created_at text,
      updated_at text,
      EMAIL_ADDRESS text
     )""");
    await db.execute("""CREATE TABLE $tableEquipment(
      equipment_id text primary key ,
      manufacturer text,
      model_number text,
      tank_capacity real,
      category text,
      category_desc text,
      auth_group text,
      auth_text text,
      company_code text,
      changed_by_system text,
      createdBy text,
      created_at text,
      updatedBy text,
      updated_at text,
      load_capacity text,
      load_capacity_unit text,
      planner_group text,
      main_work_center text
     )""");
    await db.execute("""CREATE TABLE $tableStorage(
      storageId integer primary key autoincrement ,
      unitId text,
      storageCode text,
      sLocDescription text,
      capacity text,
      isAudited integer,
      isActive integer,
      dateTime text,
      createdBy text,
      createdTime text,
      modifiedBy text,
      modifiedTime text,
      siteID text 
     )""");
    await db.execute("""CREATE TABLE tr_fuel_attendance(
      attendance_id integer primary key autoincrement ,
      nik text,
      employee_name text,
      shift_id int,
      shift_desc text,
      site_id text,
      storage_id text,
      login_at text 
     )""");
    await db.execute("""CREATE TABLE history_fuel_attendance(
      attendance_id integer primary key autoincrement ,
      nik text,
      employee_name text,
      shift_id int,
      shift_desc text,
      site_id text,
      storage_id text,
      login_at text 
     )""");
    await db.execute("""CREATE TABLE tr_sounding(
      sounding_id integer primary key autoincrement ,
      site_id text,
      shift_id text,
      sounding text,
      storage_id text, 
      created_by text,
      created_at text
     )""");
    await db.execute("""CREATE TABLE $tableBaps(
      baps_id integer primary key autoincrement ,
      baps_no text,
      site_id text,
      storage_id text,
      transaction_time text,
      sj_solar_transportir_no text,
      do_vendor_no text,
      no_po text,
      volume_sj_voucher text,
      supplier_name text,
      driver_name text,
      vehicle_no text,
      capacity real, 
      segel_begin real,
      segel_end real,
      totalisator_begin real,
      totalisator_end real,
      photo_totalisator_begin text,
      photo_totalisator_end text,
      sounding_begin real,
      sounding_end real,
      volume_pengisian real,
      deviation real,
      sg_observed real,
      sg_do real,
      temp_observed real,
      temp_do real,
      driver_signing text,
      witness_signing text,
      witness_name text,
      receiver_signing text,
      receiver_name text,
      created_by text,
      created_at text,
      modified_by text,
      modified_at text,
      status_approval text,
      material_number text
     )""");
    await db.execute("""CREATE TABLE $tableTransfer(
      transfer_id integer primary key autoincrement,
      storage_source text,
      sounding_begin_source real,
      totalisator_begin_source real,
      volume real,
      totalisator_end_source real,
      sounding_end_source real,
      photo_flowmeter text,
      storage_dst text,
      sounding_begin_dst real,
      sounding_end_dst real,
      shift_id text,
      site_id text,
      created_by text,
      created_at text,
      material_number text
     )""");
    await db.execute("""CREATE TABLE history_refueling(
      refueling_id integer primary key autoincrement ,
      unit_code text,
      unit_type text,
      hm_input real,
      nama_operator text,
      totalisator_begin real,
      totalisator_end real,
      fuel_consumption real,
      budget real,
      status text,
      photo_meter_fuel text,
      photo_hm_unit text,
      shift_id real,  
      site_id text,  
      created_by text,
      created_at text,
      material_number text
     )""");
    await db.execute("""CREATE TABLE tr_refueling(
      refueling_id integer primary key autoincrement ,
      unit_code text,
      unit_type text,
      hm_input real,
      nama_operator text,
      totalisator_begin real,
      totalisator_end real,
      fuel_consumption real,
      budget real,
      status text,
      photo_meter_fuel text,
      photo_hm_unit text,
      shift_id text,  
      site_id text,  
      created_by text,
      created_at text,
      material_number text
     )""");
    await db.execute("""CREATE TABLE msshift(
      shift_id integer primary key autoincrement ,
      site_id text,
      ShiftName text, 
      ShiftStartTime text ,
      ShiftEndTime text  
     )""");
    await db.execute("""CREATE TABLE msbudget(
      budget_id integer primary key autoincrement ,
      equipment_id text,
      site_id text,
      fuel_consumption real,
      model_number text
     )""");
  }


  Future<TrFuelTransfer> createTransfer(TrFuelTransfer trFuelTransfer) async {
    final db = await instance.database;
    final json = trFuelTransfer.toJson();

    final id = await db.insert(tableTransfer, trFuelTransfer.toJson());
    return trFuelTransfer.copy(storage_source: TrFuelTransferFields.storage_source);
  }

  Future<TrBaps> createBaps(TrBaps trBaps) async {
    final db = await instance.database;
    final json = trBaps.toJson();
    print(trBaps.toJson());

    final id = await db.insert(tableBaps, trBaps.toJson());
    print(id);
    return trBaps.copy(baps_no: trBaps.baps_no);
  }

  Future<TrSounding> createSounding(TrSounding trSounding) async {
    final db = await instance.database;
    final json = trSounding.toJson();
    final id = await db.insert(tableSounding, trSounding.toJson());
    print(id);
    return trSounding.copy(site_id: trSounding.site_id);
  }

  // Future<TrSoundingNew> createSounding(TrSoundingNew trSounding) async {
  //   final db = await instance.database;
  //   final json = trSounding.toJson();
  //
  //   try{
  //     final id = await db.insert(tableSounding, trSounding.toJson());
  //     print("MASUK " + id.toString());
  //   }catch(e){
  //     print('Data duplikat');
  //   }
  //   return trSounding;
  // }

   updateSounding(dynamic sounding_id, dynamic is_selected) async {
    final db = await instance.database;
    await db.rawQuery('UPDATE tr_sounding SET is_selected = $is_selected WHERE sounding_id = $sounding_id');
  }

  Future<TrRefueling> createRefueling(TrRefueling trRefueling) async {
    final db = await instance.database;
    final json = trRefueling.toJson();
    print(trRefueling.toJson());
    final id = await db.insert(tableRefueling, trRefueling.toJson());
    print(id);
    return trRefueling.copy(unit_code: trRefueling.unit_code);
  }

  Future<Refuel> createLastRefueling(Refuel refueling) async {
    final db = await instance.database;

    try{
      final res = await db.insert(tableLastRefueling, refueling.toJson());
      print("MASUK " + res.toString());
    }catch(e){
      print('Data duplikat');
    }
    return refueling;
  }

  Future<MsEquipment> createEquipment(MsEquipment msEquipment) async {
    final db = await instance.database;
    final json = msEquipment.toJson();

    try{
      final id = await db.insert(tableEquipment, msEquipment.toJson());
      print("MASUK " + id.toString());
    }catch(e){
      print('Data duplikat');
    }

    return msEquipment.copy(equipment_id: msEquipment.equipment_id);
  }

  Future<MsEmployee> createEmployee(MsEmployee msEmployee) async {
    final db = await instance.database;
    final json = msEmployee.toJson();

    try{
      final id = await db.insert(tableEmployee, msEmployee.toJson());
      print("MASUK " + id.toString());
    }catch(e){
      print('Data duplikat');
    }

    return msEmployee.copy(EmployeeID: msEmployee.EmployeeID);
  }

  Future<MsShift> createShift(MsShift msShift) async {
    final db = await instance.database;
    final json = msShift.toJson();

    try{
      final id = await db.insert(tableShift, msShift.toJson());
      print("MASUK " + id.toString());
    }catch(e){
      print('Data duplikat');
    }

    // return msShift.copy(shift_id: msShift.shift_id);
    return msShift;
  }

  Future<MsStorage> createStorage(MsStorage msStorage) async {
    final db = await instance.database;
    final json = msStorage.toJson();

    try{
      final id = await db.insert(tableStorage, msStorage.toJson());
      print("MASUK " + id.toString());
    }catch(e){
      print('Data duplikat');
    }

    return msStorage.copy(storageId: msStorage.storageId);
  }

  Future<Datum> createBudget(Datum msBudget) async {
    final db = await instance.database;

    try{
      final res = await db.insert(tableBudget, msBudget.toJson());
      print("MASUK " + res.toString());
    }catch(e){
      print('Data duplikat');
    }
    return msBudget;
  }

  Future<TrFuelAttendance> createAttendance(TrFuelAttendance trFuelAttendance) async {
    final db = await instance.database;
    final json = trFuelAttendance.toJson();
    print(trFuelAttendance.toJson());

    final id = await db.insert(tableAttendance, trFuelAttendance.toJson());
    return trFuelAttendance.copy(nik: trFuelAttendance.nik);
  }

  Future<TrFuelAttendance> createHistoryAttendance(TrFuelAttendance trFuelAttendance) async {
    final db = await instance.database;
    final json = trFuelAttendance.toJson();

    final id = await db.insert(tableHistoryAttendance, trFuelAttendance.toJson());
    return trFuelAttendance.copy(nik: trFuelAttendance.nik);
  }

  Future<List<Map>> readBaps() async {
    final db = await instance.database;

    final result = await db.rawQuery('SELECT * from tr_baps');
    return result;
  }

  Future<Map<String, List>> readId(List<Map> id) async {
    id.removeWhere((element) => element['check'] == false);
    var baps = await FmsDatabase.instance.readBaps();
    baps = baps.where((element) {
      List<dynamic> data = id.where((element) => element['type'] == "baps").toList();
      for(Map currentId in data ){
        if(currentId['id'] == element['baps_id']) return true;
      }
      return false;
    }).toList();

    var sounding = await FmsDatabase.instance.readSounding();
    sounding = sounding.where((element) {
      List<Map> data = id.where((element) => element['type'] == "sounding").toList();
      for(Map currentId in data ){
        if(currentId['id'] == element['sounding_id']) return true;
      }
      return false;
    }).toList();

    var transfer = await FmsDatabase.instance.readTransfer();
    transfer = transfer.where((element) {
      List<Map> data = id.where((element) => element['type'] == "transfer").toList();
      for(Map currentId in data ){
        if(currentId['id'] ==  element['transfer_id']) return true;
      }
      return false;
    }).toList();

    var refueling = await FmsDatabase.instance.readRefueling();
    refueling = refueling.where((element) {
      List<Map> data = id.where((element) => element['type'] == "refueling").toList();
      for(Map currentId in data ){
        if(currentId['id'] ==  element['refueling_id']) return true;
      }
      return false;
    }).toList();

    var attendance = await FmsDatabase.instance.readHistoryAttendance();
    attendance = attendance.where((element) {
      List<Map> data = id.where((element) => element['type'] == "attendance").toList();
      for(Map currentId in data ){
        if(currentId['id'] == element['attendance_id']) return true;
      }
      return false;
    }).toList();

    return {'attendance': attendance,'baps': baps,'sounding': sounding,'transfer': transfer, 'refueling':refueling};
  }

  Future<List<Map>> readSounding() async {
    final db = await instance.database;

    final result = await db.rawQuery('SELECT * from tr_sounding');
    return result;
  }

  // Future<List<TrSoundingNew>> readSounding() async {
  //   final db = await instance.database;
  //   List<TrSoundingNew> trSounding = List.empty(growable: true);
  //   List<dynamic> result = await db.rawQuery('SELECT * from tr_sounding');
  //   result.forEach((element) {
  //     trSounding.add(TrSoundingNew.fromJson(element));
  //     ;});
  //   return trSounding;
  // }

  Future<List<Map>> readRefueling() async {
    final db = await instance.database;
    final result = await db.rawQuery('SELECT * FROM tr_refueling');
    return result;
  }

  Future<List<Map>> readHistoryRefueling() async {
    final db = await instance.database;
    final result = await db.rawQuery('SELECT * FROM history_refueling');
    return result;
  }

  // Future<List<Map>> readLastRefueling(String unit_code) async {
  //   final db = await instance.database;
  //   final result = await db.rawQuery('SELECT * FROM tr_refueling WHERE unit_code = "$unit_code" ORDER BY refueling_id DESC LIMIT 1 ');
  //   return result;
  // }

  // Future<List<Map>> readSynchRefueling() async {
  //   final db = await instance.database;
  //   final result = await db.rawQuery('SELECT * FROM tr_refueling where CAST(created_at as datetime) = current_date(`created_at`)');
  //   return result;
  // }

  Future<List<Map>> readLastRefueling(String unit_code) async {
    final db = await instance.database;
    final result = await db.rawQuery('SELECT * FROM history_refueling  WHERE unit_code = "$unit_code" ORDER BY refueling_id DESC LIMIT 1 ');
    return result;
  }

  Future<List<Map>> readTransfer() async {
    final db = await instance.database;
    final orderBy = '${TrFuelTransferFields.created_at} DESC';
    final result = await db.rawQuery('SELECT * from tr_fuel_transfer');

    return result;
  }

  Future<List<Map>> readStorage() async {
    final db = await instance.database;
    final orderBy = '${MsEquipmentFields.equipment_id} ASC';
    final result = await db.rawQuery('SELECT storageCode from msstorage group by storageCode');
    return result;
  }

  Future<List<MsShift>> readShift() async {
    final db = await instance.database;
    List<MsShift> msShift = List.empty(growable: true);
    List<dynamic> result = await db.rawQuery('SELECT * from msshift');
    result.forEach((element) {
      msShift.add(MsShift.fromJson(element));
    ;});
    return msShift;
  }

  Future<List<Map>> readEmployee() async {
    final db = await instance.database;
    final result = await db.rawQuery('SELECT * from msemployee');
    return result;
  }

  Future<List<Map>> readAttendance() async {
    final db = await instance.database;
    final result = await db.rawQuery('SELECT * from tr_fuel_attendance ORDER BY attendance_id DESC LIMIT 1 ');
    return result;
  }

  Future<List<Map>> readHistoryAttendance() async {
    final db = await instance.database;
    final result = await db.rawQuery('SELECT * from history_fuel_attendance ORDER BY attendance_id DESC LIMIT 1 ');
    return result;
  }

  Future<List<Map>> readBudget(String unit_code) async {
    final db = await instance.database;
    final result = await db.rawQuery('SELECT * from msbudget WHERE equipment_id = "$unit_code" ORDER BY budget_id DESC LIMIT 1');
    return result;
  }

  Future<List<Map>> dropAttendance(List<int> id) async {
    final db = await instance.database;
    final result = await db.rawQuery('DELETE from tr_fuel_attendance where attendance_id in (${id.join(',')})');
    return result;
  }

  Future<List<Map>> dropAllAttendance() async {
    final db = await instance.database;
    final result = await db.rawQuery('DELETE from tr_fuel_attendance');
    return result;
  }

  Future<List<Map>> dropSounding(List<int> id) async {
    final db = await instance.database;
    // final result = await db.rawQuery('DELETE from tr_sounding');
    final result = await db.rawQuery('DELETE from tr_sounding where sounding_id in (${id.join(',')})');
    return result;
  }

  Future<List<Map>> dropAllSounding() async {
    final db = await instance.database;
    final result = await db.rawQuery('DELETE from tr_sounding');
    return result;
  }

  Future<List<Map>> dropRefueling(List<int> id) async {
    final db = await instance.database;
    // final result = await db.rawQuery('DELETE from tr_sounding');
    final result = await db.rawQuery('DELETE from tr_refueling where refueling_id in (${id.join(',')})');
    return result;
  }

  Future<List<Map>> dropAllRefueling() async {
    final db = await instance.database;
    final result = await db.rawQuery('DELETE from tr_refueling');
    return result;
  }

  Future<List<Map>> dropHistoryRefueling() async {
    final db = await instance.database;
    final result = await db.rawQuery('DELETE from history_refueling');
    return result;
  }

  Future<List<Map>> dropHistoryAttendance(List<int> id) async {
    final db = await instance.database;
    final result = await db.rawQuery('DELETE from history_fuel_attendance where attendance_id in (${id.join(',')})');
    return result;
  }

  Future<List<Map>> dropAllHistoryAttendance() async {
    final db = await instance.database;
    final result = await db.rawQuery('DELETE from history_fuel_attendance');
    return result;
  }

  Future<List<Map>> dropTransfer(List<int> id) async {
    final db = await instance.database;
    final result = await db.rawQuery('DELETE from tr_fuel_transfer where transfer_id in (${id.join(',')})');
    return result;
  }

  Future<List<Map>> dropAllTransfer() async {
    final db = await instance.database;
    final result = await db.rawQuery('DELETE from tr_fuel_transfer');
    return result;
  }

  Future<List<Map>> dropBaps(List<int> id) async {
    final db = await instance.database;
    final result = await db.rawQuery('DELETE from tr_baps where baps_id in (${id.join(',')})');
    return result;
  }

  Future<List<Map>> dropAllBaps() async {
    final db = await instance.database;
    final result = await db.rawQuery('DELETE from tr_baps');
    return result;
  }

  Future<List<Map>> dropBudget() async {
    final db = await instance.database;
    final result = await db.rawQuery('DELETE from msbudget');
    return result;
  }

  Future<List<Map>> dropStorage() async {
    final db = await instance.database;
    final result = await db.rawQuery('DELETE from msstorage');
    return result;
  }

  Future<List<Map>> dropEmployee() async {
    final db = await instance.database;
    final result = await db.rawQuery('DELETE from msemployee');
    return result;
  }

  Future<List<Map>> dropEquipment() async {
    final db = await instance.database;
    final result = await db.rawQuery('DELETE from msequipment');
    return result;
  }

  Future<List<Map>> dropShift() async {
    final db = await instance.database;
    final result = await db.rawQuery('DELETE from msshift');
    return result;
  }

  Future<String> getFilePath() async {
    Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();
    String appDocumentsPath = appDocumentsDirectory.path;
    String filePath = '$appDocumentsPath/demoTextFile.txt'; // 3

    return filePath;
  }

  void saveFile() async {
    File file = File(await getFilePath()); // 1
    file.writeAsString("This is my demo text that will be saved to : demoTextFile.txt"); // 2
  }


  static String base64String(Uint8List data) {
    return base64Encode(data);
  }

  Future drop() async {
    final db = await instance.database;
    await db.execute("""DROP DATABASE """);
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }

}

