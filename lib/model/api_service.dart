import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fms_app/model/msequipment.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiService{
  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<MsEquipment> fetchOperator() async{
    final storage = FlutterSecureStorage();
    String? token = await storage.read(key: 'Bearer');
//    String? token = await ApiService().getToken();
    print('$token ======');
////    // final response = await http.get(url, headers: {
////    //   'Content-Type': 'application/json',
////    //   'Accept': 'application/json',
////    //   'Authorization': 'Bearer $token',
////    // });

    final response = await http
        .get(Uri.parse('http://10.10.0.223/backendapimaster/public/api/auth/Equipments'), headers: {
      HttpHeaders.authorizationHeader: "Bearer $token",
    },);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return MsEquipment.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load');
    }
  }
}