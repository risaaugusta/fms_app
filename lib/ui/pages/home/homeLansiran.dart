part of '../pages.dart';

class homeLansiran extends StatefulWidget {
  const homeLansiran({Key? key}) : super(key: key);

  @override
  _homeLansiranState createState() => _homeLansiranState();
}

class _homeLansiranState extends State<homeLansiran> {
  String unitType = "Fuel Truck";
  String unitCode = "FT1125";
  int budget = 450;
  List<Item> PhotoItems = generateItems(2);
  List<String> headerPhotoValue=<String>[
    'Photo Meter Fuel',
    'Photo HM Unit'
  ];

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    homeLansiran(),
    HomeManual(),
    Text(
      'Index 2: Notif',
      style: optionStyle,
    ),
    Profile(),
  ];

  List<Item> lansiranItems = generateItems(7);
  List<String> headerLansiranValue = <String>[
    'Storage ID',
    'Operator Unit',
    'Totalisator Awal',
    'Totalisator Akhir',
    'Volume Sebelum',
    'Jumlah Liter Pengisian',
    'Total Volume'
  ];

  Lansiran lansiran = Lansiran(
      storageId: '',
      nik: '',
      jml: 0,
      totalisatorAwal: 0,
      totalisatorAkhir: 0,
      volSebelum: 0,
      volTotal: 0);

  TrFuelDistribution trFuelDistribution = TrFuelDistribution(
    // transactions_id: Refueling.fTransactionsId,
    equipment_id:  '',
    // storage_id: '',
    site_id: Refueling.fSiteId,
    // shift_id: '',
    fuel_filling: (Refueling.fFilling).toString(),
    fuel_totalisator_awal: (Refueling.fTotalisatorAwal).toString(),
    fuel_totalisator_akhir: Refueling.fTotalisatorAkhir,
    hm_equipment: Refueling.fHmEquipment,
    // storage_operator: Refueling.fStorageOperator,
    // equipment_operator: Refueling.fEquipmentOperator,
    image_directory: Refueling.fImageDirectory,
    image_name: Refueling.fImageName,
    // equipment_budget: '',
    // is_active: '',
    // created_by: '',
    created_at: Global.time,
    // updated_by: '',
    updated_at: Global.time,
    // attendance_id: '',
  );

  MsStorage? msStorage;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  ScrollController _controller = new ScrollController();
  TextEditingController textEditingController = TextEditingController();
  var velocityEditingController = TextEditingController();
  var finalValue = TextEditingController();

  int airFlow = 0;
  int velocity=0;
  int valueFinal=0;
  String sam='', sam2='';
  String airFlowText='', velocityText='', finalText='';

  @override
  void initState() {
    super.initState();
    finalValue.addListener(() => setState(() {}));
  }

  String totalCalculated() {
    airFlowText = textEditingController.text;
    velocityText = velocityEditingController.text;
    finalText = finalValue.text;

    if (airFlowText != '' && velocityText != '') {
      Refueling.fTotalisatorAkhir = (Refueling.fFilling + Refueling.fTotalisatorAwal).toString();
      finalValue.value = finalValue.value.copyWith(
        text: Refueling.fTotalisatorAkhir.toString(),
      );
    }
    return Refueling.fTotalisatorAkhir;
  }

  @override
  Widget build(BuildContext context) {
    TrFuelTransfer trFuelTransfer = TrFuelTransfer(
      // transactions_id: FuelTransfer.tTransactionsId,
      site_id: FuelTransfer.tSiteId,
      // shift_id: FuelTransfer.tShiftId,
      storage_source: (FuelTransfer.tStorageSource).toString(),
      flowmeter_source: (FuelTransfer.tStorageSource).toString(),
      totalisator_source_begin: (FuelTransfer.tTotalisatorSourceBegin).toString(),
      totalisator_source_end: (FuelTransfer.tTotalisatorSourceEnd).toString(),
      storage_destination: (FuelTransfer.tStorageDestination).toString(),
      flowmeter_dst: (FuelTransfer.tFlowmeterDst).toString(),
      totalisator_dst_begin: (FuelTransfer.tTotalisatorDstBegin).toString(),
      totalisator_dst_end: (FuelTransfer.tTotalisatorDstEnd).toString(),
      // attendance_id: (FuelTransfer.tAttendanceId).toString(),
      // approval_id: FuelTransfer.tApprovalId,
      // is_active: FuelTransfer.tIsActive,
      created_at: Global.time,
      // created_by: '',
      // modified_by: '',
      modified_at: Global.time,
    );
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _selectedIndex == 0
            ? AppBar(
                leading: new IconButton(
                  icon: new Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => homeDashboard()),
                    );
                  },
                ),
                title: const Text('Lansiran Fuel Truck',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: Fonts.REGULAR,
                        fontSize: 18)),
                backgroundColor: Colors.white,
              )
            : null,
        body: _selectedIndex == 0
            ? SingleChildScrollView(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20, bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Color(0xffE4E4E4),
                                  )),
                              child: new Image.asset('assets/img/truck.png')),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Text('Unit Code',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: Fonts.REGULAR,
                                      fontSize: 18)),
                              SizedBox(height: 10),
                              Text('Unit Type',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: Fonts.REGULAR,
                                      fontSize: 18)),
                              SizedBox(height: 10),
                              Text('Budget',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: Fonts.REGULAR,
                                      fontSize: 18)),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Text('$unitCode',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: Fonts.REGULAR,
                                      fontSize: 18)),
                              SizedBox(height: 10),
                              Text('$unitType ',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: Fonts.REGULAR,
                                      fontSize: 18)),
                              SizedBox(height: 10),
                              Text('$budget ' + 'L',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: Fonts.REGULAR,
                                      fontSize: 18)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Divider(
                        color: Color(0xffF5F5F5),
                        thickness: 20,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15, bottom: 15),
                      child: Text('Destination',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: Fonts.REGULAR,
                              fontSize: 18)),
                    ),
                    ExpansionPanelList(
                      expansionCallback: (int index, bool isExpanded) {
                        setState(() {
                          lansiranItems[index].isExpanded = !isExpanded;
                        });
                      },
                      children: lansiranItems
                          .asMap()
                          .map<int, ExpansionPanel>((index, Item item) =>
                              MapEntry(
                                index,
                                ExpansionPanel(
                                  headerBuilder:
                                      (BuildContext context, bool isExpanded) {
                                    return ListTile(
                                      contentPadding: EdgeInsets.only(left: 30),
                                      title: Text(
                                          '${headerLansiranValue[index]}',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontFamily: Fonts.REGULAR,
                                              fontSize: 14)),
                                    );
                                  },
                                  body: ListTile(
                                    title: headerLansiranValue[index] ==
                                            headerLansiranValue[0]
                                        ? StorageDropdown(callback:(String callback){
                                          // trFuelDistribution.storage_id = callback;
                                    },)
                                        : Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.8,
                                            margin: EdgeInsets.symmetric(
                                                vertical: 10),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: TextFormField(
                                              autofocus: false,
                                              decoration: InputDecoration(
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  borderSide: BorderSide(
                                                    color: Colors.grey.shade200,
                                                  ),
                                                ),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  borderSide: BorderSide(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                fillColor: Color(0xffFFFFFF),
                                                filled: true,
                                                contentPadding:
                                                    EdgeInsets.fromLTRB(
                                                        20.0, 10.0, 20.0, 10.0),
                                              ),

                                              ///value tr fuel distribution
                                              onChanged: (value) {
                                                if (headerLansiranValue[
                                                index] ==
                                                    headerLansiranValue[0]) {
                                                  FuelTransfer.tSiteId=value;
                                                } else if (headerLansiranValue[
                                                index] ==
                                                    headerLansiranValue[1]) {
                                                    FuelTransfer.tStorageSource = value as int;
                                                } else if (headerLansiranValue[
                                                index] ==
                                                    headerLansiranValue[2]) {
                                                  FuelTransfer.tTotalisatorDstBegin = int.parse(value.toString());
                                                } else if (headerLansiranValue[
                                                index] ==
                                                    headerLansiranValue[3]) {
                                                  FuelTransfer.tTotalisatorDstEnd = int.parse(value.toString());
                                                } else if (headerLansiranValue[
                                                index] ==
                                                    headerLansiranValue[4]) {
                                                  FuelTransfer.tFlowmeterSource= int.parse(value.toString());
                                                } else if (headerLansiranValue[
                                                index] ==
                                                    headerLansiranValue[5]) {
                                                  FuelTransfer.tFlowmeterDst = int.parse(value.toString());
                                                } else if (headerLansiranValue[
                                                index] ==
                                                    headerLansiranValue[6]) {
                                                  FuelTransfer.tStorageDestination = int.parse(value.toString());
                                                } else {
                                                  null;
                                                }
                                              }, //
                                            ),
                                          ),
                                  ),
                                  isExpanded: item.isExpanded,
                                ),
                              ))
                          .values
                          .toList(),
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
                              UploaderDropdown(callback:(String filePath){
                                headerPhotoValue[index] ==
                                    headerPhotoValue[0] ?
                                FuelTransfer.tFlowmeterSource = filePath.toString() as int :  FuelTransfer.tFlowmeterDst = int.parse(filePath.toString()) ;
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
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      height: 50,
                      child: ButtonTheme(
                        minWidth: MediaQuery.of(context).size.width,
                        child: Container(
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                side: BorderSide(color: Coloring.mainColor)),
                            onPressed: () {
                              // print(trFuelTransfer.toJson());
                              // FmsDatabase.instance.createTransfer(trFuelTransfer).then((value) => {_dialogAlert()});
                              _dialogAlert();
                            },
                            color: Coloring.mainColor,
                            textColor: Colors.white,
                            child: Text("Kirim",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: Fonts.REGULAR,
                                    fontSize: 18)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 50)
                  ],
                ),
              )
            : ListView(
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
          onPressed: () {
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
                      minWidth: 40,
                      onPressed: () {
                        Navigator.pop(
                          context,
                          MaterialPageRoute(
                              builder: (context) => homeDashboard()),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.home,
                            color: _selectedIndex == 0
                                ? Coloring.mainColor
                                : Colors.grey,
                          ),
                          Text('Home',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: _selectedIndex == 0
                                      ? Coloring.mainColor
                                      : Colors.grey,
                                  fontFamily: Fonts.REGULAR,
                                  fontSize: 14)),
                        ],
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          _selectedIndex = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.article_rounded,
                            color: _selectedIndex == 1
                                ? Coloring.mainColor
                                : Colors.grey,
                          ),
                          Text('Sync',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: _selectedIndex == 1
                                      ? Coloring.mainColor
                                      : Colors.grey,
                                  fontFamily: Fonts.REGULAR,
                                  fontSize: 14)),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
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
                            color: _selectedIndex == 2
                                ? Coloring.mainColor
                                : Colors.grey,
                          ),
                          Text('Notifikasi',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: _selectedIndex == 2
                                      ? Coloring.mainColor
                                      : Colors.grey,
                                  fontFamily: Fonts.REGULAR,
                                  fontSize: 14)),
                        ],
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          _selectedIndex = 3;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.account_circle,
                            color: _selectedIndex == 3
                                ? Coloring.mainColor
                                : Colors.grey,
                          ),
                          Text('Profil',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: _selectedIndex == 3
                                      ? Coloring.mainColor
                                      : Colors.grey,
                                  fontFamily: Fonts.REGULAR,
                                  fontSize: 14)),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
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
