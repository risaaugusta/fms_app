part of '../pages.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String nama = 'USMAN ABDUL RAHMAN';
  String email = 'usman@hpu-mining.com';
  List<Item> personalItems = generateItems(3);
  List<Item> fuelItems = generateItems(2);
  List<String> headerValue=<String>[
    'NIK',
    'Ubah Password',
    'Shift'
  ];
  List<String> headerFuelValue=<String>[
    'Fuel Truck/MT',
    'Lansiran Fuel Truck',
  ];
  List<String> data=<String>[
    'NIK',
    'Ubah Password',
    'Shift',
  ];

  @override
  Widget build(BuildContext context) {
    TrFuelAttendance trFuelAttendance = TrFuelAttendance(
      // attendance_id:  Attendance.attendance_id,
      equipment_id:  Attendance.equipment_id,
      site_id: Attendance.site_id,
      shift_id : Attendance.shift_id,
      operator_id : Attendance.operator_id,
      // is_active: Attendance.is_active,
      // updated_by: Attendance.updated_by,
      login_at: Global.time,
      updated_at: Global.time,
      // phone_id: Attendance.phone_id,
    );
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text('$nama',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: Fonts.REGULAR,
                                fontSize: 18)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text('$email ',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color(0xffAAAAAA),
                                fontFamily: Fonts.REGULAR,
                                fontSize: 12)),
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
                          data[index] = value;
                          print(data[index]);
                        }, //dummy value
                      ),
                    )
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
                    title: headerFuelValue[index] ==
                        headerFuelValue[0]
                        ? StorageDropdown(callback:(String callback){
                      // trFuelDistribution.storage_id = callback;
                    },) : Container(
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
                          if (headerValue[
                          index] ==
                              headerValue[2]) {
                            Attendance.shift_id=value;
                          } else if (headerFuelValue[
                          index] ==
                              headerFuelValue[0]) {
                            Attendance.equipment_id = value;
                          }else if (headerFuelValue[
                            index] ==
                            headerFuelValue[1]) {
                            Attendance.operator_id = value;}
                          else{null;}
                        }, //dummy value
                      ),
                    ),
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
                      print(trFuelAttendance.toJson());
                      FmsDatabase.instance.createAttendance(trFuelAttendance).then((value) => {_dialogAlert()});
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