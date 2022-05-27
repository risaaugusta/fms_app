import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fms_app/model/msbudget_.dart';
import 'package:fms_app/model/msequipment.dart';
import 'package:fms_app/model/msrefueling.dart';
import 'package:fms_app/ui/pages/pages.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'msemployee.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiService {
  String? msg;

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future changePassword_(String current, updated, confirm) async {
    String? token = await ApiService().getToken();
    var jsonData;
    Map body = {
      'current_password': current,
      'new_password': updated,
      'password_confirmation': confirm
    };

    final response = await http.post(
      Uri.parse(
          '${Global.host}/backend-laravel-api/public/api/change-password'),
      headers: {
        HttpHeaders.authorizationHeader: "Bearer $token",
        "Content-Type": "application/json"
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      print(response.body.toString());
      jsonData = json.decode(response.body);
      msg = jsonData['message'];
      return 'Berhasil synch';
    } else {
      throw Exception('Failed');
    }
  }

  static Future<String> logout() async {
    String? token = await ApiService().getToken();

    final response = await http.post(
      Uri.parse('${Global.host}/backend-laravel-api/public/api/logout'),
      headers: {
        HttpHeaders.authorizationHeader: "Bearer $token",
        "Content-Type": "application/json"
      },
    );

    if (response.statusCode == 200) {
      Global.clearStorage();
      return 'Berhasil logout';
    } else {
      throw Exception('Failed to logout');
    }
  }

  Future<List<dynamic>> fetchOperator() async {
    // final storage = FlutterSecureStorage();
    // String? token = await storage.read(key: 'Bearer');
    String? token = await ApiService().getToken();

    final response = await http.get(
      Uri.parse('${Global.host}/backend-laravel-api/public/api/Equipments'),
      headers: {
        HttpHeaders.authorizationHeader: "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return jsonDecode(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load');
    }
  }

  Future<List<dynamic>> fetchStorage() async {
    String? token = await ApiService().getToken();
    final response = await http.get(
        Uri.parse("${Global.host}/backend-laravel-api/public/api/Equipments"),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $token",
        });
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return jsonDecode(response.body);
      // return MsEquipment.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load');
    }
  }

  Future<List<dynamic>> fetchEmployee() async {
    String? token = await ApiService().getToken();

    final response = await http.get(
      Uri.parse('${Global.host}/backend-laravel-api/public/api/Employees'),
      headers: {
        HttpHeaders.authorizationHeader: "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return jsonDecode(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load');
    }
  }

  static Future<String> synchBaps(List list) async {

    String? token = await ApiService().getToken();
    List baps = [];

    for (int i = 0; i < list.length; i++) {

      // if(list[i]['photo_hm_unit'] != null || list[i]['photo_meter_fuel'] != null )
      // {
        var photoTotBegin =
        await File(list[i]['photo_totalisator_begin']).readAsBytes();
        var photoTotEnd =
        await File(list[i]['photo_totalisator_end']).readAsBytes();
        var driverSigning = await File(list[i]['driver_signing']).readAsBytes();
        var witnessSigning = await File(list[i]['witness_signing']).readAsBytes();
        var receiverSigning =
        await File(list[i]['receiver_signing']).readAsBytes();

        baps.add({
          'baps_id': list[i]['baps_id'],
          'baps_no': list[i]['baps_no'],
          'site_id': list[i]['site_id'],
          'storage_id': list[i]['storage_id'],
          'transaction_time': list[i]['transaction_time'],
          'sj_solar_transportir_no': list[i]['sj_solar_transportir_no'],
          'do_vendor_no': list[i]['do_vendor_no'],
          'no_po': list[i]['no_po'],
          'volume_sj_voucher': list[i]['volume_sj_voucher'],
          'supplier_name': list[i]['supplier_name'],
          'driver_name': list[i]['driver_name'],
          'vehicle_no': list[i]['vehicle_no'],
          'capacity': list[i]['capacity'],
          'segel_begin': list[i]['segel_begin'],
          'segel_end': list[i]['segel_end'],
          'totalisator_begin': list[i]['totalisator_begin'],
          'totalisator_end': list[i]['totalisator_end'],
          'photo_totalisator_begin':
          // list[i]['photo_totalisator_begin'],
          "data:image/png;base64," + base64.encode(photoTotBegin),
          'photo_totalisator_end':
          // list[i]['photo_totalisator_end'],
          "data:image/png;base64," + base64.encode(photoTotEnd),
          'sounding_begin': list[i]['sounding_begin'],
          'sounding_end': list[i]['sounding_end'],
          'volume_pengisian': list[i]['volume_pengisian'],
          'deviation': list[i]['deviation'],
          'sg_observed': list[i]['sg_observed'],
          'sg_do': list[i]['sg_do'],
          'temp_observed': list[i]['temp_observed'],
          'temp_do': list[i]['temp_do'],
          'driver_signing':
          "data:image/png;base64," + base64.encode(driverSigning),
          'witness_signing':
          "data:image/png;base64," + base64.encode(witnessSigning),
          'witness_name': list[i]['witness_name'],
          'receiver_signing':
          "data:image/png;base64," + base64.encode(receiverSigning),
          'receiver_name': list[i]['receiver_name'],
          'created_by': list[i]['created_by'],
          'created_at': list[i]['created_at'],
          'modified_by': list[i]['modified_by'],
          'modified_at': list[i]['modified_at'],
          'status_approval': list[i]['status_approval'],
          'material_number': list[i]['material_number'],
        });
        print('=== DATA SYNCH BAPS');
        print(baps);
    }

    final response = await http.post(
      Uri.parse('${Global.host}/backend-laravel-api/public/api/fms/baps'),
      headers: {
        HttpHeaders.authorizationHeader: "Bearer $token",
        "Content-Type": "application/json"
      },
      body: jsonEncode(baps),
    );

    if (response.statusCode == 200) {
      print(response.body.toString());
      return 'Berhasil synch';
    } else {
      print(response.body.toString());
      throw Exception('Failed to synch');
    }
  }

  static Future<String> synchAttendance(List list) async {
    String? token = await ApiService().getToken();
    List attendance = [];
    print(list);
    for (int i = 0; i < list.length; i++) {
      attendance.add({
        'attendance_id': list[i]['attendance_id'],
        'employee_name': list[i]['employee_name'],
        'shift_id': list[i]['shift_id'],
        'site_id': list[i]['site_id'],
        'storage_id': list[i]['storage_id'],
        'login_at': list[i]['login_at'],
      });
    }

    final response = await http.post(
      Uri.parse(
          '${Global.host}/backend-laravel-api/public/api/fms/fuelattendance'),
      headers: {
        HttpHeaders.authorizationHeader: "Bearer $token",
        "Content-Type": "application/json"
      },
      body: jsonEncode(attendance),
    );

    if (response.statusCode == 200) {
      print("===");
      print(attendance);
      print(response.body.toString());
      return 'Berhasil synch';
    } else {
      throw Exception('Failed to synch');
    }
  }

  static Future<String> synchSounding(List list) async {
    String? token = await ApiService().getToken();
    List sounding = [];

    for (int i = 0; i < list.length; i++) {
      sounding.add({
        'sounding_id': list[i]['sounding_id'],
        'site_id': list[i]['site_id'],
        'shift_id': list[i]['shift_id'],
        'sounding': list[i]['sounding'],
        'storage_id': list[i]['storage_id'],
        'created_by': list[i]['created_by'],
        'created_at': list[i]['created_at'],
      });
    }

    final response = await http.post(
      Uri.parse('${Global.host}/backend-laravel-api/public/api/fms/sounding'),
      headers: {
        HttpHeaders.authorizationHeader: "Bearer $token",
        "Content-Type": "application/json"
      },
      body: jsonEncode(sounding),
    );

    if (response.statusCode == 200) {
      print(response.body.toString());
      return 'Berhasil synch';
    } else {
      throw Exception('Failed to synch');
    }
  }

  static Future<String> synchTransfer(List list) async {
    String? token = await ApiService().getToken();
    List transfer = [];

    for (int i = 0; i < list.length; i++) {
      var flowmeterSource =
          await File(list[i]['photo_flowmeter']).readAsBytes();
      transfer.add({
        'transfer_id': list[i]['transfer_id'],
        'storage_source': list[i]['storage_source'],
        'sounding_begin_source': list[i]['sounding_begin_source'],
        'totalisator_begin_source': list[i]['totalisator_begin_source'],
        'volume': list[i]['volume'],
        'totalisator_end_source': list[i]['totalisator_end_source'],
        'sounding_end_source': list[i]['sounding_end_source'],
        'photo_flowmeter':
            "data:image/png;base64," + base64.encode(flowmeterSource),
        'storage_dst': list[i]['storage_dst'],
        'sounding_begin_dst': list[i]['sounding_begin_dst'],
        'sounding_end_dst': list[i]['sounding_end_dst'],
        'shift_id': list[i]['shift_id'],
        'site_id': list[i]['site_id'],
        'created_by': list[i]['created_by'],
        'created_at': list[i]['created_at'],
        'material_number': list[i]['material_number']
      });
    }

    final response = await http.post(
      Uri.parse(
          '${Global.host}/backend-laravel-api/public/api/fms/fueltransfer'),
      headers: {
        HttpHeaders.authorizationHeader: "Bearer $token",
        "Content-Type": "application/json"
      },
      body: jsonEncode(transfer),
    );

    if (response.statusCode == 200) {
      print(response.body.toString());
      return 'Berhasil synch';
    } else {
      throw Exception('Failed to synch');
    }
  }

  static Future<String> synchRefueling(List list) async {

    String? token = await ApiService().getToken();
    List refueling = [];

    for (int i = 0; i < list.length; i++) {

      if(list[i]['photo_hm_unit'] != null || list[i]['photo_meter_fuel'] != null ) {
        var hmUnit = await File(list[i]['photo_hm_unit']).readAsBytes();
        var meterFuel = await File(list[i]['photo_meter_fuel']).readAsBytes();

        refueling.add({
          'refueling_id': list[i]['refueling_id'],
          'unit_code': list[i]['unit_code'],
          'unit_type': list[i]['unit_type'],
          'hm_input': list[i]['hm_input'],
          'nama_operator': list[i]['nama_operator'],
          'totalisator_begin': list[i]['totalisator_begin'],
          'totalisator_end': list[i]['totalisator_end'],
          'fuel_consumption': list[i]['fuel_consumption'],
          'budget': list[i]['budget'],
          'status': list[i]['status'],
          'photo_meter_fuel': "data:image/png;base64," + base64.encode(meterFuel),
          'photo_hm_unit': "data:image/png;base64," + base64.encode(hmUnit),
          // 'photo_hm_unit' : list[i]['photo_hm_unit'],
          // 'photo_meter_fuel' : list[i]['photo_meter_fuel'],
          'shift_id': list[i]['shift_id'],
          'site_id': list[i]['site_id'],
          'created_by': list[i]['created_by'],
          'created_at': list[i]['created_at'],
          'material_number': list[i]['material_number']
        });
      }else{
        refueling.add({
          'refueling_id': list[i]['refueling_id'],
          'unit_code': list[i]['unit_code'],
          'unit_type': list[i]['unit_type'],
          'hm_input': list[i]['hm_input'],
          'nama_operator': list[i]['nama_operator'],
          'totalisator_begin': list[i]['totalisator_begin'],
          'totalisator_end': list[i]['totalisator_end'],
          'fuel_consumption': list[i]['fuel_consumption'],
          'budget': list[i]['budget'],
          'status': list[i]['status'],
          'photo_meter_fuel': null,
          'photo_hm_unit': null,
          // 'photo_hm_unit' : list[i]['photo_hm_unit'],
          // 'photo_meter_fuel' : list[i]['photo_meter_fuel'],
          'shift_id': list[i]['shift_id'],
          'site_id': list[i]['site_id'],
          'created_by': list[i]['created_by'],
          'created_at': list[i]['created_at'],
        });
      };
    }

    final response = await http.post(
      Uri.parse('${Global.host}/backend-laravel-api/public/api/fms/refueling'),
      headers: {
        HttpHeaders.authorizationHeader: "Bearer $token",
        "Content-Type": "application/json"
      },
      body: jsonEncode(refueling),
    );

    if (response.statusCode == 200) {
      print(response.body.toString());
      return 'Berhasil synch';
    } else {
      throw Exception('Failed to synch');
    }
  }

  static Future<List<dynamic>> downloadEquipment() async {
    String? token = await ApiService().getToken();

    final response = await http.get(
      Uri.parse('${Global.host}/backend-laravel-api/public/api/Equipments'),
      headers: {
        HttpHeaders.authorizationHeader: "Bearer $token",
        "Content-Type": "application/json"
      },
    );

    if (response.statusCode == 200) {
      print(response.body.toString());
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
      throw Exception('Failed to download');
    }
  }

  static Future<List<dynamic>> downloadEmployee() async {
    String? token = await ApiService().getToken();

    final response = await http.get(
      Uri.parse('${Global.host}/backend-laravel-api/public/api/Employees'),
      headers: {
        HttpHeaders.authorizationHeader: "Bearer $token",
        "Content-Type": "application/json"
      },
    );

    if (response.statusCode == 200) {
      print(response.body.toString());
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
      throw Exception('Failed to download');
    }
  }

  static Future<List<dynamic>> downloadStorage() async {
    String? token = await ApiService().getToken();

    final response = await http.get(
      Uri.parse('${Global.host}/backend-laravel-api/public/api/Storages'),
      headers: {
        HttpHeaders.authorizationHeader: "Bearer $token",
        "Content-Type": "application/json"
      },
    );

    if (response.statusCode == 200) {
      print(response.body.toString());
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
      throw Exception('Failed to download');
    }
  }

  static Future<List<dynamic>> downloadShift() async {
    // final storage = FlutterSecureStorage();
    // String? token = await storage.read(key: 'Bearer');
    String? token = await ApiService().getToken();

    final response = await http.get(
      Uri.parse('${Global.host}/backend-laravel-api/public/api/Shift'),
      headers: {
        HttpHeaders.authorizationHeader: "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return jsonDecode(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load');
    }
  }

  static Future<List<dynamic>> downloadSite() async {
    String? token = await ApiService().getToken();

    final response = await http.get(
      Uri.parse('${Global.host}/backend-laravel-api/public/api/siteList'),
      headers: {
        HttpHeaders.authorizationHeader: "Bearer $token",
        "Content-Type": "application/json"
      },
    );

    if (response.statusCode == 200) {
      print(response.body.toString());
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
      throw Exception('Failed to download');
    }
  }

  static Future<Msbudget?> downloadBudget() async {
    String? token = await ApiService().getToken();

    final response = await http.get(
      Uri.parse('${Global.host}/backend-laravel-api/public/api/fms/msbudget'),
      headers: {
        HttpHeaders.authorizationHeader: "Bearer $token",
        "Content-Type": "application/json"
      },
    );

    if (response.statusCode == 200) {
      print(response.body.toString());
      Msbudget? responseBody = msbudgetFromMap(response.body);
      return responseBody;
    } else {
      print(response.statusCode);
      throw Exception('Failed to download');
    }
  }

  static Future<Msrefueling?> downloadRefueling() async {
    String? token = await ApiService().getToken();

    final response = await http.get(
      Uri.parse('${Global.host}/backend-laravel-api/public/api/fms/refueling'),
      headers: {
        HttpHeaders.authorizationHeader: "Bearer $token",
        "Content-Type": "application/json"
      },
    );

    if (response.statusCode == 200) {
      print(response.body.toString());
      Msrefueling? responseBody = msrefuelingFromMap(response.body);
      return responseBody;
    } else {
      print(response.statusCode);
      throw Exception('Failed to download');
    }
  }

  static Future<List<dynamic>> downloadAttendance() async {
    String? token = await ApiService().getToken();

    final response = await http.get(
      Uri.parse(
          '${Global.host}/backend-laravel-api/public/api/fms/fuelattendance'),
      headers: {
        HttpHeaders.authorizationHeader: "Bearer $token",
        "Content-Type": "application/json"
      },
    );

    if (response.statusCode == 200) {
      print(response.body.toString());
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
      throw Exception('Failed to download');
    }
  }
}
