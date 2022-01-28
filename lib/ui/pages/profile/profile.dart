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
  // String nik = "";
  // String email = 'usman@hpu-mining.com';
  List<Item> personalItems = generateItems(2);
  List<Item> fuelItems = generateItems(2);
  List<String> headerValue=<String>[
    'NIK',
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
  void initState() {
    // TODO: implement initState
    super.initState();
    ApiService().fetchEmployee().then((value) async {
      List dataComputed = [];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? nik = await prefs.getString("nik");
      print("===============");
      dataComputed = value.where((element) => element['EmployeeID'] == nik).toList();
      print(dataComputed);
      setState(() {
        // nik = nik;
        selectedUserProfile = dataComputed;
      });

      // print(value);
      // value.map((e) {
      //   print(e);
      //   // dataComputed.add(e['auth_group']);
      // }).toList();
    });
    ApiService().fetchStorage().then((value) {
      List<String> dataComputed = [];
      value.map((e) {
        // print(e['auth_group']);
        dataComputed.add(e['auth_group']);
      }).toList();
    });
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
                  selectedUserProfile.isEmpty ?
                  CircularProgressIndicator() :
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      child:
                      Text('${selectedUserProfile.isEmpty ? '' : selectedUserProfile[0]['EmployeeName']}',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: Fonts.REGULAR,
                              fontSize: 18))
                  )
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
                      title: !selectedUserProfile.isEmpty
                          ? Padding(
                        padding: EdgeInsets.only(left: 15, bottom: 30),
                        child: Text('${selectedUserProfile.isEmpty ? '' : selectedUserProfile[0]['EmployeeID']}',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: Fonts.REGULAR,
                                fontSize: 18)),
                      ) :
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
                    onPressed: () => null,
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