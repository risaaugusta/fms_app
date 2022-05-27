part of '../pages.dart';

class homeSounding extends StatefulWidget {
  const homeSounding({Key? key}) : super(key: key);

  @override
  _homeSoundingState createState() => _homeSoundingState();
}

class _homeSoundingState extends State<homeSounding> {
  int _selectedIndex = 0;
  TrSounding? trSounding;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    homeLansiran(),
    HomeManual(),
    homeNotifikasi(),
    Profile(),
  ];

  List<Item> DataItems = generateItems(2);
  List<String> headerDataValue=<String>[
    'Storage ID',
    'Sounding',
  ];
  List selectedUserProfile = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
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
          title: const Text('Sounding',
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
        body: _selectedIndex == 0  ?
        SingleChildScrollView(
          child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
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
                            // FmsDatabase.instance.readAttendance().then((value) {
                            //   if(value.length < 1){
                            //     return Text('Tidak ada data');
                            //   }else{
                            //     return  Text(
                            //         snapshot.data![0]['shift_desc'] ,
                            //         textAlign: TextAlign.left,
                            //         style: TextStyle(color: Colors.black,
                            //             fontFamily: Fonts.REGULAR,fontSize: 18)
                            //     );
                            //   }
                            // });
                            if (snapshot.hasData) {
                              return
                                snapshot.data!.length > 0 ?
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
                        headerDataValue[index] ==
                            headerDataValue[0] ?
                        StorageDropdown(callback: (value)
                        {
                          // trSounding.storage_id = value;
                          Sounding.storage_id = value;
                        }) :
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
                                  headerDataValue[1]) {
                                Sounding.sounding = value;
                              } else {null;}
                            }, //dummy value
                          ),
                        )
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
                        trSounding = TrSounding(
                          // sounding_id: Sounding.sounding_id,
                          site_id: Global.SiteId,
                          shift_id:  (await FmsDatabase.instance.readAttendance())[0]['shift_id'].toString() ,
                          sounding: Sounding.sounding  ,
                          storage_id: Sounding.storage_id  ,
                          created_at: Global.time,
                          created_by: (await FmsDatabase.instance.readAttendance())[0]['employee_name'].toString()
                        );
                        FmsDatabase.instance.createSounding(trSounding!).then((value)=> {_dialogAlert()});
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
          )
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

  ///no data
  Future<void> _noData() async {
    FmsDatabase.instance.readAttendance().then((value) {
      if(value.length < 1){
        return Text('Tidak ada data');
      }
    });
    // return showDialog<void>(
    //   context: context,
    //   barrierDismissible: false, // user must tap button!
    //   builder: (BuildContext context) {
    //     return AlertDialog(
    //       title: const Text('Berhasil!'),
    //       content: SingleChildScrollView(
    //         child: ListBody(
    //           children: <Widget>[
    //             Text("Berhasil tambah data"),
    //           ],
    //         ),
    //       ),
    //       actions: <Widget>[
    //         TextButton(
    //           child: const Text('Oke'),
    //           onPressed: () {
    //             Navigator.pop(context);
    //           },
    //         ),
    //       ],
    //     );
    //   },
    // );
  }

}
