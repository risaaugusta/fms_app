part of '../pages.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List selectedUserProfile = [];
  String? nik;
  String? username;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getLocalStorage();
  }

  void getLocalStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    nik =  await prefs.getString("nik");
    username = await prefs.getString("username");
    setState(() {
      // selectedUserProfile = nik;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: new EdgeInsets.only(left: 15, right: 15),
        width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        child: Column(
          // verticalDirection: VerticalDirection.down,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Settings(),
                        Text('${username == null ? '' : username}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: Fonts.REGULAR,
                                fontSize: 14)),
                      ],
                    ),
                Container(
                    height: 65,
                    width: 65,
                    child:
                    new Image.asset('assets/img/login_logo.png')),
              ],
            ),
            // searchBar(),
            Search(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height/5,
                  width: MediaQuery.of(context).size.width/4,
                  child: Card(
                    elevation: 0.8,
                    shadowColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => homeLansiran()),
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                height: 70,
                                width: 50,
                                child:
                                    new Image.asset('assets/img/menu_truck.png')),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child:
                                  Text('Transfer',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: Fonts.REGULAR,
                                          fontSize: 14)),
                            ),
                          ],
                        )),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height/5,
                  width: MediaQuery.of(context).size.width/4,
                  child: Card(
                    elevation: 0.8,
                    shadowColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => homeBAPS()),
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal:15),
                                height: 70,
                                width: 50,
                                child: new Image.asset(
                                    'assets/img/menu_newspaper.jpeg')),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child:
                              Text('BAPS',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: Fonts.REGULAR,
                                      fontSize: 14)),
                            ),
                          ],
                        )),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height/5,
                  width: MediaQuery.of(context).size.width/4,
                  child: Card(
                    elevation: 0.8,
                    shadowColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => homeSounding()),
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                margin: EdgeInsets.symmetric(horizontal:15),
                                height: 70,
                                width: 50,
                                child: new Image.asset(
                                    'assets/img/sounding.png')),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child:
                              Text('Sounding',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: Fonts.REGULAR,
                                      fontSize: 14)),
                            ),
                          ],
                        )),
                  ),
                ),
              ],
            ),
            Align(
              heightFactor: 2.5,
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => homeTransaksi()),
                      );
                    },
                    child: Text('History Refueling',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: Fonts.REGULAR,
                            fontSize: 18)),
                  )
              ),
            ),
            FutureBuilder<List>(
              future: FmsDatabase.instance.readHistoryRefueling(), // a previously-obtained Future<String> or null
              builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                List<Widget> children;
                if (snapshot.hasData) {
                return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(8),
                      itemCount: snapshot.data!.length < 5 ? snapshot.data!.length : 5,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          elevation: 0.8,
                          shadowColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: InkWell(
                              onTap: () {
                                print('Card tapped.');
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                      height: 70,
                                      width: 50,
                                      child:
                                          new Image.asset('assets/img/truck.png')),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(snapshot.data![index]['unit_code'],
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: Fonts.REGULAR,
                                              fontSize: 18)),
                                      Text(snapshot.data![index]['fuel_consumption'].toString() + ' L',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontFamily: Fonts.REGULAR,
                                              fontSize: 12)),
                                      Text(snapshot.data![index]['created_at'],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontFamily: Fonts.REGULAR,
                                              fontSize: 12)),
                                    ],
                                  ),
                                  Container(
                                    child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5),
                                          side: BorderSide(
                                              color: Coloring.mainColor)),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => DetailHistoryTransaksi(index:index))
                                        );
                                      },
                                      color: Colors.white,
                                      textColor: Colors.white,
                                      child: Text("Detail",
                                          style: TextStyle(
                                              color: Coloring.mainColor,
                                              fontFamily: Fonts.REGULAR,
                                              fontSize: 14)),
                                    ),
                                  ),
                                ],
                              )),
                        );
                      });
                } else if (snapshot.hasError) {
                  return Container(
                    child: Text('Tidak ada data'),
                  );
                } else {
                  return Text('Tidak ada data');
                }
              },
            ),
            FutureBuilder<List>(
              future: FmsDatabase.instance.readRefueling(), // a previously-obtained Future<String> or null
              builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                List<Widget> children;
                if (snapshot.hasData) {
                return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(8),
                      itemCount: snapshot.data!.length < 5 ? snapshot.data!.length : 5,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          elevation: 0.8,
                          shadowColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: InkWell(
                              onTap: () {
                                print('Card tapped.');
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                      height: 70,
                                      width: 50,
                                      child:
                                          new Image.asset('assets/img/truck.png')),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(snapshot.data![index]['unit_code'],
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: Fonts.REGULAR,
                                              fontSize: 18)),
                                      Text(snapshot.data![index]['fuel_consumption'].toString() + ' L',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontFamily: Fonts.REGULAR,
                                              fontSize: 12)),
                                      Text(snapshot.data![index]['created_at'],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontFamily: Fonts.REGULAR,
                                              fontSize: 12)),
                                    ],
                                  ),
                                  Container(
                                    child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5),
                                          side: BorderSide(
                                              color: Coloring.mainColor)),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => homeDetailTransaksi(index:index))

                                        );
                                      },
                                      color: Colors.white,
                                      textColor: Colors.white,
                                      child: Text("Detail",
                                          style: TextStyle(
                                              color: Coloring.mainColor,
                                              fontFamily: Fonts.REGULAR,
                                              fontSize: 14)),
                                    ),
                                  ),
                                ],
                              )),
                        );
                      });
                } else if (snapshot.hasError) {
                  return Container(
                    child: Text('Tidak ada data'),
                  );
                } else {
                  return Text('');
                }
              },
            ),
          ],
        ));
  }
}

/// Search Bar
class searchBar extends StatefulWidget {
  const searchBar({Key? key}) : super(key: key);

  @override
  _searchBarState createState() => _searchBarState();
}

class _searchBarState extends State<searchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
        autofocus: false,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Color(0xffEFEFEF),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Color(0xffEFEFEF),
            ),
          ),
          // hintText: 'NIK',
          fillColor: Color(0xffEFEFEF),
          filled: true,
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        ),
        onChanged: (value) {},
      ),
    );
  }
}
