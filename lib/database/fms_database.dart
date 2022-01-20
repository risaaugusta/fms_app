part of 'db_package.dart';

class FMSdb {
  PostgreSQLConnection? connection;
  PostgreSQLResult? loginResult;

  PostgreSQLResult? _fetchMsEquipmentResult;

  AppDatabase() {
    connection = (connection == null || connection!.isClosed == true
        ? PostgreSQLConnection(
            // for external device like mobile phone use domain.com or
            // your computer machine IP address (i.e,192.168.0.1,etc)
            // when using AVD add this IP 10.0.2.2
            'localhost',
            8083,
            'central',
            username: 'postgres',
            password: 'root',
            timeoutInSeconds: 30,
            queryTimeoutInSeconds: 30,
            useSSL: false,
            isUnixSocket: false,
          )
        : connection);

    fetchDataFuture = [];
  }

  // Fetch Data Section
  List<dynamic> fetchDataFuture = [];
  Future<List<dynamic>> fetchMsEquipment(String equipmentId) async {
    try {
      await connection!.open();
      await connection!.transaction((fetchDataConn) async {
        _fetchMsEquipmentResult = await fetchDataConn.query(
          'select equipment_id,manufacturer,model_number,tank_capacity,category, category_desc,auth_group,auth_text,company_code,load_capacity,load_capacity_unit from db_master.msequipment where equipment_id = @equipmentIdValue order by equipment_id',
          substitutionValues: {'equipmentIdValue': equipmentId},
          allowReuse: false,
          timeoutInSeconds: 30,
        );
        if (_fetchMsEquipmentResult!.affectedRowCount > 0) {
          fetchDataFuture =
              _fetchMsEquipmentResult!.first.toList(growable: true);
        } else {
          fetchDataFuture = [];
        }
      });
    } catch (exc) {
      fetchDataFuture = [];
      exc.toString();
    }

    return fetchDataFuture;
  }
}
