// pages ini berfungsi untuk menghubungkan semua halaman agar bisa dipanggil di setiap widget

// import 'dart:io' show Platform;
import 'dart:developer';
import 'dart:io' ;
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fms_app/bloc/blocs.dart';
import 'package:fms_app/bloc/blocs.dart';
import 'package:fms_app/database/db_package.dart';
import 'package:fms_app/model/lansiran.dart';
import 'package:intl/intl.dart';
import 'package:date_format/date_format.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter/services.dart';
// import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'package:fms_app/style/style.dart';
import 'package:fms_app/ui/pages/note/notes_page.dart';
import 'package:file_picker/file_picker.dart';

// import 'package:path_provider/path_provider.dart';

part 'login/welcome.dart';
part 'login/login1.dart';
part 'login/auth.dart';
part 'home/homeDashboard.dart';
part 'home/homeTransaksi.dart';
part 'home/homeDetailTransaksi.dart';
part 'home/homeBAPS.dart';
part 'home/homeTemplate.dart';
part 'home/homeLansiran.dart';
part 'home/comboboxDropdown.dart';
part 'home/uploaderDropdown.dart';
part 'home/home.dart';
part 'scan/scanner.dart';
part 'scan/scanSuccess.dart';
part 'scan/scanFailed.dart';
part 'scan/scanRefueling.dart';
part 'scan/SelectedScanner.dart';
part 'profile/profile.dart';
part 'testing/testing_insert.dart';
part 'testing/testing_detail.dart';
// part '../../database/db_package.dart';
// part '../../database/db_local.dart';
part 'wrapper.dart';
