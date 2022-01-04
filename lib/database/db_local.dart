part of 'db_package.dart';
// part of '../ui/pages/pages.dart';

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

    return await openDatabase(path, version: 1, onCreate: _createDB );
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY';
    final integerType = 'INTEGER NOT NULL';
    final textType = 'TEXT NOT NULL';
    await db.execute('''CREATE TABLE $tableLansiran(
      ${LansiranFields.id} $idType,
      ${LansiranFields.storageId} $textType,
      ${LansiranFields.nik} $textType,
      ${LansiranFields.totalisatorAwal} $integerType,
      ${LansiranFields.totalisatorAkhir} $integerType,
      ${LansiranFields.volSebelum} $integerType,
      ${LansiranFields.jml} $integerType,
      ${LansiranFields.volTotal} $integerType
     )''');
  }

  //
  // Future<Lansiran> create(Lansiran lansiran) async {
  //   final db = await instance.database;
  //   final json = lansiran.toJson();
  //   final columns = '${LansiranFields.storageId},${LansiranFields.nik},${LansiranFields.totalisatorAwal},${LansiranFields.totalisatorAkhir},${LansiranFields.volSebelum},${LansiranFields.jml},${LansiranFields.volTotal}';
  //   final values = '${json[LansiranFields.storageId]},${json[LansiranFields.nik]}, ${json[LansiranFields.totalisatorAwal]}, ${json[LansiranFields.totalisatorAkhir]}, ${json[LansiranFields.volSebelum]}, ${json[LansiranFields.jml]}, ${json[LansiranFields.volTotal]} ';
  //   // final id = await db.rawInsert(
  //   //     'INSERT INTO lansiran ($columns) VALUES ($values)');
  //
  //   final id = await db.insert(tableLansiran, lansiran.toJson());
  //   print(id);
  //   return lansiran.copy(id: id);
  // }
  //
  // Future<Lansiran?> readLansiran(int id) async {
  //   final db = await instance.database;
  //   final maps = await db.query(
  //     tableLansiran,
  //     columns: LansiranFields.values,
  //     where: '${LansiranFields.id} = ?',
  //     whereArgs: [id],
  //   );
  //
  //   if (maps.isNotEmpty) {
  //     return Lansiran.fromJson(maps.first);
  //   } else {
  //     return null;
  //   }
  // }
  //
  // Future<List<Lansiran>> readAllLansiran() async {
  //   final db = await instance.database;
  //
  //   final orderBy = '${LansiranFields.id} ASC';
  //   // final result = await db.rawQuery('SELECT * FROM $tableLansiran ORDER BY $orderBy');
  //   final result = await db.query(tableLansiran, orderBy: orderBy);
  //   return result.map((json) => Lansiran.fromJson(json)).toList();
  // }
  //
  // Future<int> updateLansiran(Lansiran lansiran) async {
  //   final db = await instance.database;
  //
  //   return db.update(tableLansiran, lansiran.toJson(),
  //       where: '${LansiranFields.id} = ? ', whereArgs: [lansiran.id]);
  // }
  //
  // Future<int> deleteLansiran(int id) async {
  //   final db = await instance.database;
  //
  //   return await db.delete(tableLansiran,
  //       where: '${LansiranFields.id} =?', whereArgs: [id]);
  // }

  //tr fuel distribution
  Future<TrFuelDistribution> create(TrFuelDistribution trFuelDistribution) async {
    final db = await instance.database;
    final json = trFuelDistribution.toJson();
    final columns = ''
        // '${TrFuelDistributionFields.transactions_id},'
        '${TrFuelDistributionFields.equipment_id},'
        // '${TrFuelDistributionFields.storage_id},'
        // '${TrFuelDistributionFields.site_id},'
        // '${TrFuelDistributionFields.shiftId},'
        '${TrFuelDistributionFields.fuel_filling},'
        '${TrFuelDistributionFields.fuel_totalisator_awal},'
        '${TrFuelDistributionFields.fuel_totalisator_akhir},'
        // '${TrFuelDistributionFields.hm_equipment},'
        // '${TrFuelDistributionFields.storage_operator},'
        // '${TrFuelDistributionFields.equipment_operator},'
        // '${TrFuelDistributionFields.equipment_budget},'
        // '${TrFuelDistributionFields.isActive},'
        // '${TrFuelDistributionFields.createdBy},'
        '${TrFuelDistributionFields.created_at},'
        // '${TrFuelDistributionFields.updatedBy},'
        '${TrFuelDistributionFields.updated_at},'
        '${TrFuelDistributionFields.image_directory},'
        '${TrFuelDistributionFields.image_name},'
        // '${TrFuelDistributionFields.attendaceId},'
    ;

    final id = await db.insert(tableName, trFuelDistribution.toJson());
    print(id);
    return trFuelDistribution.copy(hm_equipment: TrFuelDistributionFields.hm_equipment);
  }

  Future<TrFuelTransfer> createTransfer(TrFuelTransfer trFuelTransfer) async {
    final db = await instance.database;
    final json = trFuelTransfer.toJson();
    final columns = ''
        // '${TrFuelTransferFields.transactions_id},'
        '${TrFuelTransferFields.site_id},'
        '${TrFuelTransferFields.flowmeter_dst},'
        // '${TrFuelTransferFields.shift_id},'
        '${TrFuelTransferFields.storage_source},'
        '${TrFuelTransferFields.flowmeter_source},'
        '${TrFuelTransferFields.totalisator_source_begin},'
        '${TrFuelTransferFields.totalisator_source_end},'
        '${TrFuelTransferFields.storage_destination},'
        '${TrFuelTransferFields.totalisator_dst_begin},'
        '${TrFuelTransferFields.totalisator_dst_end},'
        // '${TrFuelTransferFields.attendance_id},'
        // '${TrFuelTransferFields.approval_id},'
        // '${TrFuelTransferFields.is_active},'
        // '${TrFuelTransferFields.created_by},'
        '${TrFuelTransferFields.created_at},'
        // '${TrFuelTransferFields.modified_by},'
        // '${TrFuelTransferFields.created_by},'
    ;

    final id = await db.insert(tableTransfer, trFuelTransfer.toJson());
    print(id);
    return trFuelTransfer.copy(site_id: TrFuelDistributionFields.site_id);
  }

  Future<TrBaps> createBaps(TrBaps trBaps) async {
    final db = await instance.database;
    final json = trBaps.toJson();
    print(trBaps.toJson());
    final columns = ''
        // '${TrBapsFields.baps_id},'
        '${TrBapsFields.site_id},'
        // '${TrBapsFields.shift_id},'
        // '${TrBapsFields.operator_id},'
        '${TrBapsFields.approval_id},'
        '${TrBapsFields.notes},'
        '${TrBapsFields.baps_status},'
        '${TrFuelTransferFields.created_at},'
        '${TrFuelTransferFields.modified_at},'
    ;

    final id = await db.insert(tableBaps, trBaps.toJson());
    print(id);
    return trBaps.copy(site_id: trBaps.site_id);
  }

  Future<TrBapsDetail> createBapsDetail(TrBapsDetail trBapsDetail) async {
    final db = await instance.database;
    final json = trBapsDetail.toJson();
    print(trBapsDetail.toJson());
    final columns = ''
        '${TrBapsDetailFields.sj_solar_transportir_no},'
        '${TrBapsDetailFields.do_vendor_no},'
        '${TrBapsDetailFields.pr_po_no},'
        '${TrBapsDetailFields.supplier_name},'
        '${TrBapsDetailFields.driver_name},'
        '${TrBapsDetailFields.vehicle_no},'
        '${TrBapsDetailFields.volume},'
        '${TrBapsDetailFields.segel_begin},'
        '${TrBapsDetailFields.segel_end},'
        '${TrBapsDetailFields.vehicle_no},'
        '${TrBapsDetailFields.volume},'
        '${TrBapsDetailFields.storage_id},'
        '${TrBapsDetailFields.segel_begin},'
        '${TrBapsDetailFields.segel_end},'
        '${TrBapsDetailFields.totalisator_begin},'
        '${TrBapsDetailFields.totalisator_end},'
        '${TrBapsDetailFields.flowmeter},'
        '${TrBapsDetailFields.deviation},'
        '${TrBapsDetailFields.sounding_begin},'
        '${TrBapsDetailFields.sounding_end},'
        '${TrBapsDetailFields.sg_observed},'
        '${TrBapsDetailFields.sg_do},'
        '${TrBapsDetailFields.temp_observed},'
        '${TrBapsDetailFields.temp_do},'
    ;

    final id = await db.insert(tableBapsDetail, trBapsDetail.toJson());
    print(id);
    return trBapsDetail.copy(sj_solar_transportir_no: trBapsDetail.sj_solar_transportir_no);
  }

  Future<TrFuelAttendance> createAttendance(TrFuelAttendance trFuelAttendance) async {
    final db = await instance.database;
    final json = trFuelAttendance.toJson();
    print(trFuelAttendance.toJson());
    final columns = ''
        '${TrFuelAttendanceFields.attendance_id},'
        '${TrFuelAttendanceFields.site_id},'
        '${TrFuelAttendanceFields.equipment_id},'
        '${TrFuelAttendanceFields.shift_id},'
        '${TrFuelAttendanceFields.operator_id},'
        '${TrFuelAttendanceFields.login_at},'
        '${TrFuelAttendanceFields.updated_by},'
        '${TrFuelAttendanceFields.updated_at},'
        '${TrFuelAttendanceFields.is_active},'
        '${TrFuelAttendanceFields.phone_id},'
    ;

    final id = await db.insert(tableAttendance, trFuelAttendance.toJson());
    return trFuelAttendance.copy(shift_id: trFuelAttendance.shift_id);
  }

  //select storageCode from msstorage
  Future<List<Map<String, dynamic>>> findRefuelingObjects(String query) async {
    final db = await instance.database;
    final ret = await db.rawQuery(
        'SELECT equipment_id FROM $tableStorage',
        ['%$query%']);
    return ret;
  }

  //select detail
  Future<Lansiran?> readRefuelingDetail(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      tableName,
      columns: TrFuelDistributionFields.values,
      // where: '${TrFuelDistributionFields.transactions_id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Lansiran.fromJson(maps.first);
    } else {
      return null;
    }
  }

  Future<List<Map>> readRefueling() async {
    final db = await instance.database;
    final orderBy = '${TrFuelDistributionFields.created_at} DESC';
    final result = await db.rawQuery('SELECT mse.equipment_id, model_number,tfd.fuel_filling,tank_capacity,category_desc,auth_group,company_code,operator_id,tfd.created_at, fuel_totalisator_awal, fuel_totalisator_akhir, (fuel_totalisator_awal+tank_capacity) as ftakhir, (fuel_totalisator_awal+fuel_totalisator_akhir) as total FROM msequipment mse inner join tr_fuel_attendance tfa join tr_fuel_distribution tfd on mse.equipment_id = tfa.equipment_id and mse.equipment_id = tfd.equipment_id where tfa.equipment_id ="EX21103KM" order by tfd.created_at desc');
    print(result);
    return result;
  }

  Future<List<Map>> readStorage() async {
    final db = await instance.database;
    final orderBy = '${MsEquipmentFields.equipment_id} ASC';
    final result = await db.rawQuery('SELECT st.storageCode, st.siteID, tfa.site_id FROM msstorage st inner join tr_fuel_attendance tfa on st.siteID = tfa.site_id where tfa.equipment_id ="EX21103KM"');
    print(result);
    return result;
  }

  // Future getImage(TrFuelDistribution imageSource) async {
  //   var image = await TrFuelDistribution.pickImage(source: imageSource);
  //   List<int> bytes = await image.readAsBytes();
  // }

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

  //
  // static Image imageFromBase64String(String base64String) {
  //   return Image.memory(
  //     base64Decode(base64String),
  //     fit: BoxFit.fill,
  //   );
  // }
  //
  // static Uint8List dataFromBase64String(String base64String) {
  //   return base64Decode(base64String);
  // }
  //
  // static String base64String(Uint8List data) {
  //   return base64Encode(data);
  // }

  Future close() async {
    final db = await instance.database;
    db.close();
  }

}

