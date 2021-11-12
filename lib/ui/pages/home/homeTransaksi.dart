part of '../pages.dart';

class homeTransaksi extends StatefulWidget {
  const homeTransaksi({Key? key}) : super(key: key);

  @override
  _homeTransaksiState createState() => _homeTransaksiState();
}

class _homeTransaksiState extends State<homeTransaksi> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
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
            backgroundColor: Colors.white,
            bottom: const TabBar(
              physics: NeverScrollableScrollPhysics(),
              indicatorColor: Coloring.mainColor,
              tabs: [
                Tab(
                  child: Text(
                    'Refueling',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Coloring.mainColor,
                        fontFamily: Fonts.REGULAR,fontSize: 12)
                ),),
                Tab( text: ''),
                Tab( text: '')
              ],
            ),

            title: const Text('History',
                style: TextStyle(color: Colors.black,
                    fontFamily: Fonts.REGULAR,fontSize: 18)),
          ),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children:  <Widget>[
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(8),
                  itemCount: 20,
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
                                      Refueling.fHmEquipment+'$index',
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
                                      MaterialPageRoute(builder: (context) => homeDetailTransaksi(index)),
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
              Icon(null),
              Icon(null),
            ],
          ),
        ),
      ),
    );
  }
}
