import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fms_app/model/msequipment.dart';
import 'package:http/http.dart' as http;

class ApiService{
  Future<MsEquipment> fetchOperator() async{
    final response = await http
        .get(Uri.parse('https://10.10.0.223/backendapimaster/public/api/auth/Equipments'));

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