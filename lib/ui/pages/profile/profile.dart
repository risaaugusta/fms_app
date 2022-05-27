part of '../pages.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<BoxShadow> shadowList = [
    BoxShadow(color: Colors.grey[300]!, blurRadius: 30, offset: Offset(0, 10))
  ];

  List selectedUserProfile = [];
  TrFuelAttendance? trFuelAttendance;
  List<Item> personalItems = generateItems(2);
  List<Item> fuelItems = generateItems(1);
  List<String> headerValue=<String>[
    'NIK',
    'Shift'
  ];
  List<String> headerFuelValue=<String>[
    'Fuel Truck/MT',
  ];
  List<String> data=<String>[
    'NIK',
    'Ubah Password',
    'Shift',
  ];

  @override
  void initState() {
    super.initState();
    Global.getLocalStorage();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 20, left: 15),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.account_circle, color: Coloring.mainColor, size: 50),
                  Global.username == null ?
                  CircularProgressIndicator() :
                  FutureBuilder<List>(
                    future: FmsDatabase.instance.readEmployee(), // a previously-obtained Future<String> or null
                    builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                      List<Widget> children;
                      if (snapshot.hasData) {
                        return
                          Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                              child:
                              Text(Global.username ==  '' ? 'Tidak ada data' : Global.username,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: Fonts.REGULAR,
                                      fontSize: 18))
                          );
                      } else if (snapshot.hasError) {
                        return Container(
                          child: Text('Tidak ada data'),
                        );
                      } else {
                        return Container();
                      }
                    },
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
              padding: EdgeInsets.only(left: 15, bottom: 30),
              child: Text('Personal Data',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: Fonts.REGULAR,
                      fontSize: 18)),
            ),
            ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  personalItems[index].isExpanded = !isExpanded;
                });
              },
              children: personalItems.asMap().map<int,ExpansionPanel>((index, Item item) => MapEntry(index,
                ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(
                      contentPadding: EdgeInsets.only(left:30),
                      title: Text('${headerValue[index]}',
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.grey,
                              fontFamily: Fonts.REGULAR,fontSize: 14)),
                    );
                  },
                  body: ListTile(
                      title: Global.nik != '' && headerValue[index] ==
                          headerValue[0]
                          ? Padding(
                            padding: EdgeInsets.only(left: 15, bottom: 30),
                            child: Text(Global.nik ==  '' ? 'Tidak ada data' : Global.nik,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: Fonts.REGULAR,
                                    fontSize: 18)),
                          ) : headerValue[index] ==
                          headerValue[1]
                          ?
                      // ShiftDropdown() :
                      ShiftDropdown(callback: (MsShift value)
                      {
                        Attendance.shift_id = value.ShiftId.toString();
                        Attendance.shift_desc = value.ShiftName + ' (' + value.ShiftStartTime + ' - ' + value.ShiftEndTime + ') ';
                      }) :
                      CircularProgressIndicator()
                  ),
                  isExpanded: item.isExpanded,
                ),
              )).values.toList(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              child: Text('Storage ID',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: Fonts.REGULAR,
                      fontSize: 18)),
            ),
            ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  fuelItems[index].isExpanded = !isExpanded;
                });
              },
              children: fuelItems.asMap().map<int,ExpansionPanel>((index, Item item) => MapEntry(index,
                ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(
                      contentPadding: EdgeInsets.only(left:30),
                      title: Text('${headerFuelValue[index]}',
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.grey,
                              fontFamily: Fonts.REGULAR,fontSize: 14)),
                    );
                  },
                  body: ListTile(
                    title:  StorageDropdown(callback: (value)
                    {
                      Attendance.storage_id = value;
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
                      trFuelAttendance = TrFuelAttendance(
                        site_id: Global.SiteId,
                        storage_id: Attendance.storage_id ,
                        shift_id: Attendance.shift_id ,
                        shift_desc: Attendance.shift_desc ,
                        nik: Global.nik,
                        login_at: Global.time,
                        employee_name: Global.username,
                      );
                      FmsDatabase.instance.createAttendance(trFuelAttendance!).then((value)=> {_dialogAlert()});
                      FmsDatabase.instance.createHistoryAttendance(trFuelAttendance!).then((value)=> {null});
                    },
                    color: Coloring.mainColor,
                    textColor: Colors.white,
                    child: Text("Simpan",
                        style: TextStyle(color: Colors.white, fontFamily: Fonts.REGULAR,fontSize: 18)),
                  ),
                ),
              ),
            ),
            SizedBox(height: 50)
          ],
        ),
      ),
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

// stores ExpansionPanel state information
class Item {
  Item({
    this.expandedValue='',
    this.headerValue='',
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List.generate(numberOfItems, (int index) {
    return Item(
      headerValue: '',
      expandedValue: '',
    );
  });
}

