part of '../pages.dart';

class DetailHistoryTransaksi extends StatefulWidget {
  final int index;
  const DetailHistoryTransaksi({Key? key,required this.index}) : super(key: key);

  @override
  _DetailHistoryTransaksiState createState() => _DetailHistoryTransaksiState();
}

class _DetailHistoryTransaksiState extends State<DetailHistoryTransaksi> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    homeDetailTransaksi(index: 0),
    HomeManual(),
    homeNotifikasi(),
    Profile(),
  ];

  ScrollController _controller = new ScrollController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Color(0xffF9F9F9),
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
            title: const Text('Detail History',
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
          body:
          _selectedIndex == 0  ? SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(30),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/7,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                        color: Color(0xffE4E4E4),
                        width: 1,
                      )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          height: 100,
                          width: 100,
                          child: new Image.asset('assets/img/truck.png')
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // SizedBox(height: 10),
                          Text(
                              'Unit Code',
                              textAlign: TextAlign.left,
                              style: TextStyle(color: Colors.grey,
                                  fontFamily: Fonts.REGULAR,fontSize: 18)
                          ),
                          // SizedBox(height: 10),
                          Text(
                              'Unit Type',
                              textAlign: TextAlign.left,
                              style: TextStyle(color: Colors.grey,
                                  fontFamily: Fonts.REGULAR,fontSize: 18)
                          ),
                          // SizedBox(height: 10),
                          Text(
                              'Fuel Filling',
                              textAlign: TextAlign.left,
                              style: TextStyle(color: Colors.grey,
                                  fontFamily: Fonts.REGULAR,fontSize: 18)
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FutureBuilder<List>(
                            future: FmsDatabase.instance.readHistoryRefueling(), // a previously-obtained Future<String> or null
                            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                              List<Widget> children;
                              if (snapshot.hasData) {
                                return  Text(
                                    snapshot.data![widget.index]['unit_code'] ,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(color: Colors.black,
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
                          FutureBuilder<List>(
                            future: FmsDatabase.instance.readHistoryRefueling(), // a previously-obtained Future<String> or null
                            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                              List<Widget> children;
                              if (snapshot.hasData) {
                                return  Text(
                                    snapshot.data![widget.index]['unit_type'] ,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(color: Colors.black,
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
                          FutureBuilder<List>(
                            future: FmsDatabase.instance.readHistoryRefueling(), // a previously-obtained Future<String> or null
                            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                              List<Widget> children;
                              if (snapshot.hasData) {
                                return  Text(
                                    (snapshot.data![widget.index]['fuel_consumption']).toString() + ' L' ,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(color: Colors.black,
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
                Container(
                  margin: EdgeInsets.only(left:30,right:30),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/3,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                        color: Color(0xffE4E4E4),
                        width: 1,
                      )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10,top:10),
                            child: Text(
                                'Operator',
                                textAlign: TextAlign.left,
                                style: TextStyle(color: Colors.grey,
                                    fontFamily: Fonts.REGULAR,fontSize: 18)
                            ),
                          ),
                          SizedBox(
                              width: 30
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width/2,
                            child: FutureBuilder<List>(
                              future: FmsDatabase.instance.readHistoryRefueling(), // a previously-obtained Future<String> or null
                              builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                                List<Widget> children;
                                if (snapshot.hasData) {
                                  return  Padding(
                                    padding: EdgeInsets.only(left: 30,top:10),
                                    child: Text(
                                        snapshot.data![widget.index]['nama_operator']  ,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(color: Colors.black,
                                            fontFamily: Fonts.REGULAR,fontSize: 18)
                                    ),
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
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.grey[70],
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                                'HM Unit',
                                textAlign: TextAlign.left,
                                style: TextStyle(color: Colors.grey,
                                    fontFamily: Fonts.REGULAR,fontSize: 18)
                            ),
                          ),
                          SizedBox(width: 30),
                          FutureBuilder<List>(
                            future: FmsDatabase.instance.readHistoryRefueling(), // a previously-obtained Future<String> or null
                            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                              List<Widget> children;
                              if (snapshot.hasData) {
                                return  Padding(
                                  padding: EdgeInsets.only(left: 35),
                                  child: Text(
                                      (snapshot.data![widget.index]['hm_input']).toString()  ,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(color: Colors.black,
                                          fontFamily: Fonts.REGULAR,fontSize: 18)
                                  ),
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
                      Divider(
                        color: Colors.grey[70],
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                                'Site',
                                textAlign: TextAlign.left,
                                style: TextStyle(color: Colors.grey,
                                    fontFamily: Fonts.REGULAR,fontSize: 18)
                            ),
                          ),
                          SizedBox(width: 65),
                          FutureBuilder<List>(
                            future: FmsDatabase.instance.readHistoryRefueling(), // a previously-obtained Future<String> or null
                            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                              List<Widget> children;
                              if (snapshot.hasData) {
                                return  Padding(
                                  padding: EdgeInsets.only(left: 35),
                                  child: Text(
                                      (snapshot.data![widget.index]['site_id']).toString()  ,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(color: Colors.black,
                                          fontFamily: Fonts.REGULAR,fontSize: 18)
                                  ),
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
                      Divider(
                        color: Colors.grey[70],
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10,bottom: 10),
                            child: Text(
                                'Last Refueling',
                                textAlign: TextAlign.left,
                                style: TextStyle(color: Colors.grey,
                                    fontFamily: Fonts.REGULAR,fontSize: 18)
                            ),
                          ),
                          FutureBuilder<List>(
                            future: FmsDatabase.instance.readHistoryRefueling(), // a previously-obtained Future<String> or null
                            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                              List<Widget> children;
                              if (snapshot.hasData) {
                                return  Padding(
                                  padding: EdgeInsets.only(left: 15,bottom: 10),
                                  child: Text(
                                      snapshot.data![widget.index]['created_at'],
                                      textAlign: TextAlign.left,
                                      style: TextStyle(color: Colors.black,
                                          fontFamily: Fonts.REGULAR,fontSize: 18)
                                  ),
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
                Container(
                  margin: EdgeInsets.only(left:30,right:30,top: 30),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/6,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                        color: Color(0xffE4E4E4),
                        width: 1,
                      )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                                'Totalisator Awal',
                                textAlign: TextAlign.left,
                                style: TextStyle(color: Colors.grey,
                                    fontFamily: Fonts.REGULAR,fontSize: 18)
                            ),
                          ),
                          FutureBuilder<List>(
                            future: FmsDatabase.instance.readHistoryRefueling(), // a previously-obtained Future<String> or null
                            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                              List<Widget> children;
                              if (snapshot.hasData) {
                                return  Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Text(
                                      (snapshot.data![widget.index]['totalisator_begin']).toString(),
                                      textAlign: TextAlign.left,
                                      style: TextStyle(color: Colors.black,
                                          fontFamily: Fonts.REGULAR,fontSize: 18)
                                  ),
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
                      Divider(
                        color: Colors.grey[70],
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                                'Totalisator Akhir',
                                textAlign: TextAlign.left,
                                style: TextStyle(color: Colors.grey,
                                    fontFamily: Fonts.REGULAR,fontSize: 18)
                            ),
                          ),
                          FutureBuilder<List>(
                            future: FmsDatabase.instance.readHistoryRefueling(), // a previously-obtained Future<String> or null
                            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                              List<Widget> children;
                              if (snapshot.hasData) {
                                return  Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Text(
                                      (snapshot.data![widget.index]['totalisator_end']).toString(),
                                      textAlign: TextAlign.left,
                                      style: TextStyle(color: Colors.black,
                                          fontFamily: Fonts.REGULAR,fontSize: 18)
                                  ),
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
                      // Divider(
                      //   color: Colors.grey[70],
                      //   thickness: 1,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     Padding(
                      //       padding: EdgeInsets.only(left: 10),
                      //       child: Text(
                      //           'Total L/Month',
                      //           textAlign: TextAlign.left,
                      //           style: TextStyle(color: Colors.grey,
                      //               fontFamily: Fonts.REGULAR,fontSize: 18)
                      //       ),
                      //     ),
                      //     Padding(
                      //       padding: const EdgeInsets.only(left: 40),
                      //       child: Text(
                      //           '100' + ' L',
                      //           textAlign: TextAlign.left,
                      //           style: TextStyle(color: Colors.black,
                      //               fontFamily: Fonts.REGULAR,fontSize: 18)
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
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
                            MaterialPageRoute(builder: (context) => homeDashboard()),);
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
                            Text('Beranda',
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
                            Text('Sinkron',
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
          )
      ),
    );
  }
}
