part of '../pages.dart';

class scanRefueling extends StatefulWidget {
  final String barcode_id;
  const scanRefueling({required this.barcode_id});

  @override
  _scanRefuelingState createState() => _scanRefuelingState();
}

class _scanRefuelingState extends State<scanRefueling> {
  Barcode? barcode;
  List<Item> PhotoItems = generateItems(2);
  List<String> headerPhotoValue=<String>[
    'Photo Meter Fuel',
    'Photo HM Unit'
  ];
  String value ='';
  @override
  Widget build(BuildContext context) {
    TrFuelDistribution trFuelDistribution = TrFuelDistribution(
      transactions_id: Refueling.fTransactionsId + 1,
      equipment_id:  widget.barcode_id,
      // storage_id: '',
      // site_id: '',
      // shiftId: '',
      fuel_filling: Refueling.fFilling,
      fuel_totalisator_awal: Refueling.fTotalisatorAwal,
      fuel_totalisator_akhir: Refueling.fTotalisatorAkhir,
      hm_equipment: Refueling.fHmEquipment,
      // storage_operator: '',
      // equipment_operator: '',
      // equipmentBudget: '',
      // isActive: '',
      // createdBy: '',
      created_at: Global.time,
      // updatedBy: '',
      updated_at: Global.time,
      // attendaceId: '',
    );
    MsEquipment msEquipment = MsEquipment(
    equipment_id: '',
    manufacturer:'',
    model_number:'',
    tank_capacity:0,
    category:'',
    category_desc: '',
    auth_group: '',
    auth_text:'',
    company_code:'',
    changed_by_system:'',
    created_by:'',
    created_at:'',
    updatedBy:'',
    updated_at:'',
    load_category:'',
    load_category_unit:'',
    );
    FmsDatabase.instance.readRefueling().then((value) {
      setState(() {
        Equipment.eModelNumber = value[0]['model_number'];
        Equipment.eTankCapacity = value[0]['tank_capacity'];
        Equipment.category_desc = value[0]['category_desc'];
        Equipment.auth_group = value[0]['auth_group'];
        Equipment.company_code = value[0]['company_code'];
        Attendance.operator_id = value[0]['operator_id'];
        print(value);
      });
    });

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                          'Bugdet',
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
                      Text(
                          Equipment.eModelNumber,
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.black,
                              fontFamily: Fonts.REGULAR,fontSize: 18)
                      ),
                      Text(
                         Equipment.eTankCapacity.toString(),
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.black,
                              fontFamily: Fonts.REGULAR,fontSize: 18)
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
                      SizedBox(height: 50),
                      Text(
                          'Input Fuel',
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.black,
                              fontFamily: Fonts.REGULAR,fontSize: 14)
                      ),
                      SizedBox(height: 45),
                      Text(
                          'Totalisator Awal',
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.black,
                              fontFamily: Fonts.REGULAR,fontSize: 14)
                      ),
                      SizedBox(height: 45),
                      Text(
                          'Input NIK Operator',
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
                            onChanged: (value)=> {
                              Refueling.fHmEquipment = value
                            }, //dummy value
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
                          onChanged: (value)=> {
                            Refueling.fFilling = value
                          }, //dummy value
                        ),
                      ),
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
                                onChanged: (value)=> {
                                  Refueling.fTotalisatorAwal = value
                                }, //dummy value
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
                                onChanged: (value)=> {
                                  Refueling.fTotalisatorAkhir = value
                                }, //dummy value
                              ),
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
                          onChanged: (value)=> {}, //dummy value
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
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                  'Photo',
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.black,
                      fontFamily: Fonts.REGULAR,fontSize: 18)
              ),
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
                      title: UploaderDropdown()
                  ),
                  isExpanded: item.isExpanded,
                ),
              )).values.toList(),
            ),
            Container(
              margin: EdgeInsets.only(top:15),
              alignment: Alignment.center,
              height: 100,
              child: ButtonTheme(
                minWidth: MediaQuery.of(context).size.width/1.2,
                height: 60,
                child: Container(
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(color: Coloring.mainColor)),
                    onPressed: () {
                      print(trFuelDistribution.toJson());
                      FmsDatabase.instance.create(trFuelDistribution).then((value) => {_dialogAlert()});
                    },
                    color: Coloring.mainColor,
                    textColor: Colors.white,
                    child: Text("SUBMIT",
                        style: TextStyle(color: Colors.white, fontFamily: Fonts.REGULAR,fontSize: 24)),
                  ),
                ),
              ),
            ),
          ],
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

