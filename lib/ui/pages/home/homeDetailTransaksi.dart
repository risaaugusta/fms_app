part of '../pages.dart';

class homeDetailTransaksi extends StatefulWidget {
  final int index;
  homeDetailTransaksi({Key? key, required this.index}) : super(key: key);

  @override
  _homeDetailTransaksiState createState() => _homeDetailTransaksiState();
}

class _homeDetailTransaksiState extends State<homeDetailTransaksi>{
  late Future<MsEquipment> data;
  ApiService apiService = ApiService();
  final String apiUrl = "https://10.10.0.223/backendapimaster/public/api/auth/Equipments";
  String unitType = "Dump Truck";
  String unitCode = "FT1125";
  int budget = 450;
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
  homeDetailTransaksi(index: 0),
  HomeManual(),
  Text(
  'Index 2: Notif',
  style: optionStyle,
  ),
  Profile(),
  ];

  ScrollController _controller = new ScrollController();

  @override
  void initState() {
    super.initState();
    data = apiService.fetchOperator();
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
            // FutureBuilder<List>(
            //   future: FmsDatabase.instance.readRefueling(), // a previously-obtained Future<String> or null
            //   builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            //     List<Widget> children;
            //     if (snapshot.hasData) {
            //             return Column(
            //               mainAxisAlignment: MainAxisAlignment.start,
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Container(
            //                   margin: EdgeInsets.all(30),
            //                   width: MediaQuery.of(context).size.width,
            //                   height: MediaQuery.of(context).size.height/7,
            //                   decoration: BoxDecoration(
            //                       color: Colors.white,
            //                       borderRadius: BorderRadius.all(Radius.circular(10)),
            //                       border: Border.all(
            //                         color: Color(0xffE4E4E4),
            //                         width: 1,
            //                       )
            //                   ),
            //                   child: Row(
            //                     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //                     crossAxisAlignment: CrossAxisAlignment.start,
            //                     children: [
            //                       Container(
            //                           height: 100,
            //                           width: 100,
            //                           child: new Image.asset('assets/img/truck.png')
            //                       ),
            //                       Column(
            //                         mainAxisAlignment: MainAxisAlignment.spaceAround,
            //                         crossAxisAlignment: CrossAxisAlignment.start,
            //                         children: [
            //                           // SizedBox(height: 10),
            //                           Text(
            //                               'Unit Code',
            //                               textAlign: TextAlign.left,
            //                               style: TextStyle(color: Colors.grey,
            //                                   fontFamily: Fonts.REGULAR,fontSize: 18)
            //                           ),
            //                           // SizedBox(height: 10),
            //                           Text(
            //                               'Unit Type',
            //                               textAlign: TextAlign.left,
            //                               style: TextStyle(color: Colors.grey,
            //                                   fontFamily: Fonts.REGULAR,fontSize: 18)
            //                           ),
            //                           // SizedBox(height: 10),
            //                           Text(
            //                               'Fuel Filling',
            //                               textAlign: TextAlign.left,
            //                               style: TextStyle(color: Colors.grey,
            //                                   fontFamily: Fonts.REGULAR,fontSize: 18)
            //                           ),
            //                         ],
            //                       ),
            //                       Column(
            //                         mainAxisAlignment: MainAxisAlignment.spaceAround,
            //                         crossAxisAlignment: CrossAxisAlignment.start,
            //                         children: [
            //                           Text(
            //                               snapshot.data![index]['equipment_id'],
            //                               textAlign: TextAlign.left,
            //                               style: TextStyle(color: Colors.black,
            //                                   fontFamily: Fonts.REGULAR,fontSize: 18)
            //                           ),
            //                           Text(
            //                               snapshot.data![index]['model_number'],
            //                               textAlign: TextAlign.left,
            //                               style: TextStyle(color: Colors.black,
            //                                   fontFamily: Fonts.REGULAR,fontSize: 18)
            //                           ),
            //                           Text(
            //                               snapshot.data![index]['fuel_filling'].toString() ,
            //                               textAlign: TextAlign.left,
            //                               style: TextStyle(color: Colors.black,
            //                                   fontFamily: Fonts.REGULAR,fontSize: 18)
            //                           ),
            //                         ],
            //                       ),
            //                     ],
            //                   ),
            //                 ),
            //                 Container(
            //                   margin: EdgeInsets.only(left:30,right:30),
            //                   width: MediaQuery.of(context).size.width,
            //                   height: MediaQuery.of(context).size.height/5,
            //                   decoration: BoxDecoration(
            //                       color: Colors.white,
            //                       borderRadius: BorderRadius.all(Radius.circular(10)),
            //                       border: Border.all(
            //                         color: Color(0xffE4E4E4),
            //                         width: 1,
            //                       )
            //                   ),
            //                   child: Column(
            //                     mainAxisAlignment: MainAxisAlignment.start,
            //                     crossAxisAlignment: CrossAxisAlignment.center,
            //                     children: [
            //                       Row(
            //                         mainAxisAlignment: MainAxisAlignment.start,
            //                         children: [
            //                           Padding(
            //                             padding: EdgeInsets.only(left: 10,top:10),
            //                             child: Text(
            //                                 'Operator',
            //                                 textAlign: TextAlign.left,
            //                                 style: TextStyle(color: Colors.grey,
            //                                     decoration: TextDecoration.underline,
            //                                     fontFamily: Fonts.REGULAR,fontSize: 18)
            //                             ),
            //                           ),
            //                           Padding(
            //                             padding: const EdgeInsets.only(left: 70, top: 10),
            //                             child: Text(
            //                                 snapshot.data![index]['operator_id'].toString(),
            //                                 textAlign: TextAlign.left,
            //                                 style: TextStyle(color: Colors.black,
            //                                     decoration: TextDecoration.underline,
            //                                     fontFamily: Fonts.REGULAR,fontSize: 18)
            //                             ),
            //                           ),
            //                         ],
            //                       ),
            //                       Divider(
            //                         color: Colors.grey[70],
            //                         thickness: 1,
            //                       ),
            //                       Row(
            //                         mainAxisAlignment: MainAxisAlignment.start,
            //                         children: [
            //                           Padding(
            //                             padding: EdgeInsets.only(left: 10),
            //                             child: Text(
            //                                 'HM Unit',
            //                                 textAlign: TextAlign.left,
            //                                 style: TextStyle(color: Colors.grey,
            //                                     decoration: TextDecoration.underline,
            //                                     fontFamily: Fonts.REGULAR,fontSize: 18)
            //                             ),
            //                           ),
            //                           Padding(
            //                             padding: const EdgeInsets.only(left: 70),
            //                             child: Text(
            //                                 snapshot.data![index]['category_desc'],
            //                                 textAlign: TextAlign.left,
            //                                 style: TextStyle(color: Colors.black,
            //                                     decoration: TextDecoration.underline,
            //                                     fontFamily: Fonts.REGULAR,fontSize: 18)
            //                             ),
            //                           ),
            //                         ],
            //                       ),
            //                       Divider(
            //                         color: Colors.grey[70],
            //                         thickness: 1,
            //                       ),
            //                       Row(
            //                         mainAxisAlignment: MainAxisAlignment.start,
            //                         children: [
            //                           Padding(
            //                             padding: EdgeInsets.only(left: 10),
            //                             child: Text(
            //                                 'Site',
            //                                 textAlign: TextAlign.left,
            //                                 style: TextStyle(color: Colors.grey,
            //                                     decoration: TextDecoration.underline,
            //                                     fontFamily: Fonts.REGULAR,fontSize: 18)
            //                             ),
            //                           ),
            //                           Padding(
            //                             padding: const EdgeInsets.only(left: 105),
            //                             child: Text(
            //                                 snapshot.data![index]['company_code'],
            //                                 textAlign: TextAlign.left,
            //                                 style: TextStyle(color: Colors.black,
            //                                     decoration: TextDecoration.underline,
            //                                     fontFamily: Fonts.REGULAR,fontSize: 18)
            //                             ),
            //                           ),
            //                         ],
            //                       ),
            //                       Divider(
            //                         color: Colors.grey[70],
            //                         thickness: 1,
            //                       ),
            //                       Row(
            //                         mainAxisAlignment: MainAxisAlignment.start,
            //                         children: [
            //                           Padding(
            //                             padding: EdgeInsets.only(left: 10),
            //                             child: Text(
            //                                 'Last Refueling',
            //                                 textAlign: TextAlign.left,
            //                                 style: TextStyle(color: Colors.grey,
            //                                     decoration: TextDecoration.underline,
            //                                     fontFamily: Fonts.REGULAR,fontSize: 18)
            //                             ),
            //                           ),
            //                           Padding(
            //                             padding: const EdgeInsets.only(left: 20),
            //                             child: Text(
            //                                 snapshot.data![index]['created_at'],
            //                                 textAlign: TextAlign.left,
            //                                 style: TextStyle(color: Colors.black,
            //                                     decoration: TextDecoration.underline,
            //                                     fontFamily: Fonts.REGULAR,fontSize: 18)
            //                             ),
            //                           ),
            //                         ],
            //                       ),
            //                     ],
            //                   ),
            //                 ),
            //                 Container(
            //                   margin: EdgeInsets.only(left:30,right:30,top: 30),
            //                   width: MediaQuery.of(context).size.width,
            //                   height: MediaQuery.of(context).size.height/4,
            //                   decoration: BoxDecoration(
            //                       color: Colors.white,
            //                       borderRadius: BorderRadius.all(Radius.circular(10)),
            //                       border: Border.all(
            //                         color: Color(0xffE4E4E4),
            //                         width: 1,
            //                       )
            //                   ),
            //                   child: Column(
            //                     mainAxisAlignment: MainAxisAlignment.center,
            //                     crossAxisAlignment: CrossAxisAlignment.center,
            //                     children: [
            //                       Row(
            //                         mainAxisAlignment: MainAxisAlignment.start,
            //                         children: [
            //                           Padding(
            //                             padding: EdgeInsets.only(left: 10,top:10),
            //                             child: Text(
            //                                 'Last Refueling ',
            //                                 textAlign: TextAlign.left,
            //                                 style: TextStyle(color: Colors.grey,
            //                                     decoration: TextDecoration.underline,
            //                                     fontFamily: Fonts.REGULAR,fontSize: 18)
            //                             ),
            //                           ),
            //                           Padding(
            //                             padding: const EdgeInsets.only(left: 30, top: 10),
            //                             child: Text(
            //                                 snapshot.data![index]['operator_id'].toString(),
            //                                 textAlign: TextAlign.left,
            //                                 style: TextStyle(color: Colors.black,
            //                                     decoration: TextDecoration.underline,
            //                                     fontFamily: Fonts.REGULAR,fontSize: 18)
            //                             ),
            //                           ),
            //                         ],
            //                       ),
            //                       Divider(
            //                         color: Colors.grey[70],
            //                         thickness: 1,
            //                       ),
            //                       Row(
            //                         mainAxisAlignment: MainAxisAlignment.start,
            //                         children: [
            //                           Padding(
            //                             padding: EdgeInsets.only(left: 10),
            //                             child: Text(
            //                                 'Totalisator Awal',
            //                                 textAlign: TextAlign.left,
            //                                 style: TextStyle(color: Colors.grey,
            //                                     decoration: TextDecoration.underline,
            //                                     fontFamily: Fonts.REGULAR,fontSize: 18)
            //                             ),
            //                           ),
            //                           Padding(
            //                             padding: const EdgeInsets.only(left: 20),
            //                             child: Text(
            //                                 snapshot.data![index]['fuel_totalisator_awal'],
            //                                 textAlign: TextAlign.left,
            //                                 style: TextStyle(color: Colors.black,
            //                                     decoration: TextDecoration.underline,
            //                                     fontFamily: Fonts.REGULAR,fontSize: 18)
            //                             ),
            //                           ),
            //                         ],
            //                       ),
            //                       Divider(
            //                         color: Colors.grey[70],
            //                         thickness: 1,
            //                       ),
            //                       Row(
            //                         mainAxisAlignment: MainAxisAlignment.start,
            //                         children: [
            //                           Padding(
            //                             padding: EdgeInsets.only(left: 10),
            //                             child: Text(
            //                                 'Totalisator Akhir',
            //                                 textAlign: TextAlign.left,
            //                                 style: TextStyle(color: Colors.grey,
            //                                     decoration: TextDecoration.underline,
            //                                     fontFamily: Fonts.REGULAR,fontSize: 18)
            //                             ),
            //                           ),
            //                           Padding(
            //                             padding: const EdgeInsets.only(left: 20),
            //                             child: Text(
            //                                 snapshot.data![index]['fuel_totalisator_akhir'].toString(),
            //                                 textAlign: TextAlign.left,
            //                                 style: TextStyle(color: Colors.black,
            //                                     decoration: TextDecoration.underline,
            //                                     fontFamily: Fonts.REGULAR,fontSize: 18)
            //                             ),
            //                           ),
            //                         ],
            //                       ),
            //                       Divider(
            //                         color: Colors.grey[70],
            //                         thickness: 1,
            //                       ),
            //                       Row(
            //                         mainAxisAlignment: MainAxisAlignment.start,
            //                         children: [
            //                           Padding(
            //                             padding: EdgeInsets.only(left: 10),
            //                             child: Text(
            //                                 'Total L/Month',
            //                                 textAlign: TextAlign.left,
            //                                 style: TextStyle(color: Colors.grey,
            //                                     decoration: TextDecoration.underline,
            //                                     fontFamily: Fonts.REGULAR,fontSize: 18)
            //                             ),
            //                           ),
            //                           Padding(
            //                             padding: const EdgeInsets.only(left: 40),
            //                             child: Text(
            //                                 snapshot.data![index]['total'].toString() + ' L',
            //                                 textAlign: TextAlign.left,
            //                                 style: TextStyle(color: Colors.black,
            //                                     decoration: TextDecoration.underline,
            //                                     fontFamily: Fonts.REGULAR,fontSize: 18)
            //                             ),
            //                           ),
            //                         ],
            //                       ),
            //                     ],
            //                   ),
            //                 ),
            //               ],
            //             );
            //     } else if (snapshot.hasError) {
            //       return Container(
            //         child: Text('Tidak ada data'),
            //       );
            //     } else {
            //       return Container();
            //     }
            //   },
            // ),
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
                            Text(
                                '$unitCode',
                                textAlign: TextAlign.left,
                                style: TextStyle(color: Colors.black,
                                    fontFamily: Fonts.REGULAR,fontSize: 18)
                            ),
                            Text(
                                '$unitType',
                                textAlign: TextAlign.left,
                                style: TextStyle(color: Colors.black,
                                    fontFamily: Fonts.REGULAR,fontSize: 18)
                            ),
                            Text(
                                '3' ,
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
                            FutureBuilder<MsEquipment>(
                              future: data,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Text(snapshot.data!.auth_group);
                                } else if (snapshot.hasError) {
                                  return Text('${snapshot.error}');
                                }
                                // By default, show a loading spinner.
                                return const CircularProgressIndicator();
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 70, top: 10),
                              child: Text(
                                  'DMI',
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
                                  'Fuel Truck',
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
                                  '$unitCode',
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
                                  Global.time,
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
                                  '3',
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
                                  '3',
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
                                  '3',
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
                                  '100' + ' L',
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Home()),
                            );
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
                              Text('Home',
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
                              Text('Sync',
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

  //
  // Future<List<dynamic>> fetchUsers() async {
  //   var result = await http.get(apiUrl);
  //   return json.decode(result.body)['results'];
  // }
  //
  // Future fetchOperator() async {
  //   var data = await http.get('https://10.10.0.223/backendapimaster/public/api/auth/Equipments');
  //
  //   var decoded = jsonDecode(data.body);
  //   var subdata =  decoded["data"]["modelKewajiban"]["list"]["10"]["detail"];
  //   return subdata;
  // }
  }




