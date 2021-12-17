// part of '../ui/pages/pages.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:fms_app/model/lansiran.dart';
import 'package:fms_app/model/msequipment.dart';
import 'package:fms_app/model/msstorage.dart';
import 'package:fms_app/model/tr_baps.dart';
import 'package:fms_app/model/tr_fuel_distribution.dart';
import 'package:fms_app/model/tr_fuel_transfer.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:postgres/postgres.dart';
// import 'package:json_annotation/json_annotation.dart';

part 'db_local.dart';
part 'fms_database.dart';
