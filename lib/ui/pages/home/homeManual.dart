part of '../pages.dart';

class HomeManual extends StatefulWidget {
  const HomeManual({Key? key}) : super(key: key);

  @override
  _HomeManualState createState() => _HomeManualState();
}

class _HomeManualState extends State<HomeManual> {
  late final int index;
  int _selectedIndex = 0;
  bool isChecked = false;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    Home(),
    Text('testing'),
    Text(
      'Index 2: Notif',
      style: optionStyle,
    ),
    Profile(),
  ];

  List <bool> checkboxValue = [
    false, false, false, false, false, false, false, false, false
  ];
  // for(i=0; i < 8; i++){
  //   checkboxValue[i] = "false";
  // }

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.blue;
    }
    return Container(
      height: MediaQuery.of(context).size.height/1.2,
      color: Colors.white,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: new IconButton(
              icon: new Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => homeDashboard()),
                );
              },
            ),
            title: const Text('Synchronize',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: Fonts.REGULAR,
                    fontSize: 18)),

            backgroundColor: Colors.white,
            bottom: const TabBar(
              physics: NeverScrollableScrollPhysics(),
              indicatorColor: Coloring.mainColor,
              tabs: [
                Tab(
                  child: Text(
                      'Download',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Coloring.mainColor,
                          fontFamily: Fonts.REGULAR,fontSize: 12)
                  ),),
                Tab(
                  child: Text(
                      'Upload',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Coloring.mainColor,
                          fontFamily: Fonts.REGULAR,fontSize: 12)
                  ),),
              ],
            ),

          ),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children:  <Widget>[
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(8),
                  itemCount: 9,
                  itemBuilder: (BuildContext context, index) {
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
                                  child: new Image.asset('assets/img/truck.png')
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      'Equipment'+' $index',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(color: Colors.black,
                                          fontFamily: Fonts.REGULAR,fontSize: 18)
                                  ),
                                  Text(
                                      '10''$index' + 'L',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.grey,
                                          fontFamily: Fonts.REGULAR,fontSize: 12)
                                  ),
                                  Text(
                                      Global.time,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.grey,
                                          fontFamily: Fonts.REGULAR,fontSize: 12)
                                  ),
                                ],
                              ),
                              RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    side: BorderSide(color: Coloring.mainColor)),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => homeDetailTransaksi(index: index)),
                                  );
                                },
                                color: Colors.white,
                                textColor: Colors.white,
                                child: Text("Detail",
                                    style: TextStyle(color: Coloring.mainColor, fontFamily: Fonts.REGULAR,fontSize: 14)),
                              ),
                            ],
                          )
                      ),
                    );
                  }
              ),
              // FutureBuilder<List>(
              //   future: FmsDatabase.instance.readRefueling(), // a previously-obtained Future<String> or null
              //   builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              //     List<Widget> children;
              //     if (snapshot.hasData) {
              //       return ListView.builder(
              //           scrollDirection: Axis.vertical,
              //           shrinkWrap: true,
              //           padding: const EdgeInsets.all(8),
              //           itemCount: snapshot.data!.length,
              //           itemBuilder: (BuildContext context, int index) {
              //             return Card(
              //               elevation: 0.8,
              //               shadowColor: Colors.grey,
              //               shape: RoundedRectangleBorder(
              //                 borderRadius: BorderRadius.circular(10),
              //               ),
              //               child: InkWell(
              //                   onTap: () {
              //                     print('Card tapped.');
              //                   },
              //                   child: Row(
              //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //                     children: [
              //                       Container(
              //                           height: 70,
              //                           width: 50,
              //                           child:
              //                           new Image.asset('assets/img/truck.png')),
              //                       Column(
              //                         mainAxisAlignment: MainAxisAlignment.start,
              //                         crossAxisAlignment: CrossAxisAlignment.start,
              //                         children: [
              //                           Text(snapshot.data![index]['equipment_id'],
              //                               textAlign: TextAlign.left,
              //                               style: TextStyle(
              //                                   color: Colors.black,
              //                                   fontFamily: Fonts.REGULAR,
              //                                   fontSize: 18)),
              //                           Text(snapshot.data![index]['tank_capacity'].toString(),
              //                               textAlign: TextAlign.center,
              //                               style: TextStyle(
              //                                   color: Colors.grey,
              //                                   fontFamily: Fonts.REGULAR,
              //                                   fontSize: 12)),
              //                           Text(snapshot.data![index]['created_at'],
              //                               textAlign: TextAlign.center,
              //                               style: TextStyle(
              //                                   color: Colors.grey,
              //                                   fontFamily: Fonts.REGULAR,
              //                                   fontSize: 12)),
              //                         ],
              //                       ),
              //                       Container(
              //                         child: RaisedButton(
              //                           shape: RoundedRectangleBorder(
              //                               borderRadius: BorderRadius.circular(5),
              //                               side: BorderSide(
              //                                   color: Coloring.mainColor)),
              //                           onPressed: () {
              //                             Navigator.push(
              //                                 context,
              //                                 MaterialPageRoute(
              //                                   builder: (context) => homeDetailTransaksi(index)),
              //                                 );
              //                           },
              //                           color: Colors.white,
              //                           textColor: Colors.white,
              //                           child: Text("Detail",
              //                               style: TextStyle(
              //                                   color: Coloring.mainColor,
              //                                   fontFamily: Fonts.REGULAR,
              //                                   fontSize: 14)),
              //                         ),
              //                       ),
              //                     ],
              //                   )),
              //             );
              //           });
              //     } else if (snapshot.hasError) {
              //       return Container(
              //         child: Text('error'),
              //       );
              //     } else {
              //       return Container();
              //     }
              //   },
              // ),
              Column(
                children: [
                  SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {

                          },
                          child: Text('Select All',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color(0xffF0C419),
                                  fontFamily: Fonts.REGULAR,
                                  fontSize: 18)),
                        ),
                        InkWell(
                          onTap: () {

                          },
                          child: Text('Upload All',
                              style: TextStyle(
                                  color: Color(0xffF0C419),
                                  fontFamily: Fonts.REGULAR,
                                  fontSize: 18)),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(8),
                        itemCount: 8,
                        itemBuilder: (BuildContext context, index) {
                          return Card(
                            elevation: 0.8,
                            shadowColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    // Checkbox(
                                    //       checkColor: Colors.white,
                                    //       fillColor: MaterialStateProperty.resolveWith(getColor),
                                    //       value: isChecked,
                                    //       onChanged: (bool? value) {
                                    //         // print('')
                                    //           isChecked = value!;
                                    //       },
                                    //     ),
                                    SizedBox(
                                      height: 70,
                                      width: 30,
                                      child: CheckboxListTile(
                                        title: Text(""),
                                        value: checkboxValue[index],
                                        onChanged: (bool? value) {
                                          if(value != null) {
                                            setState(() {
                                              checkboxValue[index] = value;
                                            });
                                          }
                                          // print(value);
                                        },
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            'Equipment'+' $index',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(color: Colors.black,
                                                fontFamily: Fonts.REGULAR,fontSize: 18)
                                        ),
                                        Text(
                                            '10''$index' + 'L',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(color: Colors.grey,
                                                fontFamily: Fonts.REGULAR,fontSize: 12)
                                        ),
                                        Text(
                                            Global.time,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(color: Colors.grey,
                                                fontFamily: Fonts.REGULAR,fontSize: 12)
                                        ),
                                      ],
                                    ),
                                    RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5),
                                          side: BorderSide(color: Coloring.mainColor)),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => homeDetailTransaksi(index:index)),
                                        );
                                      },
                                      color: Colors.white,
                                      textColor: Colors.white,
                                      child: Text("Detail",
                                          style: TextStyle(color: Coloring.mainColor, fontFamily: Fonts.REGULAR,fontSize: 14)),
                                    ),
                                  ],
                                )
                          );
                        }
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}




