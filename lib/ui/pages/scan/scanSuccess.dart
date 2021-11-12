part of '../pages.dart';

class scanSuccess extends StatefulWidget {
  const scanSuccess({Key? key}) : super(key: key);

  @override
  _scanSuccessState createState() => _scanSuccessState();
}

class _scanSuccessState extends State<scanSuccess> {
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
          title: const Text('Unit Detail',
              style: TextStyle(color: Colors.black,
                  fontFamily: Fonts.REGULAR,fontSize: 18)),
          backgroundColor: Colors.white,
        ),
         body: Center(
           child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Color(0xffE4E4E4)
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            height: 70,
                            width: 50,
                            child: new Image.asset('assets/img/truck.png')
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    'Unit Code ',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(color: Colors.grey,
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    'Unit Type',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(color: Colors.grey,
                                        fontFamily: Fonts.REGULAR,fontSize: 18)
                                ),
                                Text(
                                    'Result is ${barcode} ',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(color: Colors.black,
                                        fontFamily: Fonts.REGULAR,fontSize: 18)
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                    'Budget',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(color: Colors.grey,
                                        fontFamily: Fonts.REGULAR,fontSize: 18)
                                ),
                                Text(
                                    'Result is ${barcode} ',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(color: Colors.black,
                                        fontFamily: Fonts.REGULAR,fontSize: 18)
                                ),
                              ],
                            ),
                          ],
                        ),

                      ],
                    )
                ),
                Container(
                    margin: EdgeInsets.only(top: 20),
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: MediaQuery.of(context).size.width / 1.5,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Color(0xffE4E4E4)
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'Operator',
                                textAlign: TextAlign.left,
                                style: TextStyle(color: Colors.grey,
                                    fontFamily: Fonts.REGULAR,fontSize: 18)
                            ),
                            // Divider(
                            //    color: Colors.grey,
                            //    thickness: 1.0,
                            //  ),
                            Text(
                                'HM Unit',
                                textAlign: TextAlign.left,
                                style: TextStyle(color: Colors.grey,
                                    fontFamily: Fonts.REGULAR,fontSize: 18)
                            ),
                            Text(
                                'Site',
                                textAlign: TextAlign.left,
                                style: TextStyle(color: Colors.grey,
                                    fontFamily: Fonts.REGULAR,fontSize: 18)
                            ),
                            Text(
                                'Last Refueling',
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
                            // Divider(
                            //    color: Colors.grey,
                            //    thickness: 1.0,
                            //  ),
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
                    )
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: ButtonTheme(
                    minWidth: 150,
                    child: Container(
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: BorderSide(color: Coloring.mainColor)),
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => scanRefueling()),
                          // );
                        },
                        color: Coloring.mainColor,
                        textColor: Colors.white,
                        child: Text("Selanjutnya",
                            style: TextStyle(color: Colors.white, fontFamily: Fonts.REGULAR,fontSize: 24)),
                      ),
                    ),
                  ),
                ),
              ],
          ),
      ),
    );
  }
}

