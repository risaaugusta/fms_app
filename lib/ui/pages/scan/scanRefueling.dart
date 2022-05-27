part of '../pages.dart';

class scanRefueling extends StatefulWidget {
  final String barcode_id;
  const scanRefueling({required this.barcode_id});


  @override
  _scanRefuelingState createState() => _scanRefuelingState();
}

class _scanRefuelingState extends State<scanRefueling> {
  Barcode? barcode;
  String? imagePath;
  TrRefueling? trRefueling;
  StreamController<String> budgetStream = StreamController();
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController _fuelConsumption = TextEditingController();
  final TextEditingController _budget = TextEditingController();
  List<Item> PhotoItems = generateItems(2);
  List<String> headerPhotoValue=<String>[
    'Photo Meter Fuel',
    'Photo HM Unit'
  ];
  String value ='';
  List selectedEquipment = [];


  @override
  void initState() {
    super.initState();
    Global.getLocalStorage();
    this.callbackUpdateBudget();
  }

  @override
  void callbackUpdateBudget() async{
    budgetStream.add('Calculating...');
    String budget = await Refueling.budget_;
    budgetStream.add(budget);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back,color: Colors.black,),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => homeDashboard()),
              );
            },
          ),
          title: const Text('Refueling',
              style: TextStyle(color: Colors.black,
                  fontFamily: Fonts.REGULAR,fontSize: 18)),
          backgroundColor: Colors.white,
        ),
      body: SingleChildScrollView(
        child: Form(
          key: _form,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: 70,
                        width: 50,
                        child: new Image.asset('assets/img/truck.png')
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Unit Code',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.grey,
                                fontFamily: Fonts.REGULAR,fontSize: 18)
                        ),
                        Text(
                            'Unit Type',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.grey,
                                fontFamily: Fonts.REGULAR,fontSize: 18)
                        ),
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
                        Text(
                            widget.barcode_id,
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.black,
                                fontFamily: Fonts.REGULAR,fontSize: 18)
                        ),
                        FutureBuilder<List>(
                          future: FmsDatabase.instance.readAttendance(), // a previously-obtained Future<String> or null
                          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                            List<Widget> children;
                            if (snapshot.hasData) {
                              return  snapshot.data!.length > 0 ?
                              Text(
                                  snapshot.data![0]['storage_id'] ,
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
                        StreamBuilder<String>(
                          stream:  budgetStream.stream, // a previously-obtained Future<String> or null
                          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                            List<Widget> children;
                            if (snapshot.hasData) {
                              return  Text(
                                  snapshot.data! + ' L' ,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(color: Colors.black,
                                      fontFamily: Fonts.REGULAR,fontSize: 18)
                              );
                            } else if (snapshot.hasError) {
                              return Container(
                                child: Text('Error'),
                              );
                            } else {
                              return Container(
                                  child: Text('Calculating...')
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
                padding: const EdgeInsets.all(15),
                child: Text(
                    'Input Data',
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.black,
                        fontFamily: Fonts.REGULAR,fontSize: 18)
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15,bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 15),
                        Text(
                            'Input HM',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.black,
                                fontFamily: Fonts.REGULAR,fontSize: 14)
                        ),
                        SizedBox(height: 45),
                        Text(
                            'Input Operator',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.black,
                                fontFamily: Fonts.REGULAR,fontSize: 14)
                        ),
                        SizedBox(height: 50),
                        Text(
                            'Totalisator Awal',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.black,
                                fontFamily: Fonts.REGULAR,fontSize: 14)
                        ),
                        SizedBox(height: 45),
                        Text(
                            'Input Fuel',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.black,
                                fontFamily: Fonts.REGULAR,fontSize: 14)
                        ),

                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width/1.8,
                          decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(20)),
                          child: TextFormField(
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
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
                                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              ),
                              onChanged: (value) {
                                Refueling.hm_input = value;
                                this.callbackUpdateBudget();
                              }, //dummy value
                            ),
                        ),
                        OperatorDropdown(callback: (suggestion) {
                          Refueling.nama_operator = suggestion;
                          this.callbackUpdateBudget();
                        }),
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width/4.8,
                                decoration:
                                BoxDecoration(borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  autofocus: false,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.grey.shade200,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                    fillColor: Color(0xffFFFFFF),
                                    filled: true,
                                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                                  ),
                                  onChanged: (value) {
                                     Refueling.totalisator_begin = value;
                                     this.callbackUpdateBudget();
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10,right: 10),
                                child: Text(
                                    'Akhir',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(color: Colors.black,
                                        fontFamily: Fonts.REGULAR,fontSize: 14)
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width/4.8,
                                decoration:
                                BoxDecoration(borderRadius: BorderRadius.circular(10)),
                                child:  Text(
                                    Refueling.totalisator_end,
                                    style: TextStyle(color: Colors.black, fontFamily: Fonts.REGULAR,fontSize: 18))
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width/1.8,
                          margin: EdgeInsets.only(top:15),
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
                              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                            ),
                            onChanged: (value) {
                              Refueling.fuel_consumption = value;
                              this.callbackUpdateBudget();
                            }, //dummy value
                          ),
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
                        // UploaderDropdown(callback:(String filePath){
                        //   headerPhotoValue[index] ==
                        //       headerPhotoValue[0] ?
                        //   Refueling.photo_meter_fuel = filePath :  Refueling.photo_hm_unit = filePath;
                        // })
                        headerPhotoValue[index] ==
                            headerPhotoValue[0] ?
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
                                      Refueling.photo_meter_fuel = url;
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
                            Refueling.photo_meter_fuel == '' ? Container() :
                            Image.file(File(Refueling.photo_meter_fuel))
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
                                      Refueling.photo_hm_unit = url;
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
                            Refueling.photo_hm_unit == '' ? Container() :
                            Image.file(File(Refueling.photo_hm_unit))
                            // Text(Baps.photo_totalisator_end)
                          ],
                        )
                    ),
                    isExpanded: item.isExpanded,
                  ),
                )).values.toList(),
              ),
              Container(
                margin:  EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                height: 60,
                alignment: Alignment.center,
                child: ButtonTheme(
                  minWidth: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Container(
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(color: Coloring.mainColor)),
                      onPressed: () async {
                        trRefueling = TrRefueling(
                          unit_code: widget.barcode_id,
                          unit_type: (await FmsDatabase.instance.readAttendance())[0]['storage_id'].toString(),
                          hm_input: Refueling.hm_input,
                          nama_operator: Refueling.nama_operator,
                          totalisator_begin: Refueling.totalisator_begin,
                          totalisator_end: Refueling.totalisator_end,
                          fuel_consumption: Refueling.fuel_consumption,
                          budget: await Refueling.budget_,
                          status: Refueling.status,
                          photo_meter_fuel: Refueling.photo_meter_fuel,
                          photo_hm_unit: Refueling.photo_hm_unit,
                          shift_id:  (await FmsDatabase.instance.readAttendance())[0]['shift_id'].toString(),
                          site_id: (await FmsDatabase.instance.readAttendance())[0]['site_id'].toString(),
                          created_at: Global.time,
                          created_by: (await FmsDatabase.instance.readAttendance())[0]['employee_name'].toString(),
                          material_number: 'SOLAR'
                        );
                        if(Refueling.hm_input.isEmpty || Refueling.nama_operator.isEmpty ||
                            Refueling.totalisator_begin.isEmpty|| Refueling.fuel_consumption.isEmpty|| Refueling.fuel_consumption.isEmpty ||
                            Refueling.photo_hm_unit.isEmpty  || Refueling.photo_meter_fuel.isEmpty ){
                          _dialogMandatory();
                        }else{
                          FmsDatabase.instance.createRefueling(trRefueling!).then((value) => {_dialogAlert()});
                        }
                        // FmsDatabase.instance.createRefueling(trRefueling!).then((value) => {_dialogAlert()});
                      },
                      color: Coloring.mainColor,
                      textColor: Colors.white,
                      child: Text("Kirim",
                          style: TextStyle(color: Colors.white, fontFamily: Fonts.REGULAR,fontSize: 18)),
                    ),
                  ),
                ),
              ),
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
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => homeDashboard()),(route)=>false);
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
                Refueling.hm_input.isEmpty ?
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: 'Data '),
                      TextSpan(text: 'HM input ', style: const TextStyle(fontWeight: FontWeight.bold)) ,
                      TextSpan(text: 'harus diisi!'),
                    ],
                  ),
                ) :
                Refueling.nama_operator.isEmpty ?
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: 'Data '),
                      TextSpan(text: 'nama operator ', style: const TextStyle(fontWeight: FontWeight.bold)) ,
                      TextSpan(text: 'harus diisi!'),
                    ],
                  ),
                ) :
                Refueling.totalisator_begin.isEmpty ?
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
                Refueling.fuel_consumption.isEmpty ?
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: 'Data '),
                      TextSpan(text: 'input fuel ', style: const TextStyle(fontWeight: FontWeight.bold)) ,
                      TextSpan(text: 'harus diisi!'),
                    ],
                  ),
                ) :
                Refueling.photo_hm_unit.isEmpty ?
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: 'Foto '),
                      TextSpan(text: 'HM unit ', style: const TextStyle(fontWeight: FontWeight.bold)) ,
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
                      TextSpan(text: 'Foto '),
                      TextSpan(text: 'meter fuel ', style: const TextStyle(fontWeight: FontWeight.bold)) ,
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

  ///pop up alert over fuel
  Future<void> _fuelAlert() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Oops!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("Fuel melebihi budget"),
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

