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
  var today = DateTime.now();
  var date = DateFormat.yMd().format(DateTime.now());
  var time =
      formatDate(DateTime.now(), [yyyy, '/', mm, '/', dd, ' ', HH, ':', nn]);

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
            // GridView.count(
            //   shrinkWrap: true,
            //   childAspectRatio: (4 / 2.5),
            //   padding: const EdgeInsets.only(top:10),
            //   crossAxisSpacing: 10,
            //   mainAxisSpacing: 10,
            //   crossAxisCount: 2,
            //   children: <Widget>[
            //     Card(
            //       color: Color(0xff179F87),
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(15),
            //       ),
            //       child: InkWell(
            //         onTap: () {
            //           Navigator.push(
            //             context,
            //             MaterialPageRoute(builder: (context) => homeBAPS()),
            //           );
            //         },
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //           children: [
            //             Container(
            //                 height: 70,
            //                 width: 50,
            //                 child: new Image.asset('assets/img/fuel.png')
            //             ),
            //             Column(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: [
            //                 Text(
            //                     '$fuelValue' + ' L',
            //                     textAlign: TextAlign.center,
            //                     style: TextStyle(color: Colors.white,
            //                         fontFamily: Fonts.BOLD,fontSize: 18)
            //                 ),
            //                 Text(
            //                     'Fuel Consumption',
            //                     textAlign: TextAlign.center,
            //                     style: TextStyle(color: Colors.white,
            //                         fontFamily: Fonts.REGULAR,fontSize: 12)
            //                 ),
            //               ],
            //             )
            //           ],
            //         )
            //       ),
            //     ),
            //     Card(
            //       color: Color(0xffFB7B76),
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(15),
            //       ),
            //       child: InkWell(
            //           onTap: () {
            //             Navigator.push(
            //               context,
            //               MaterialPageRoute(builder: (context) => homeLansiran()),
            //             );
            //           },
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //             children: [
            //               Container(
            //                   height: 70,
            //                   width: 50,
            //                   child: new Image.asset('assets/img/fuel.png')
            //               ),
            //               Column(
            //                 mainAxisAlignment: MainAxisAlignment.center,
            //                 children: [
            //                   Text(
            //                       '$fuelValue' + ' L',
            //                       textAlign: TextAlign.center,
            //                       style: TextStyle(color: Colors.white,
            //                           fontFamily: Fonts.BOLD,fontSize: 18)
            //                   ),
            //                   Text(
            //                       'Sisa L FuelTruck',
            //                       textAlign: TextAlign.center,
            //                       style: TextStyle(color: Colors.white,
            //                           fontFamily: Fonts.REGULAR,fontSize: 12)
            //                   ),
            //                 ],
            //               )
            //             ],
            //           )
            //       ),
            //     ),
            //     Card(
            //       color: Color(0xff00A0C8),
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(15),
            //       ),
            //       child: InkWell(
            //           onTap: () {
            //             print('Card tapped.');
            //           },
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //             children: [
            //               Container(
            //                   height: 70,
            //                   width: 50,
            //                   child: new Image.asset('assets/img/truck.png')
            //               ),
            //               Column(
            //                 mainAxisAlignment: MainAxisAlignment.center,
            //                 children: [
            //                   Text(
            //                       '$unitCode',
            //                       textAlign: TextAlign.center,
            //                       style: TextStyle(color: Colors.white,
            //                           fontFamily: Fonts.BOLD,fontSize: 18)
            //                   ),
            //                   Text(
            //                       'Big Refueling',
            //                       textAlign: TextAlign.center,
            //                       style: TextStyle(color: Colors.white,
            //                           fontFamily: Fonts.REGULAR,fontSize: 12)
            //                   ),
            //                 ],
            //               )
            //             ],
            //           )
            //       ),
            //     ),
            //     Card(
            //       color: Color(0xffE88813),
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(15),
            //       ),
            //       child: InkWell(
            //           onTap: () {
            //             print('Card tapped.');
            //           },
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //             children: [
            //               Container(
            //                   height: 70,
            //                   width: 50,
            //                   child: new Image.asset('assets/img/fuel.png')
            //               ),
            //               Column(
            //                 mainAxisAlignment: MainAxisAlignment.center,
            //                 children: [
            //                   Text(
            //                       '$fuelValue' + ' L',
            //                       textAlign: TextAlign.center,
            //                       style: TextStyle(color: Colors.white,
            //                           fontFamily: Fonts.BOLD,fontSize: 18)
            //                   ),
            //                   Text(
            //                       'Fuel Consumption',
            //                       textAlign: TextAlign.center,
            //                       style: TextStyle(color: Colors.white,
            //                           fontFamily: Fonts.REGULAR,fontSize: 12)
            //                   ),
            //                 ],
            //               )
            //             ],
            //           )
            //       ),
            //     ),
            //   ],
            // ),
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
            Container(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(8),
                  itemCount: unitCodeList.length,
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
                                  Text('${unitCodeList[index]}',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: Fonts.REGULAR,
                                          fontSize: 18)),
                                  Text('$fuelValue' + 'L',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: Fonts.REGULAR,
                                          fontSize: 12)),
                                  Text('$time',
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
                                  onPressed: () => Navigator.pop(context),
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
            )
          ],
        ));
  }
}
