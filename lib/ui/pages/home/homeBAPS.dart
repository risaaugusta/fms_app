part of '../pages.dart';

class homeBAPS extends StatefulWidget {
  const homeBAPS({Key? key}) : super(key: key);

  @override
  _homeBAPSState createState() => _homeBAPSState();
}

class _homeBAPSState extends State<homeBAPS> {
  String unitType = "Fuel Truck";
  String unitCode = "FT1125";
  int budget = 450;

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    homeLansiran(),
    Text(
      'Index 1: Manual',
      style: optionStyle,
    ),
    Text(
      'Index 2: Notif',
      style: optionStyle,
    ),
    Profile(),
  ];

  List<Item> DataItems = generateItems(16);
  List<Item> DestinationItems = generateItems(1);
  List<Item> SignatureItems = generateItems(1);
  List<String> headerDataValue=<String>[
    'No. SJ',
    'No. DO Vendor',
    'Vol SJ/Voucher',
    'Nama Supplier',
    'Nama Driver',
    'No Vehicle',
    'Volume',
    'Segel Awal',
    'Segel Akhir',
    'Deviasi',
    'Sounding Awal',
    'Sounding Akhir',
    'Segel Observed',
    'Segel DO',
    'Temp Observed',
    'Temp DO',
  ];
  List<String> headerDestinationValue=<String>[
    'Fuel Truck ID',
    'Tanda Tangan'
  ];
  List<String> headerSignatureValue=<String>[
    'Tanda Tangan'
  ];
  List<Item> PhotoItems = generateItems(7);
  List<String> headerPhotoValue=<String>[
    'Totalisator Awal',
    'Totalisator Akhir',
    'Flow Meter',
    'Tanda Tangan Vendor',
    'Tanda Tangan PIC Penerima',
    'Tanda Tangan Leader',
    'Tanda Tangan PM Site',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  ScrollController _controller = new ScrollController();

  @override
  Widget build(BuildContext context) {
    TrBaps trBaps = TrBaps(
      // baps_id: Baps.bBapsId,
      site_id: (Baps.bSiteId).toString(),
      // shift_id: Baps.bShiftId,
      // operator_id: (Baps.bOperatorId).toString(),
      approval_id: Baps.bApprovalId,
      notes: Baps.bNotes,
      baps_status: Baps.bBapsStatus,
      created_at: Global.time,
      // created_by:'',
      // modified_by:'',
      modified_at: Global.time,
    );
    TrBapsDetail trBapsDetail = TrBapsDetail(
      sj_solar_transportir_no: BapsDetail.bdSjSolarTransportirNo,
      do_vendor_no: BapsDetail.bdDoVendorNo,
      pr_po_no: BapsDetail.bdPrPoNo,
      supplier_name: BapsDetail.bdSupplierName,
      driver_name: BapsDetail.bdDriverName,
      vehicle_no: BapsDetail.bdVehicleNo,
      storage_id: BapsDetail.bdStorageId,
      volume: BapsDetail.bdVolume,
      segel_begin: BapsDetail.bdSegelBegin,
      segel_end: BapsDetail.bdSegelEnd,
      totalisator_begin: BapsDetail.bdTotalisatorBegin,
      totalisator_end: BapsDetail.bdTotalisatorEnd,
      flowmeter: BapsDetail.bdFlowmeter,
      deviation: BapsDetail.bdDeviation,
      sounding_begin: BapsDetail.bdSoundingBegin,
      sounding_end: BapsDetail.bdSoundingEnd,
      sg_observed: BapsDetail.bdSgObserved,
      sg_do: BapsDetail.bdSgDo,
      temp_observed: BapsDetail.bdTempObserved,
      temp_do: BapsDetail.bdTempDo,
    );
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
              Container(
                margin: EdgeInsets.only(top:20, bottom:20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: 100,
                        width: 100,
                        decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Color(0xffE4E4E4),
                            )
                        ),
                        child: new Image.asset('assets/img/truck.png')
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text(
                            'Unit Code',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.grey,
                                fontFamily: Fonts.REGULAR,fontSize: 18)
                        ),
                        SizedBox(height: 10),
                        Text(
                            'Unit Type',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.grey,
                                fontFamily: Fonts.REGULAR,fontSize: 18)
                        ),
                        SizedBox(height: 10),
                        Text(
                            'Budget',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.grey,
                                fontFamily: Fonts.REGULAR,fontSize: 18)
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text(
                            '$unitCode',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.black,
                                fontFamily: Fonts.REGULAR,fontSize: 18)
                        ),
                        SizedBox(height: 10),
                        Text(
                            '$unitType ',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.black,
                                fontFamily: Fonts.REGULAR,fontSize: 18)
                        ),
                        SizedBox(height: 10),
                        Text(
                            '$budget ' + 'L' ,
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.black,
                                fontFamily: Fonts.REGULAR,fontSize: 18)
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Divider(
                  color: Color(0xffF5F5F5),
                  thickness: 5,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, bottom: 15),
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
                        title:
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
                            onChanged: (value) {
                              if (headerDataValue[index] ==
                                  headerDataValue[0]) {
                                BapsDetail.bdSjSolarTransportirNo = value;
                              }else if ( headerDataValue[index] ==
                                  headerDataValue[1]){
                                BapsDetail.bdDoVendorNo = value;
                              }else if ( headerDataValue[index] ==
                                  headerDataValue[2]){
                                BapsDetail.bdPrPoNo = value;
                              }else if ( headerDataValue[index] ==
                                  headerDataValue[3]){
                                BapsDetail.bdSupplierName = value;
                              }else if ( headerDataValue[index] ==
                                  headerDataValue[4]){
                                BapsDetail.bdDriverName = value;
                              }else if ( headerDataValue[index] ==
                                  headerDataValue[5]){
                                BapsDetail.bdVehicleNo = value;
                              }else if ( headerDataValue[index] ==
                                  headerDataValue[6]){
                                BapsDetail.bdVolume = value;
                              }else if ( headerDataValue[index] ==
                                  headerDataValue[7]){
                                BapsDetail.bdSegelBegin = value;
                              }else if ( headerDataValue[index] ==
                                  headerDataValue[8]){
                                BapsDetail.bdSegelEnd = value;
                              }else if ( headerDataValue[index] ==
                                  headerDataValue[9]){
                                BapsDetail.bdDeviation = value;
                              }else if ( headerDataValue[index] ==
                                  headerDataValue[10]){
                                BapsDetail.bdSoundingBegin = value;
                              }else if ( headerDataValue[index] ==
                                  headerDataValue[11]){
                                BapsDetail.bdSoundingEnd = value;
                              }else if ( headerDataValue[index] ==
                                  headerDataValue[12]){
                                BapsDetail.bdSgObserved = value;
                              }else if ( headerDataValue[index] ==
                                  headerDataValue[13]){
                                BapsDetail.bdSgDo = value;
                              }else if ( headerDataValue[index] ==
                                  headerDataValue[14]){
                                BapsDetail.bdTempObserved = value;
                              }else { BapsDetail.bdTempDo = value ;}
                            }, //dummy value
                          ),
                        )
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
                                Baps.bSiteId=value;
                            }, ////dummy value
                          ),
                        )
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
                            headerPhotoValue[3] ?
                        SignaturePad(signature: null,callback: (ttd)=> trBapsDetail.storage_id = ttd) :
                        headerPhotoValue[index] ==
                            headerPhotoValue[4] ?
                        SignaturePad(signature: null,callback: (ttd)=> trBapsDetail.storage_id = ttd) :
                        headerPhotoValue[index] ==
                            headerPhotoValue[5] ?
                        SignaturePad(signature: null,callback: (ttd)=> trBapsDetail.storage_id = ttd) :
                        headerPhotoValue[index] ==
                            headerPhotoValue[6] ?
                        SignaturePad(signature: null,callback: (ttd)=> trBapsDetail.storage_id = ttd) :
                        UploaderDropdown(callback:(String filePath){
                          if (headerPhotoValue[index] ==
                              headerPhotoValue[0]) {
                            Baps.bApprovalId = filePath;
                            BapsDetail.bdTotalisatorBegin = filePath;
                          }else if ( headerPhotoValue[index] ==
                              headerPhotoValue[1]){
                            Baps.bNotes = filePath;
                            BapsDetail.bdTotalisatorEnd = filePath;
                          }else { Baps.bBapsStatus = filePath ;
                          BapsDetail.bdFlowmeter = filePath;}
                        })
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
                      onPressed: () {
                        // print(trBapsDetail.toJson());
                        // FmsDatabase.instance.createBaps(trBaps).then((value) => {_dialogAlert()});
                        // FmsDatabase.instance.createBapsDetail(trBapsDetail).then((value) => {_dialogAlert()});
                        _dialogAlert();
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
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          child: Icon(Icons.qr_code, color: Coloring.mainColor),
          onPressed: ()
          {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Scanner()),
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                              'Home',
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
                              'Manual',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: _selectedIndex == 1 ? Coloring.mainColor : Colors.grey,
                                  fontFamily: Fonts.REGULAR,fontSize: 14)
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
}


