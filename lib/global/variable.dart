part of '../ui/pages/pages.dart';

class Refueling{
  static int fTransactionsId= 0;
  static String fFilling='';
  static String fTotalisatorAwal='';
  static String fTotalisatorAkhir='';
  static String fHmEquipment='';
}

class Global{
  static String time = formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd, ' ', HH, ':', nn,':',ss]);
}