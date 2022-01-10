part of '../pages.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String name = 'Testing';
  String unitCode = 'DT11123';
  int fuelValue = 980;
  final List<String> unitCodeList = <String>[
    'DT11111',
    'DT22222',
    'DT33333',
    'DT22222',
    'DT22222',
    'DT22222',
  ];

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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.account_circle,
                      color: Coloring.mainColor,
                      size: 30,
                    ),
                    SizedBox(width: 10),
                    Text('$name',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: Fonts.REGULAR,
                            fontSize: 14)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Synchronize',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: Fonts.REGULAR,
                            fontSize: 14)),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        print('successfully sync');
                      },
                      child: Icon(
                        Icons.sync,
                        color: Coloring.mainColor,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height/7.5,
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                height: 70,
                                width: 50,
                                child:
                                    new Image.asset('assets/img/menu_truck.png')),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Lansiran',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: Fonts.REGULAR,
                                        fontSize: 14)),
                                SizedBox(height: 10),
                                Text('Lansiran Antar Storage',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: Fonts.REGULAR,
                                        fontSize: 14)),
                              ],
                            ),
                          ],
                        )),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height/7.5,
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left:25),
                                height: 70,
                                width: 50,
                                child: new Image.asset(
                                    'assets/img/menu_newspaper.jpeg')),
                            Container(
                              margin: EdgeInsets.only(left:35),
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('BAPS',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: Fonts.REGULAR,
                                          fontSize: 14)),
                                  SizedBox(height: 10),
                                  Text('Berita Acara Penerimaan Solar',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: Fonts.REGULAR,
                                          fontSize: 14)),
                                ],
                              ),
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
                  )),
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
                                      Text(snapshot.data![index]['equipment_id'],
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: Fonts.REGULAR,
                                              fontSize: 18)),
                                      Text(snapshot.data![index]['tank_capacity'].toString(),
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
                                              builder: (context) => homeDetailTransaksi(index))
                                              // builder: (context) => scanRefueling(barcode_id:snapshot.data![index]['equipment_id']),
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
                  return Container();
                }
              },
            ),
            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                itemCount: 5,
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
                                Text('Equipment'+'$index',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: Fonts.REGULAR,
                                        fontSize: 18)),
                                Text('3'+'$index',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: Fonts.REGULAR,
                                        fontSize: 12)),
                                Text(Global.time,
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
                                          builder: (context) => homeDetailTransaksi(index))
                                    // builder: (context) => scanRefueling(barcode_id:snapshot.data![index]['equipment_id']),
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
                }),
          ],
        ));
  }
}
