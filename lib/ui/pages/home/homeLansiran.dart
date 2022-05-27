part of '../pages.dart';

class homeLansiran extends StatefulWidget {
  const homeLansiran({Key? key}) : super(key: key);

  @override
  _homeLansiranState createState() => _homeLansiranState();
}

class _homeLansiranState extends State<homeLansiran> {
  int _selectedIndex = 0;
  String? imagePath;
  TrFuelTransfer? trFuelTransfer;
  List<Widget> _widgetOptions = <Widget>[
    homeLansiran(),
    HomeManual(),
    homeNotifikasi(),
    Profile(),
  ];

  List<Item> sourceItems = generateItems(7);
  List<Item> destinationItems = generateItems(3);
  List<String> headerSourceValue = <String>[
    'Storage ID',
    'Sounding Awal',
    'Totalisator Awal',
    'Jumlah Liter Pengisian',
    'Totalisator Akhir',
    'Sounding Akhir',
    'Photo Flowmeter',
  ];
  List<String> headerDestinationValue = <String>[
    'Storage ID',
    'Sounding Awal',
    'Sounding Akhir',
  ];

  MsStorage? msStorage;

  ScrollController _controller = new ScrollController();
  TextEditingController textEditingController = TextEditingController();
  // void camInit() async {
  //   final cameras = await availableCameras();
  //   final firstCamera = cameras.first;
  // }

  @override
  void initState()  {
    super.initState();
    Global.getLocalStorage();
  }


  @override
  Widget build(BuildContext context) {

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
                      margin: EdgeInsets.only(top:20, bottom:20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              height: 70,
                              width: 70,
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
                                  'Tanggal',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(color: Colors.grey,
                                      fontFamily: Fonts.REGULAR,fontSize: 18)
                              ),
                              SizedBox(height: 10),
                              Text(
                                  'Shift',
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
                                  Global.time,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(color: Colors.black,
                                      fontFamily: Fonts.REGULAR,fontSize: 18)
                              ),
                              SizedBox(height: 10),
                              FutureBuilder<List>(
                                future: FmsDatabase.instance.readAttendance(), // a previously-obtained Future<String> or null
                                builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                                  List<Widget> children;
                                  if (snapshot.hasData) {
                                    return  snapshot.data!.length > 0 ?
                                    Text(
                                        snapshot.data![0]['shift_desc'] ,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(color: Colors.black,
                                            fontFamily: Fonts.REGULAR,fontSize: 18)
                                    ) : Text(
                                        'Silakan input attendance' ,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(color: Colors.grey,
                                            fontStyle: FontStyle. italic,
                                            fontFamily: Fonts.REGULAR,fontSize: 18)
                                    );
                                  } else if (snapshot.hasError) {
                                    return Container(
                                      child: Text('Tidak ada data'),
                                    );
                                  } else {
                                    return Container(
                                        child: Text('Tidak ada data')
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey[70],
                      thickness: 3,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15, bottom: 15, top: 5),
                      child: Text('Source',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: Fonts.REGULAR,
                              fontSize: 18)),
                    ),
                    ExpansionPanelList(
                      expansionCallback: (int index, bool isExpanded) {
                        setState(() {
                          sourceItems[index].isExpanded = !isExpanded;
                        });
                      },
                      children: sourceItems
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
                                      '${headerSourceValue[index]}',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: Fonts.REGULAR,
                                          fontSize: 14)),
                                );
                              },
                              body: ListTile(
                                title: headerSourceValue[index] ==
                                    headerSourceValue[0]
                                    ?  StorageDropdown(callback: (value)
                                {
                                  FuelTransfer.storage_source = value;
                                })
                                    : headerSourceValue[index] ==
                                    headerSourceValue[6]
                                    ?
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
                                              FuelTransfer.flowmeter_source = url;
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
                                    FuelTransfer.flowmeter_source == '' ? Container() :
                                    Image.file(File(FuelTransfer.flowmeter_source))
                                  ],
                                )
                                // UploaderDropdown(callback:(String filePath){
                                //   FuelTransfer.flowmeter_source = filePath;
                                // })
                                    : headerSourceValue[index] ==
                                    headerSourceValue[4]
                                    ? Container(
                                      width: MediaQuery.of(context).size.width / 1.8,
                                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                      decoration:
                                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                                      child: Text(
                                          FuelTransfer.totalisator_source_end,
                                          style: TextStyle(color: Colors.black, fontFamily: Fonts.REGULAR,fontSize: 18))
                                  )
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
                                        onChanged: (value) {
                                          if (headerSourceValue[
                                          index] ==
                                              headerSourceValue[1]) {
                                            FuelTransfer.sounding_source_begin=value;
                                          } else if (headerSourceValue[
                                          index] ==
                                              headerSourceValue[2]) {
                                            FuelTransfer.totalisator_source_begin = value;
                                          } else if (headerSourceValue[
                                          index] ==
                                              headerSourceValue[3]) {
                                            FuelTransfer.volume_pengisian = value;
                                          }  else if (headerSourceValue[
                                          index] ==
                                              headerSourceValue[5]) {
                                            FuelTransfer.sounding_source_end= value;
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
                    Padding(
                      padding: EdgeInsets.only(left: 15, bottom: 15, top: 15),
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
                          destinationItems[index].isExpanded = !isExpanded;
                        });
                      },
                      children: destinationItems
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
                                          '${headerDestinationValue[index]}',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontFamily: Fonts.REGULAR,
                                              fontSize: 14)),
                                    );
                                  },
                                  body: ListTile(
                                    title: headerDestinationValue[index] ==
                                            headerDestinationValue[0]
                                        ? StorageDropdown(callback: (value)
                                    {
                                      FuelTransfer.storage_dst = value;
                                    })
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
                                              onChanged: (value) {
                                                if (headerDestinationValue[
                                                index] ==
                                                    headerDestinationValue[1]) {
                                                  FuelTransfer.sounding_dst_begin=value;
                                                }  else {
                                                  FuelTransfer.sounding_dst_end=value;
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
                            onPressed: () async {
                              trFuelTransfer = TrFuelTransfer(
                                storage_source: FuelTransfer.storage_source,
                                sounding_begin_source: FuelTransfer.sounding_source_begin,
                                sounding_end_source: FuelTransfer.sounding_source_end,
                                totalisator_begin_source: FuelTransfer.totalisator_source_begin,
                                totalisator_end_source: FuelTransfer.totalisator_source_end,
                                photo_flowmeter: FuelTransfer.flowmeter_source,
                                volume: FuelTransfer.volume_pengisian,
                                storage_dst: FuelTransfer.storage_dst,
                                sounding_begin_dst: FuelTransfer.sounding_dst_begin,
                                sounding_end_dst: FuelTransfer.sounding_dst_end,
                                shift_id: (await FmsDatabase.instance.readAttendance())[0]['shift_id'].toString(),
                                site_id: (await FmsDatabase.instance.readAttendance())[0]['site_id'].toString(),
                                material_number: 'SOLAR',
                                created_at: Global.time,
                                created_by: (await FmsDatabase.instance.readAttendance())[0]['employee_name'].toString(),
                              );
                              FmsDatabase.instance.createTransfer(trFuelTransfer!).then((value) => {_dialogAlert()});
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
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 60,
            child: Row(
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

  ///camera
  Future<CameraDescription> getCamera() async {
    WidgetsFlutterBinding.ensureInitialized();

    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    return firstCamera;
  }
}
