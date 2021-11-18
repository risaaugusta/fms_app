part of '../pages.dart';

class homeDetailTransaksi extends StatelessWidget {
  final int index;
  homeDetailTransaksi(this.index);

  String unitType = "Dump Truck";
  String unitCode = "FT1125";
  int budget = 450;
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    Home(),
    Text(
      'Index 1: Manual',
      style: optionStyle,
    ),
    Text(
      'Index 2: Notif',
      style: optionStyle,
    ),
    Text(
      'Index 3: Profile',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF9F9F9),
        appBar: AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back,color: Colors.black,),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => homeTransaksi()),
              );
            },
          ),
          title: const Text('Detail History',
              style: TextStyle(color: Colors.black,
                  fontFamily: Fonts.REGULAR,fontSize: 18)),
          backgroundColor: Colors.white,
        ),
        body:
        FutureBuilder<List>(
          future: FmsDatabase.instance.readRefueling(), // a previously-obtained Future<String> or null
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            List<Widget> children;
            if (snapshot.hasData) {
                    return Column(
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                      'Budget',
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
                                  Text(
                                      snapshot.data![index]['equipment_id'],
                                      textAlign: TextAlign.left,
                                      style: TextStyle(color: Colors.black,
                                          fontFamily: Fonts.REGULAR,fontSize: 18)
                                  ),
                                  Text(
                                      snapshot.data![index]['model_number'],
                                      textAlign: TextAlign.left,
                                      style: TextStyle(color: Colors.black,
                                          fontFamily: Fonts.REGULAR,fontSize: 18)
                                  ),
                                  Text(
                                      snapshot.data![index]['tank_capacity'].toString() ,
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
                          margin: EdgeInsets.only(left:30,right:30),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height/5,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              border: Border.all(
                                color: Color(0xffE4E4E4),
                                width: 1,
                              )
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 10,top:10),
                                    child: Text(
                                        'Operator',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(color: Colors.grey,
                                            decoration: TextDecoration.underline,
                                            fontFamily: Fonts.REGULAR,fontSize: 18)
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 70, top: 10),
                                    child: Text(
                                        snapshot.data![index]['operator_id'].toString(),
                                        textAlign: TextAlign.left,
                                        style: TextStyle(color: Colors.black,
                                            decoration: TextDecoration.underline,
                                            fontFamily: Fonts.REGULAR,fontSize: 18)
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
                                            decoration: TextDecoration.underline,
                                            fontFamily: Fonts.REGULAR,fontSize: 18)
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 70),
                                    child: Text(
                                        snapshot.data![index]['category_desc'],
                                        textAlign: TextAlign.left,
                                        style: TextStyle(color: Colors.black,
                                            decoration: TextDecoration.underline,
                                            fontFamily: Fonts.REGULAR,fontSize: 18)
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
                                        'Site',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(color: Colors.grey,
                                            decoration: TextDecoration.underline,
                                            fontFamily: Fonts.REGULAR,fontSize: 18)
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 105),
                                    child: Text(
                                        snapshot.data![index]['company_code'],
                                        textAlign: TextAlign.left,
                                        style: TextStyle(color: Colors.black,
                                            decoration: TextDecoration.underline,
                                            fontFamily: Fonts.REGULAR,fontSize: 18)
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
                                        'Last Refueling',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(color: Colors.grey,
                                            decoration: TextDecoration.underline,
                                            fontFamily: Fonts.REGULAR,fontSize: 18)
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text(
                                        snapshot.data![index]['created_at'],
                                        textAlign: TextAlign.left,
                                        style: TextStyle(color: Colors.black,
                                            decoration: TextDecoration.underline,
                                            fontFamily: Fonts.REGULAR,fontSize: 18)
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left:30,right:30,top: 30),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height/4,
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
                                    padding: EdgeInsets.only(left: 10,top:10),
                                    child: Text(
                                        'Last Refueling ',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(color: Colors.grey,
                                            decoration: TextDecoration.underline,
                                            fontFamily: Fonts.REGULAR,fontSize: 18)
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 30, top: 10),
                                    child: Text(
                                        snapshot.data![index]['operator_id'].toString(),
                                        textAlign: TextAlign.left,
                                        style: TextStyle(color: Colors.black,
                                            decoration: TextDecoration.underline,
                                            fontFamily: Fonts.REGULAR,fontSize: 18)
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
                                        'Totalisator Awal',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(color: Colors.grey,
                                            decoration: TextDecoration.underline,
                                            fontFamily: Fonts.REGULAR,fontSize: 18)
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text(
                                        snapshot.data![index]['fuel_totalisator_awal'],
                                        textAlign: TextAlign.left,
                                        style: TextStyle(color: Colors.black,
                                            decoration: TextDecoration.underline,
                                            fontFamily: Fonts.REGULAR,fontSize: 18)
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
                                        'Totalisator Akhir',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(color: Colors.grey,
                                            decoration: TextDecoration.underline,
                                            fontFamily: Fonts.REGULAR,fontSize: 18)
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text(
                                        snapshot.data![index]['fuel_totalisator_akhir'].toString(),
                                        textAlign: TextAlign.left,
                                        style: TextStyle(color: Colors.black,
                                            decoration: TextDecoration.underline,
                                            fontFamily: Fonts.REGULAR,fontSize: 18)
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
                                        'Total L/Month',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(color: Colors.grey,
                                            decoration: TextDecoration.underline,
                                            fontFamily: Fonts.REGULAR,fontSize: 18)
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 40),
                                    child: Text(
                                        snapshot.data![index]['total'].toString() + ' L',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(color: Colors.black,
                                            decoration: TextDecoration.underline,
                                            fontFamily: Fonts.REGULAR,fontSize: 18)
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
            } else if (snapshot.hasError) {
              return Container(
                child: Text('error'),
              );
            } else {
              return Container();
            }
          },
        ),

        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          child: Image.asset("assets/img/scan.png"),
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
                      onPressed: () => homeDashboard(),
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
                      onPressed: (){},
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
                      onPressed: (){},
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
                      onPressed: () => Profile(),
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
}

