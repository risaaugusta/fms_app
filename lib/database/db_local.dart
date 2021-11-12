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

  Future _dropDB(Database db, int version) async {
    await db.execute("DROP TABLE $tableLansiran");
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

  ///tr fuel distribution
  Future<TrFuelDistribution> create(TrFuelDistribution trFuelDistribution) async {
    final db = await instance.database;
    final json = trFuelDistribution.toJson();
    final columns = ''
        // '${TrFuelDistributionFields.transactionsId},'
        '${TrFuelDistributionFields.equipment_id},'
        // '${TrFuelDistributionFields.storage_id},'
        // '${TrFuelDistributionFields.site_id},'
        // '${TrFuelDistributionFields.shiftId},'
        '${TrFuelDistributionFields.fuel_filling},'
        '${TrFuelDistributionFields.fuel_totalisator_awal},'
        '${TrFuelDistributionFields.fuel_totalisator_akhir},'
        '${TrFuelDistributionFields.hm_equipment},'
        // '${TrFuelDistributionFields.storage_operator},'
        // '${TrFuelDistributionFields.equipment_operator},'
        // '${TrFuelDistributionFields.equipmentBudget},'
        // '${TrFuelDistributionFields.isActive},'
        // '${TrFuelDistributionFields.createdBy},'
        '${TrFuelDistributionFields.created_at},'
        // '${TrFuelDistributionFields.updatedBy},'
        // '${TrFuelDistributionFields.updatedAt},'
        // '${TrFuelDistributionFields.attendaceId},'
    ;
    // final values = '${json[LansiranFields.storageId]},${json[LansiranFields.nik]}, ${json[LansiranFields.totalisatorAwal]}, ${json[LansiranFields.totalisatorAkhir]}, ${json[LansiranFields.volSebelum]}, ${json[LansiranFields.jml]}, ${json[LansiranFields.volTotal]} ';
    // final id = await db.rawInsert(
    //     'INSERT INTO lansiran ($columns) VALUES ($values)');

    final id = await db.insert(tableName, trFuelDistribution.toJson());
    print(id);
    return trFuelDistribution.copy(hm_equipment: TrFuelDistributionFields.hm_equipment);
  }

  ///select storageCode from msstorage
  Future<List<Map<String, dynamic>>> findObjects(String query) async {
    final db = await instance.database;
    final ret = await db.rawQuery(
        'SELECT storageCode FROM $tableStorage',
        ['%$query%']);
    return ret;
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }

}

