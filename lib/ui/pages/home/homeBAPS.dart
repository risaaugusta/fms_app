part of '../pages.dart';

class homeBAPS extends StatefulWidget {
  const homeBAPS({Key? key})
      : super(key: key);
  // const homeBAPS({Key? key}) : super(key: key);

  @override
  _homeBAPSState createState() => _homeBAPSState();
}

class _homeBAPSState extends State<homeBAPS> {
  double totalisatorAkhir = 0;
  final formKey = GlobalKey<FormState>();
  String? imagePath;
  List selectedUserProfile = [];
  TrBaps? trBaps;
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    homeLansiran(),
    HomeManual(),
    homeNotifikasi(),
    Profile(),
  ];

  List<Item> DataItems = generateItems(17);
  List<Item> DestinationItems = generateItems(1);
  List<String> headerDataValue=<String>[
    'No. SJ',
    'No. DO Vendor',
    'No. PO',
    'Vol SJ/Voucher',
    'Nama Supplier',
    'Nama Driver',
    'No Vehicle',
    'Volume Pengisian',
    'Segel Awal',
    'Segel Akhir',
    'Kapasitas Tangki',
    // 'Penerimaan Solar Tangki',
    'Sounding Awal',
    'Sounding Akhir',
    'SG Observed',
    'SG DO',
    'Temperatur Observed',
    'Temperatur DO',
  ];
  List<String> headerDestinationValue=<String>[
    'Storage ID',
  ];
  List<Item> PhotoItems = generateItems(9);
  List<String> headerPhotoValue=<String>[
    'Totalisator Awal',
    'Totalisator Akhir',
    'Photo Totalisator Awal',
    'Photo Totalisator Akhir',
    'Tanda Tangan Driver',
    'Tanda Tangan Saksi',
    'Nama Saksi',
    'Tanda Tangan PIC Penerima',
    'Nama PIC Penerima',
  ];

  ScrollController _controller = new ScrollController();

  @override
  void initState() {
    super.initState();
    Global.getLocalStorage();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _selectedIndex == 0  ? AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back,color: Colors.black,),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => homeDashboard()),
              );
            },
          ),
          title: const Text('BAP Solar',
              style: TextStyle(color: Colors.black,
                  fontFamily: Fonts.REGULAR,fontSize: 18)),
          backgroundColor: Colors.white,
        ) : _selectedIndex == 3  ? AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back,color: Colors.black,),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => homeDashboard()),
              );
            },
          ),
          title: const Text('Profile Fuelman',
              style: TextStyle(color: Colors.black,
                  fontFamily: Fonts.REGULAR,fontSize: 18)),
          backgroundColor: Colors.white,
        ) : null,
        body: _selectedIndex == 0  ? SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15, bottom: 15, top: 15),
                child: Text(
                    'Vendor',
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.black,
                        fontFamily: Fonts.REGULAR,fontSize: 18)
                ),
              ),
              ExpansionPanelList(
                expansionCallback: (int index, bool isExpanded) {
                  setState(() {
                    DataItems[index].isExpanded = !isExpanded;
                  });
                },
                children: DataItems.asMap().map<int,ExpansionPanel>((index, Item item) => MapEntry(index,
                  ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                        contentPadding: EdgeInsets.only(left:30),
                        title: Text('${headerDataValue[index]}',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.grey,
                                fontFamily: Fonts.REGULAR,fontSize: 14)),
                      );
                    },
                    body: ListTile(
                        title: Container(
                            width: MediaQuery.of(context).size.width / 1.8,
                            margin: EdgeInsets.symmetric(vertical: 10),
                            decoration:
                            BoxDecoration(borderRadius: BorderRadius.circular(20)),
                            child: TextFormField(
                                autofocus: false,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade200,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  fillColor: Color(0xffFFFFFF),
                                  filled: true,
                                  contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                                ),
                                onChanged: (value) {
                                  if (headerDataValue[index] ==
                                      headerDataValue[0]) {
                                    Baps.sj_solar_transportir_no = value;
                                  }else if ( headerDataValue[index] ==
                                      headerDataValue[1]){
                                    Baps.do_vendor_no = value;
                                  }else if ( headerDataValue[index] ==
                                      headerDataValue[2]){
                                    Baps.no_po = value;
                                  } else if ( headerDataValue[index] ==
                                      headerDataValue[3]){
                                    Baps.volume_sj_voucher = value;
                                  }
                                  else if ( headerDataValue[index] ==
                                      headerDataValue[4]){
                                    Baps.supplier_name = value;
                                  }else if ( headerDataValue[index] ==
                                      headerDataValue[5]){
                                    Baps.driver_name = value;
                                  }else if ( headerDataValue[index] ==
                                      headerDataValue[6]){
                                    Baps.vehicle_no = value;
                                  }else if ( headerDataValue[index] ==
                                      headerDataValue[7]){
                                    setState(() {
                                      Baps.volume_pengisian = value;
                                      Baps.deviation;
                                    });
                                  }else if ( headerDataValue[index] ==
                                      headerDataValue[8]){
                                    Baps.segel_begin = value;
                                  } else if ( headerDataValue[index] ==
                                      headerDataValue[9]){
                                    Baps.segel_end = value;
                                  }
                                  else if ( headerDataValue[index] ==
                                      headerDataValue[10]){
                                    Baps.capacity = value;
                                  }
                                  else if ( headerDataValue[index] ==
                                      headerDataValue[11]){
                                    Baps.sounding_begin = value;
                                  }else if ( headerDataValue[index] ==
                                      headerDataValue[12]){
                                    Baps.sounding_end = value;
                                  }else if ( headerDataValue[index] ==
                                      headerDataValue[13]){
                                    Baps.sg_observed = value;
                                  }else if ( headerDataValue[index] ==
                                      headerDataValue[14]){
                                    Baps.sg_do = value;
                                  }else if ( headerDataValue[index] ==
                                      headerDataValue[15]){
                                    Baps.temp_observed = value;
                                  }
                                  else { Baps.temp_do = value ;}
                                }
                              ),
                          ),
                    ),
                    isExpanded: item.isExpanded,
                  ),
                )).values.toList(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                child: Text(
                    'Destination',
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.black,
                        fontFamily: Fonts.REGULAR,fontSize: 18)
                ),
              ),
              ExpansionPanelList(
                expansionCallback: (int index, bool isExpanded) {
                  setState(() {
                    DestinationItems[index].isExpanded = !isExpanded;
                  });
                },
                children: DestinationItems.asMap().map<int,ExpansionPanel>((index, Item item) => MapEntry(index,
                  ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                        contentPadding: EdgeInsets.only(left:30),
                        title: Text('${headerDestinationValue[index]}',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.grey,
                                fontFamily: Fonts.REGULAR,fontSize: 14)),
                      );
                    },
                    body: ListTile(
                        title:
                        StorageDropdown(callback: (value)
                        {
                           // trBaps!.storage_id = value;
                           Baps.storage_id = value;
                        })
                    ),
                    isExpanded: item.isExpanded,
                  ),
                )).values.toList(),
              ),
              ExpansionPanelList(
                expansionCallback: (int index, bool isExpanded) {
                  setState(() {
                    PhotoItems[index].isExpanded = !isExpanded;
                  });
                },
                children: PhotoItems.asMap().map<int,ExpansionPanel>((index, Item item) => MapEntry(index,
                  ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                        contentPadding: EdgeInsets.only(left:30),
                        title: Text('${headerPhotoValue[index]}',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.grey,
                                fontFamily: Fonts.REGULAR,fontSize: 14)),
                      );
                    },
                    body: ListTile(
                        title:
                        headerPhotoValue[index] ==
                            headerPhotoValue[0] ?
                        Container(
                          width: MediaQuery.of(context).size.width / 1.8,
                          margin: EdgeInsets.symmetric(vertical: 10),
                          decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(20)),
                          child: TextFormField(
                            autofocus: false,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade200,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              fillColor: Color(0xffFFFFFF),
                              filled: true,
                              contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                            ),
                            onChanged: (value)  {
                              setState(() {
                                Baps.totalisator_begin = value;
                              });
                            }, ////dummy value
                          ),
                        ) :
                        headerPhotoValue[index] ==
                            headerPhotoValue[1] ?
                        Container(
                          width: MediaQuery.of(context).size.width / 1.8,
                          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                          decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(20)),
                          child: Text(
                              Baps.totalisator_end,
                              style: TextStyle(color: Colors.black, fontFamily: Fonts.REGULAR,fontSize: 18))
                        ) :
                        headerPhotoValue[index] ==
                            headerPhotoValue[4] ?
                        SignaturePad(signature: null,callback: (ttd) => Baps.driver_signing = ttd)
                          :
                        headerPhotoValue[index] ==
                            headerPhotoValue[5] ?
                        SignaturePad(signature: null,callback: (ttd)=> Baps.witness_signing  = ttd)  :
                        headerPhotoValue[index] ==
                            headerPhotoValue[6] ?
                        Container(
                          width: MediaQuery.of(context).size.width / 1.8,
                          margin: EdgeInsets.symmetric(vertical: 10),
                          decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(20)),
                          child: TextFormField(
                            autofocus: false,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade200,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              fillColor: Color(0xffFFFFFF),
                              filled: true,
                              contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                            ),
                            onChanged: (value)  {
                              Baps.witness_name = value;
                            }, ////dummy value
                          ),
                        ) :
                        headerPhotoValue[index] ==
                            headerPhotoValue[7] ?
                        SignaturePad(signature: null,callback: (ttd)=> Baps.receiver_signing  = ttd,
                        )  :
                        headerPhotoValue[index] ==
                            headerPhotoValue[8] ?
                        Container(
                          width: MediaQuery.of(context).size.width / 1.8,
                          margin: EdgeInsets.symmetric(vertical: 10),
                          decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(20)),
                          child: TextFormField(
                            autofocus: false,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade200,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              fillColor: Color(0xffFFFFFF),
                              filled: true,
                              contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                            ),
                            onChanged: (value)  {
                              Baps.receiver_name = value;
                            }, ////dummy value
                          ),
                        ) :
                        headerPhotoValue[index] ==
                            headerPhotoValue[2] ?
                          ///camera future builder
                      Column(
                        children: [
                          ElevatedButton(
                          onPressed:  () async{
                              String? url = await Navigator.push(
                              context,
                                MaterialPageRoute(
                                builder: (context) => TakePictureScreen(camera: getCamera(), callback: (String val) {
                                  setState(() {
                                    imagePath = val;
                                  });
                                },)),
                                );
                              if(url == null ){
                                return;
                              }else{
                                setState(() {
                                  // imagePath = url;
                                    Baps.photo_totalisator_begin = url;
                                });
                              }
                              },
                             style: ElevatedButton.styleFrom(
                            primary: Coloring.mainColor),
                            child: Text(
                            'Ambil foto',
                            style: TextStyle(color: Colors.white,
                                fontFamily: Fonts.REGULAR,fontSize: 12)
                        )),
                          Baps.photo_totalisator_begin == '' ? Container() :
                          Image.file(File(Baps.photo_totalisator_begin))
                        ],
                      ) :
                        Column(
                          children: [
                            ElevatedButton(
                                onPressed:  () async{
                                  String? url = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TakePictureScreen(camera: getCamera(), callback: (String val) {
                                          setState(() {
                                            imagePath = val;
                                          });
                                        },)),
                                  );
                                  if(url == null ){
                                    return;
                                  }else{
                                    setState(() {
                                      // imagePath = url;
                                        Baps.photo_totalisator_end = url;
                                    });
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Coloring.mainColor),
                                child: Text(
                                    'Ambil foto',
                                    style: TextStyle(color: Colors.white,
                                        fontFamily: Fonts.REGULAR,fontSize: 12)
                                )),
                            Baps.photo_totalisator_end == '' ? Container() :
                            Image.file(File(Baps.photo_totalisator_end))
                            // Text(Baps.photo_totalisator_end)
                          ],
                        )
                      //       :
                      // UploaderDropdown(callback:(String filePath)
                      // {
                      //   if (headerPhotoValue[index] ==
                      //       headerPhotoValue[2]) {
                      //     Baps.photo_totalisator_begin = filePath;
                      //   }else if ( headerPhotoValue[index] ==
                      //       headerPhotoValue[3]){
                      //     Baps.photo_totalisator_end = filePath;
                      //   }else {
                      //     null;}
                      // })
                    ),
                    isExpanded: item.isExpanded,
                  ),
                )).values.toList(),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20, top: 15),
                child: Divider(
                  color: Color(0xffF5F5F5),
                  thickness: 30,
                ),
              ),
              Container(
                margin:  EdgeInsets.symmetric(horizontal: 20),
                height: 50,
                child: ButtonTheme(
                  minWidth: MediaQuery.of(context).size.width,
                  child: Container(
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(color: Coloring.mainColor)),
                      onPressed: () async {
                        trBaps = TrBaps(
                          baps_no: (await FmsDatabase.instance.readAttendance())[0]['site_id'].toString() + '/' + 'BAPS' + '/' + Global.bapsTime ,
                          site_id: null,
                          storage_id: Baps.storage_id ,
                          transaction_time: Global.time,
                          sj_solar_transportir_no: Baps.sj_solar_transportir_no,
                          do_vendor_no: Baps.do_vendor_no,
                          no_po: Baps.no_po,
                          volume_sj_voucher: Baps.volume_sj_voucher,
                          supplier_name: Baps.supplier_name,
                          driver_name: Baps.driver_name,
                          vehicle_no: Baps.vehicle_no,
                          capacity: Baps.capacity,
                          segel_begin: Baps.segel_begin,
                          segel_end: Baps.segel_end,
                          totalisator_begin: Baps.totalisator_begin,
                          totalisator_end: Baps.totalisator_end,
                          photo_totalisator_begin: Baps.photo_totalisator_begin,
                          photo_totalisator_end: Baps.photo_totalisator_end,
                          sounding_begin: Baps.sounding_begin,
                          sounding_end: Baps.sounding_end,
                          volume_pengisian: Baps.volume_pengisian,
                          sg_observed: Baps.sg_observed,
                          sg_do: Baps.sg_do,
                          deviation: Baps.deviation ,
                          temp_observed: Baps.temp_observed,
                          temp_do: Baps.temp_do,
                          driver_signing: Baps.driver_signing,
                          witness_signing: Baps.witness_signing,
                          witness_name: Baps.witness_name,
                          receiver_signing: Baps.receiver_signing,
                          receiver_name: Baps.receiver_name,
                          created_at: Global.time,
                          created_by:(await FmsDatabase.instance.readAttendance())[0]['employee_name'].toString(),
                          modified_by: (await FmsDatabase.instance.readAttendance())[0]['employee_name'].toString(),
                          modified_at: Global.time,
                          status_approval: null,
                          material_number: 'SOLAR',
                        );
                        if( Baps.sj_solar_transportir_no.isEmpty || Baps.do_vendor_no.isEmpty ||
                            Baps.no_po.isEmpty || Baps.volume_sj_voucher.isEmpty || Baps.supplier_name.isEmpty ||
                            Baps.driver_name.isEmpty || Baps.vehicle_no.isEmpty || Baps.capacity.isEmpty ||
                            Baps.segel_begin.isEmpty || Baps.segel_end.isEmpty ||
                            Baps.totalisator_begin.isEmpty || Baps.totalisator_end.isEmpty || Baps.volume_pengisian.isEmpty ||
                            Baps.sounding_begin.isEmpty || Baps.sounding_end.isEmpty || Baps.sg_observed.isEmpty || Baps.temp_observed.isEmpty){
                          _dialogMandatory();
                        }else{
                          FmsDatabase.instance.createBaps(trBaps!).then((value)=> {_dialogAlert()});
                        }
                      },
                      color: Coloring.mainColor,
                      textColor: Colors.white,
                      child: Text("Kirim",
                          style: TextStyle(color: Colors.white, fontFamily: Fonts.REGULAR,fontSize: 18)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50)
            ],
          ),
        ) : ListView(
          physics: const AlwaysScrollableScrollPhysics(), // new
          controller: _controller,
          children: [
            _selectedIndex == 0 ? searchBar() : Text(''),
            _widgetOptions.elementAt(_selectedIndex),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 60,
            child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      minWidth:40,
                      onPressed: (){
                        Navigator.pop(
                          context,
                          MaterialPageRoute(builder: (context) => homeDashboard()),);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.home,
                            color: _selectedIndex == 0 ? Coloring.mainColor : Colors.grey,
                          ),
                          Text(
                              'Beranda',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: _selectedIndex == 0 ? Coloring.mainColor : Colors.grey,
                                  fontFamily: Fonts.REGULAR,fontSize: 14)
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      onPressed: (){
                        setState(() {
                          _selectedIndex = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.article_rounded,
                            color: _selectedIndex == 1 ? Coloring.mainColor : Colors.grey,
                          ),
                          Text(
                              'Sinkron',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: _selectedIndex == 1 ? Coloring.mainColor : Colors.grey,
                                  fontFamily: Fonts.REGULAR,fontSize: 14)
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth:40,
                      onPressed: (){
                        setState(() {
                          // screens = searchBar();
                          _selectedIndex = 2;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.notifications,
                            color: _selectedIndex == 2 ? Coloring.mainColor : Colors.grey,
                          ),
                          Text(
                              'Notifikasi',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: _selectedIndex == 2 ? Coloring.mainColor : Colors.grey,
                                  fontFamily: Fonts.REGULAR,fontSize: 14)
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      onPressed: (){
                        setState(() {
                          _selectedIndex = 3;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.account_circle,
                            color: _selectedIndex == 3 ? Coloring.mainColor : Colors.grey,
                          ),
                          Text(
                              'Profil',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: _selectedIndex == 3 ? Coloring.mainColor : Colors.grey,
                                  fontFamily: Fonts.REGULAR,fontSize: 14)
                          ),
                        ],
                      ),
                    )
                  ],
                ),
          ),
        )
    );
  }

  ///pop up status
  Future<void> _dialogAlert() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Berhasil!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("Berhasil tambah data"),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Oke'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  ///pop up mandatory
  Future<void> _dialogMandatory() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Oops!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Baps.sj_solar_transportir_no.isEmpty ?
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: 'Data '),
                      TextSpan(text: 'No. SJ ', style: const TextStyle(fontWeight: FontWeight.bold)) ,
                      TextSpan(text: 'harus diisi!'),
                    ],
                  ),
                ) :
                Baps.do_vendor_no.isEmpty ?
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: 'Data '),
                      TextSpan(text: 'No. DO Vendor ', style: const TextStyle(fontWeight: FontWeight.bold)) ,
                      TextSpan(text: 'harus diisi!'),
                    ],
                  ),
                ) :
                Baps.no_po.isEmpty ?
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: 'Data '),
                      TextSpan(text: 'No. PO ', style: const TextStyle(fontWeight: FontWeight.bold)) ,
                      TextSpan(text: 'harus diisi!'),
                    ],
                  ),
                ) :
                Baps.volume_sj_voucher.isEmpty ?
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: 'Data '),
                      TextSpan(text: 'Volume SJ/Voucher ', style: const TextStyle(fontWeight: FontWeight.bold)) ,
                      TextSpan(text: 'harus diisi!'),
                    ],
                  ),
                ) :
                Baps.supplier_name.isEmpty ?
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: 'Data '),
                      TextSpan(text: 'nama supplier ', style: const TextStyle(fontWeight: FontWeight.bold)) ,
                      TextSpan(text: 'harus diisi!'),
                    ],
                  ),
                ) :
                Baps.driver_name.isEmpty ?
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: 'Data '),
                      TextSpan(text: 'nama driver ', style: const TextStyle(fontWeight: FontWeight.bold)) ,
                      TextSpan(text: 'harus diisi!'),
                    ],
                  ),
                ) :
                Baps.vehicle_no.isEmpty ?
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: 'Data '),
                      TextSpan(text: 'no. vehicle ', style: const TextStyle(fontWeight: FontWeight.bold)) ,
                      TextSpan(text: 'harus diisi!'),
                    ],
                  ),
                ) :
                Baps.capacity.isEmpty ?
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: 'Data '),
                      TextSpan(text: 'kapasitas tangki ', style: const TextStyle(fontWeight: FontWeight.bold)) ,
                      TextSpan(text: 'harus diisi!'),
                    ],
                  ),
                ) :
                Baps.segel_begin.isEmpty ?
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: 'Data '),
                      TextSpan(text: 'segel awal ', style: const TextStyle(fontWeight: FontWeight.bold)) ,
                      TextSpan(text: 'harus diisi!'),
                    ],
                  ),
                ) :
                Baps.segel_end.isEmpty ?
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: 'Data '),
                      TextSpan(text: 'segel akhir ', style: const TextStyle(fontWeight: FontWeight.bold)) ,
                      TextSpan(text: 'harus diisi!'),
                    ],
                  ),
                ) :
                Baps.totalisator_begin.isEmpty ?
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: 'Data '),
                      TextSpan(text: 'totalisator awal ', style: const TextStyle(fontWeight: FontWeight.bold)) ,
                      TextSpan(text: 'harus diisi!'),
                    ],
                  ),
                ) :
                Baps.totalisator_end.isEmpty ?
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: 'Data '),
                      TextSpan(text: 'totalisator akhir ', style: const TextStyle(fontWeight: FontWeight.bold)) ,
                      TextSpan(text: 'harus diisi!'),
                    ],
                  ),
                ) :
                Baps.volume_pengisian.isEmpty ?
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: 'Data '),
                      TextSpan(text: 'volume pengisian ', style: const TextStyle(fontWeight: FontWeight.bold)) ,
                      TextSpan(text: 'harus diisi!'),
                    ],
                  ),
                ) :
                Baps.sounding_begin.isEmpty ?
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: 'Data '),
                      TextSpan(text: 'sounding awal ', style: const TextStyle(fontWeight: FontWeight.bold)) ,
                      TextSpan(text: 'harus diisi!'),
                    ],
                  ),
                ) :
                Baps.sounding_end.isEmpty ?
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: 'Data '),
                      TextSpan(text: 'sounding akhir ', style: const TextStyle(fontWeight: FontWeight.bold)) ,
                      TextSpan(text: 'harus diisi!'),
                    ],
                  ),
                ) :
                Baps.sg_observed.isEmpty ?
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: 'Data '),
                      TextSpan(text: 'SG observed ', style: const TextStyle(fontWeight: FontWeight.bold)) ,
                      TextSpan(text: 'harus diisi!'),
                    ],
                  ),
                ) :
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: 'Data '),
                      TextSpan(text: 'Temperatur observed ', style: const TextStyle(fontWeight: FontWeight.bold)) ,
                      TextSpan(text: 'harus diisi!'),
                    ],
                  ),
                )
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Oke'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  ///camera
  Future<CameraDescription> getCamera() async {
  WidgetsFlutterBinding.ensureInitialized();

  final cameras = await availableCameras();
  final firstCamera = cameras.first;
  return firstCamera;
  }

}



