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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
          title: const Text('Lansiran Fuel Truck',
              style: TextStyle(color: Colors.black,
                  fontFamily: Fonts.REGULAR,fontSize: 18)),
          backgroundColor: Colors.white,
        ),
        body: Column(
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
                      height: 100,
                      width: 100,
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
                          'Unit Code',
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.grey,
                              fontFamily: Fonts.REGULAR,fontSize: 18)
                      ),
                      SizedBox(height: 10),
                      Text(
                          'Unit Type',
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.grey,
                              fontFamily: Fonts.REGULAR,fontSize: 18)
                      ),
                      SizedBox(height: 10),
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
                      SizedBox(height: 10),
                      Text(
                          '$unitCode',
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.black,
                              fontFamily: Fonts.REGULAR,fontSize: 18)
                      ),
                      SizedBox(height: 10),
                      Text(
                          '$unitType ',
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.black,
                              fontFamily: Fonts.REGULAR,fontSize: 18)
                      ),
                      SizedBox(height: 10),
                      Text(
                          '$budget ' + 'L' ,
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
              margin: EdgeInsets.only(bottom: 20),
              child: Divider(
                color: Color(0xffF5F5F5),
                thickness: 20,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, bottom: 15),
              child: Text(
                  'Destination',
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.black,
                      fontFamily: Fonts.REGULAR,fontSize: 18)
              ),
            ),
            Container(
              // margin: EdgeInsets.only(right:15,left:20),
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Text(
                            'Storage ID',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.black,
                                fontFamily: Fonts.REGULAR,fontSize: 14)
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            print('tapped.');
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: 15),
                            child: Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 14),
                          ))
                    ],
                  ),
                  Divider(
                    color: Colors.grey[70],
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Text(
                            'Operator Unit',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.black,
                                fontFamily: Fonts.REGULAR,fontSize: 14)
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            print('tapped.');
                          },
                          child: Padding(
                            padding:EdgeInsets.only(right: 15),
                            child: Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 14),
                          ))
                    ],
                  ),
                  Divider(
                    color: Colors.grey[70],
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Text(
                            'Totalisator Awal',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.black,
                                fontFamily: Fonts.REGULAR,fontSize: 14)
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            print('tapped.');
                          },
                          child: Padding(
                            padding:EdgeInsets.only(right: 15),
                            child: Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 14),
                          ))
                    ],
                  ),
                  Divider(
                    color: Colors.grey[70],
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Text(
                            'Totalisator Akhir',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.black,
                                fontFamily: Fonts.REGULAR,fontSize: 14)
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            print('tapped.');
                          },
                          child: Padding(
                            padding:EdgeInsets.only(right: 15),
                            child: Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 14),
                          ))
                    ],
                  ),
                  Divider(
                    color: Colors.grey[70],
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Text(
                            'Volume Sebelum',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.black,
                                fontFamily: Fonts.REGULAR,fontSize: 14)
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            print('tapped.');
                          },
                          child: Padding(
                            padding:EdgeInsets.only(right: 15),
                            child: Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 14),
                          ))
                    ],
                  ),
                  Divider(
                    color: Colors.grey[70],
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Text(
                            'Jumlah Liter Pengisian',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.black,
                                fontFamily: Fonts.REGULAR,fontSize: 14)
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            print('tapped.');
                          },
                          child: Padding(
                            padding:EdgeInsets.only(right: 15),
                            child: Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 14),
                          ))
                    ],
                  ),
                  Divider(
                    color: Colors.grey[70],
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Text(
                            'Total Volume',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.black,
                                fontFamily: Fonts.REGULAR,fontSize: 14)
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            print('tapped.');
                          },
                          child: Padding(
                            padding:EdgeInsets.only(right: 15),
                            child: Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 14),
                          ))
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20, top: 15),
              child: Divider(
                color: Color(0xffF5F5F5),
                thickness: 20,
              ),
            ),
          ],
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
                              'Home',
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
                )
              ],
            ),
          ),
        )
    );
  }
}
