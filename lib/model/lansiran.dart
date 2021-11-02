final String tableLansiran = 'lansiran';

class LansiranFields {
  static final List<String> values = [
    id,
    storageId,
    nik,
    totalisatorAwal,
    totalisatorAkhir,
    volSebelum,
    jml,
    volTotal
  ];

  static final String id = '_id';
  static final String storageId = 'storageId';
  static final String nik = 'nik';
  static final String totalisatorAwal = 'totalisatorAwal';
  static final String totalisatorAkhir = 'totalisatorAkhir';
  static final String volSebelum = 'volSebelum';
  static final String jml = 'jml';
  static final String volTotal = 'volTotal';
}

class Lansiran {
   int? id;
   String storageId;
   String nik;
   int totalisatorAwal;
   int totalisatorAkhir;
   int volSebelum;
   int jml;
   int volTotal;

   Lansiran({
    this.id,
    required this.storageId,
    required this.nik,
    required this.totalisatorAwal,
    required this.totalisatorAkhir,
    required this.volSebelum,
    required this.jml,
    required this.volTotal,
  });

  Lansiran copy({
    int? id,
    String? storageId,
    String? nik,
    int? totalisatorAwal,
    int? totalisatorAkhir,
    int? volSebelum,
    int? jml,
    int? volTotal,
  }) =>
      Lansiran(
        id: id ?? this.id,
        storageId: storageId ?? this.storageId,
        nik: nik ?? this.nik,
        totalisatorAwal: totalisatorAwal ?? this.totalisatorAwal,
        totalisatorAkhir: totalisatorAkhir ?? this.totalisatorAkhir,
        volSebelum: volSebelum ?? this.volSebelum,
        jml: jml ?? this.jml,
        volTotal: volTotal ?? this.volTotal,
      );

  static Lansiran fromJson(Map<String, Object?> json) => Lansiran(
        id: json[LansiranFields.id] as int?,
        storageId: json[LansiranFields.storageId] as String,
        nik: json[LansiranFields.nik] as String,
        totalisatorAwal: json[LansiranFields.totalisatorAwal] as int,
        totalisatorAkhir: json[LansiranFields.totalisatorAkhir] as int,
        volSebelum: json[LansiranFields.volSebelum] as int,
        jml: json[LansiranFields.jml] as int,
        volTotal: json[LansiranFields.volTotal] as int,
      );

  Map<String, Object?> toJson() => {
        LansiranFields.id: id,
        LansiranFields.storageId: storageId,
        LansiranFields.nik: nik,
        LansiranFields.totalisatorAwal: totalisatorAwal,
        LansiranFields.totalisatorAkhir: totalisatorAkhir,
        LansiranFields.volSebelum: volSebelum,
        LansiranFields.jml: jml,
        LansiranFields.volTotal: volTotal,
      };
}
