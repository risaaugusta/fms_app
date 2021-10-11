part of '../pages.dart';

class scanRefueling extends StatefulWidget {
  const scanRefueling({Key? key}) : super(key: key);

  @override
  _scanRefuelingState createState() => _scanRefuelingState();
}

class _scanRefuelingState extends State<scanRefueling> {
  Barcode? barcode;
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
          title: const Text('Refueling',
              style: TextStyle(color: Colors.black,
                  fontFamily: Fonts.REGULAR,fontSize: 18)),
          backgroundColor: Colors.white,
        ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: 70,
                    width: 50,
                    child: new Image.asset('assets/img/truck.png')
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'Unit Code',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.grey,
                            fontFamily: Fonts.REGULAR,fontSize: 18)
                    ),
                    Text(
                        'Unit Type',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.grey,
                            fontFamily: Fonts.REGULAR,fontSize: 18)
                    ),
                    Text(
                        'Bugdet',
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
                    Text(
                        'Result is ${barcode} ',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.black,
                            fontFamily: Fonts.REGULAR,fontSize: 18)
                    ),
                    Text(
                        'Result is ${barcode} ',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.black,
                            fontFamily: Fonts.REGULAR,fontSize: 18)
                    ),
                    Text(
                        'Result is ${barcode} ',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.black,
                            fontFamily: Fonts.REGULAR,fontSize: 18)
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey[70],
            thickness: 3,
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
                'Input Data',
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.black,
                    fontFamily: Fonts.REGULAR,fontSize: 18)
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15,bottom: 15),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15),
                    Text(
                        'Input Fuel',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.black,
                            fontFamily: Fonts.REGULAR,fontSize: 14)
                    ),
                    SizedBox(height: 50),
                    Text(
                        'Input HM',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.black,
                            fontFamily: Fonts.REGULAR,fontSize: 14)
                    ),
                    SizedBox(height: 45),
                    Text(
                        'Totalisator Awal',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.black,
                            fontFamily: Fonts.REGULAR,fontSize: 14)
                    ),
                    SizedBox(height: 45),
                    Text(
                        'Input NIK Operator',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.black,
                            fontFamily: Fonts.REGULAR,fontSize: 14)
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width/1.8,
                      decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                      child: TextFormField(
                          autofocus: false,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Colors.grey.shade200,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            fillColor: Color(0xffFFFFFF),
                            filled: true,
                            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          ),
                          onChanged: (value)=> {}, //dummy value
                        ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width/1.8,
                      margin: EdgeInsets.only(top:15),
                      decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                      child: TextFormField(
                        autofocus: false,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.grey.shade200,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          fillColor: Color(0xffFFFFFF),
                          filled: true,
                          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        ),
                        onChanged: (value)=> {}, //dummy value
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width/4.8,
                            decoration:
                            BoxDecoration(borderRadius: BorderRadius.circular(10)),
                            child: TextFormField(
                              autofocus: false,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade200,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                fillColor: Color(0xffFFFFFF),
                                filled: true,
                                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              ),
                              onChanged: (value)=> {}, //dummy value
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10),
                            child: Text(
                                'Akhir',
                                textAlign: TextAlign.left,
                                style: TextStyle(color: Colors.black,
                                    fontFamily: Fonts.REGULAR,fontSize: 14)
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width/4.8,
                            decoration:
                            BoxDecoration(borderRadius: BorderRadius.circular(10)),
                            child: TextFormField(
                              autofocus: false,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade200,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                fillColor: Color(0xffFFFFFF),
                                filled: true,
                                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              ),
                              onChanged: (value)=> {}, //dummy value
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width/1.8,
                      margin: EdgeInsets.only(top:15),
                      decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                      child: TextFormField(
                        autofocus: false,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.grey.shade200,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          fillColor: Color(0xffFFFFFF),
                          filled: true,
                          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        ),
                        onChanged: (value)=> {}, //dummy value
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey[70],
            thickness: 3,
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
                'Photo',
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.black,
                    fontFamily: Fonts.REGULAR,fontSize: 18)
            ),
          ),
          Divider(
            color: Colors.grey[70],
            thickness: 1,
          ),
          Container(
            margin: EdgeInsets.only(right:15,left:20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        'Photo Meter Fuel',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.black,
                            fontFamily: Fonts.REGULAR,fontSize: 14)
                    ),
                    InkWell(
                        onTap: () {
                          print('tapped.');
                        },
                        child: Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 14))
                  ],
                ),
                Divider(
                  color: Colors.grey[70],
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        'Photo HM Unit',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.black,
                            fontFamily: Fonts.REGULAR,fontSize: 14)
                    ),
                    InkWell(
                        onTap: () {
                          print('tapped.');
                        },
                        child: Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 14))
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top:15),
            alignment: Alignment.center,
            height: 100,
            child: ButtonTheme(
              minWidth: MediaQuery.of(context).size.width/1.2,
              height: 60,
              child: Container(
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(color: Coloring.mainColor)),
                  onPressed: () {},
                  color: Coloring.mainColor,
                  textColor: Colors.white,
                  child: Text("SUBMIT",
                      style: TextStyle(color: Colors.white, fontFamily: Fonts.REGULAR,fontSize: 24)),
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}
