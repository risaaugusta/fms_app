part of '../pages.dart';

class homeNotifikasi extends StatefulWidget {
  const homeNotifikasi({Key? key}) : super(key: key);

  @override
  _homeNotifikasiState createState() => _homeNotifikasiState();
}

class _homeNotifikasiState extends State<homeNotifikasi> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      margin: EdgeInsets.all(0),
      child:
      SingleChildScrollView(
        child: Wrap(
          direction: Axis.horizontal,
          spacing: 0,
          children: [
            FutureBuilder<List>(
              future: FmsDatabase.instance.readBaps(), // a previously-obtained Future<String> or null
              builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                List<Widget> children;
                if (snapshot.hasData) {
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(5),
                      itemCount: snapshot.data!.length < 2 ? snapshot.data!.length : 1  ,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Container(
                                height: 70,
                                color: Colors.white,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        margin: EdgeInsets.symmetric(horizontal:30),
                                        height: 50,
                                        width: 50,
                                        child: new Image.asset(
                                            'assets/img/notif.png')),
                                    Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context).size.width/1.5,
                                            padding: const EdgeInsets.only(right: 30),
                                            child: Text('Data baru BAPS belum diupload',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: Fonts.BOLD,
                                                    fontSize: 18)),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Text('Mohon segera upload.',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      color: Colors.blueGrey,
                                                      fontFamily: Fonts.REGULAR,
                                                      fontSize: 14)),
                                              SizedBox(width: 80),
                                              Text(Global.today,
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      color: Colors.blueGrey,
                                                      fontFamily: Fonts.REGULAR,
                                                      fontSize: 10)),

                                            ],)
                                        ],
                                      ),
                                  ],
                                )
                            ),
                            Divider(
                              color: Colors.grey[70],
                              thickness: 1,
                            ),
                          ],
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
            FutureBuilder<List>(
              future: FmsDatabase.instance.readSounding(), // a previously-obtained Future<String> or null
              builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                List<Widget> children;
                if (snapshot.hasData) {
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(5),
                      itemCount: snapshot.data!.length < 2 ? snapshot.data!.length : 1 ,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Container(
                                height: 70,
                                color: Colors.white,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        margin: EdgeInsets.symmetric(horizontal:30),
                                        height: 50,
                                        width: 50,
                                        child: new Image.asset(
                                            'assets/img/notif.png')),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width/1.5,
                                          padding: const EdgeInsets.only(right: 30),
                                          child: Text('Data baru Sounding belum diupload',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: Fonts.BOLD,
                                                  fontSize: 18)),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text('Mohon segera upload.',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    color: Colors.blueGrey,
                                                    fontFamily: Fonts.REGULAR,
                                                    fontSize: 14)),
                                            SizedBox(width: 80),
                                            Text(Global.today,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    color: Colors.blueGrey,
                                                    fontFamily: Fonts.REGULAR,
                                                    fontSize: 10)),

                                          ],)
                                      ],
                                    ),
                                  ],
                                )
                            ),
                            Divider(
                              color: Colors.grey[70],
                              thickness: 1,
                            ),
                          ],
                        );
                      });
                } else if (snapshot.hasError) {
                  return Container(
                    child: Text('Tidak ada data'),
                  );
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
            FutureBuilder<List>(
              future: FmsDatabase.instance.readTransfer(), // a previously-obtained Future<String> or null
              builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                List<Widget> children;
                if (snapshot.hasData) {
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(5),
                      itemCount: snapshot.data!.length < 2 ? snapshot.data!.length : 1 ,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Container(
                                height: 70,
                                color: Colors.white,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        margin: EdgeInsets.symmetric(horizontal:30),
                                        height: 50,
                                        width: 50,
                                        child: new Image.asset(
                                            'assets/img/notif.png')),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width/1.5,
                                          padding: const EdgeInsets.only(right: 30),
                                          child: Text('Data baru Transfer belum diupload',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: Fonts.BOLD,
                                                  fontSize: 18)),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text('Mohon segera upload.',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    color: Colors.blueGrey,
                                                    fontFamily: Fonts.REGULAR,
                                                    fontSize: 14)),
                                            SizedBox(width: 80),
                                            Text(Global.today,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    color: Colors.blueGrey,
                                                    fontFamily: Fonts.REGULAR,
                                                    fontSize: 10)),

                                          ],)
                                      ],
                                    ),
                                  ],
                                )
                            ),
                            Divider(
                              color: Colors.grey[70],
                              thickness: 1,
                            ),
                          ],
                        );
                      });
                } else if (snapshot.hasError) {
                  return Container(
                    child: Text('Tidak ada data'),
                  );
                } else {
                  return SizedBox(width: 0, height: 0);
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
                      padding: const EdgeInsets.all(5),
                      itemCount: snapshot.data!.length < 2 ? snapshot.data!.length : 1 ,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Container(
                                height: 70,
                                color: Colors.white,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        margin: EdgeInsets.symmetric(horizontal:30),
                                        height: 50,
                                        width: 50,
                                        child: new Image.asset(
                                            'assets/img/notif.png')),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width/1.5,
                                          padding: const EdgeInsets.only(right: 30),
                                          child: Text('Data baru Refueling belum diupload',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: Fonts.BOLD,
                                                  fontSize: 18)),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text('Mohon segera upload.',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    color: Colors.blueGrey,
                                                    fontFamily: Fonts.REGULAR,
                                                    fontSize: 14)),
                                            SizedBox(width: 80),
                                            Text(Global.today,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    color: Colors.blueGrey,
                                                    fontFamily: Fonts.REGULAR,
                                                    fontSize: 10)),

                                          ],)
                                      ],
                                    ),
                                  ],
                                )
                            )
                          ],
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
            FutureBuilder<List>(
              future: FmsDatabase.instance.readHistoryAttendance(), // a previously-obtained Future<String> or null
              builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                List<Widget> children;
                if (snapshot.hasData) {
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(5),
                      itemCount: snapshot.data!.length < 2 ? snapshot.data!.length : 1 ,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Container(
                                height: 70,
                                color: Colors.white,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        margin: EdgeInsets.symmetric(horizontal:30),
                                        height: 50,
                                        width: 50,
                                        child: new Image.asset(
                                            'assets/img/notif.png')),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width/1.5,
                                          padding: const EdgeInsets.only(right: 30),
                                          child: Text('Data baru Attendance belum diupload',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: Fonts.BOLD,
                                                  fontSize: 18)),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text('Mohon segera upload.',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    color: Colors.blueGrey,
                                                    fontFamily: Fonts.REGULAR,
                                                    fontSize: 14)),
                                            SizedBox(width: 80),
                                            Text(Global.today,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    color: Colors.blueGrey,
                                                    fontFamily: Fonts.REGULAR,
                                                    fontSize: 10)),

                                          ],)
                                      ],
                                    ),
                                  ],
                                )
                            )
                          ],
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
        ),
      ),
    );
  }
}
