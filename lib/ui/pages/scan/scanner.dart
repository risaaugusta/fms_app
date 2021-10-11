part of '../pages.dart';

class Scanner extends StatefulWidget {
  const Scanner({Key? key}) : super(key: key);

  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  bool _show = false;
  final _gKey = new GlobalKey<ScaffoldState>();
  final qrKey = new GlobalKey(debugLabel: 'QR');
  final List<bool> isSelected = [
    true,false
  ];
  Barcode? barcode;
  QRViewController? controller;

  @override
  void dispose(){
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    } controller?.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
          key: _gKey,
          alignment: Alignment.center,
          children: [
            buildQrView(context),
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/1.3, right: 15, left: 15),
              width: MediaQuery.of(context).size.width,
              height: 130,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              // ToggleButtons(
              //   children: <Widget>[
              //     Icon(Icons.ac_unit),
              //     Icon(Icons.call),
              //   ],
              //   onPressed: (int index) {
              //     setState(() {
              //       isSelected[index] = !isSelected[index];
              //     });
              //   },
              //   isSelected: isSelected,
              // ),
            ),
            // buildResult(context),
            // selectedScanner(),
            (barcode != null ) ? buildResult(context) : dialogFail(),
            // buildResult(context),
            // Positioned(bottom: 300, child: buildResult()),
          ],
        ),
    );
  }

  ///QR Scanner View
  Widget buildQrView(BuildContext context) => QRView(
    key: qrKey,
    onQRViewCreated: onQRViewCreated,
    overlay: QrScannerOverlayShape(),
  );

  ///QRCode Result View
  Widget buildResult(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          height: MediaQuery.of(context).size.height / 1.8,
          // child: Text(barcode != null? 'Result is ${barcode!.code}' : 'Scan a code!'));
          child: (barcode != null) ? dialogSuccess(barcode: barcode!.code) : dialogFail()  ),
          // child: (barcode != null) ? scanSuccess() : scanFailed()),
    );

  }

  void onQRViewCreated(QRViewController controller){
    setState(() => this.controller = controller);

    controller.scannedDataStream
    .listen((barcode) => setState(()=>this.barcode = barcode));
  }

  ///dialog
  _dialog() {
    _gKey.currentState?.showBottomSheet(
            (context)
    {
      return Container(

        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        height: MediaQuery.of(context).size.height / 1.5 ,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: 100,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xffE4E4E4)
                  ),
                    color: Colors.transparent,
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                'Result is ${barcode!.code} ',
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
                                'Result is ${barcode!.code} ',
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
                                'Result is ${barcode!.code} ',
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
                margin: EdgeInsets.only(top: 10,bottom:10),
                width: MediaQuery.of(context).size.width / 1.1,
                height: 200,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Color(0xffE4E4E4)
                    ),
                    color: Colors.transparent,
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
                            'Result is ${barcode!.code} ',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.black,
                                fontFamily: Fonts.REGULAR,fontSize: 18)
                        ),
                        // Divider(
                        //    color: Colors.grey,
                        //    thickness: 1.0,
                        //  ),
                        Text(
                            'Result is ${barcode!.code} ',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.black,
                                fontFamily: Fonts.REGULAR,fontSize: 18)
                        ),
                        Text(
                            'Result is ${barcode!.code} ',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.black,
                                fontFamily: Fonts.REGULAR,fontSize: 18)
                        ),
                        Text(
                            'Result is ${barcode!.code} ',
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
                    onPressed: () => Navigator.pop(context),
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
        ),);
    }
    );
  }

   displayBottomSheet()
  {
    _gKey.currentState?.showBottomSheet((context)
    {
      return Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        height: MediaQuery.of(context).size.height / 1.7 ,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: const Text('QR Code Tidak Cocok!',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontFamily: Fonts.BOLD,fontSize: 18)),
              ),
              Container(
                  height: 150,
                  width: 150,
                  child: new Image.asset('assets/img/man1.png')
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: const Text('Pastikan QR code tidak terhalang noda, dan nyalakan lampu flash handphone Anda',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontFamily: Fonts.REGULAR,fontSize: 14)),
              ),
              Container(
                // margin:  EdgeInsets.only(top: 20),
                height: 60,
                child: ButtonTheme(
                  minWidth: 300,
                  child: Container(
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(color: Coloring.mainColor)),
                      onPressed: () => Navigator.pop(context),
                      color: Coloring.mainColor,
                      textColor: Colors.white,
                      child: Text("Coba Lagi",
                          style: TextStyle(color: Colors.white, fontFamily: Fonts.BOLD,fontSize: 18)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
    );
  }


}

///selectedButtonScanner
class selectedScanner extends StatelessWidget {
  const selectedScanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/1.3, right: 15, left: 15),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(color: Colors.grey)),
        onPressed: () {
            // _dialogFailedAlert();
        },
        color: Colors.white,
        textColor: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.speed,
              color: Colors.black,
              size: 30,
            ),
            Text("Input Kode Unit",
                style: TextStyle(color: Colors.black, fontFamily: Fonts.REGULAR,fontSize: 14)),
          ],
        ),
      ),
    );
  }
}

///dialogFail
class dialogFail extends StatelessWidget {
  const dialogFail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
        onClosing: (){
          Scanner();
        },
        builder: (context){
          return Container(
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            height: MediaQuery.of(context).size.height / 1.7 ,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: const Text('QR Code Tidak Cocok!',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontFamily: Fonts.BOLD,fontSize: 18)),
                  ),
                  Container(
                      height: 150,
                      width: 150,
                      child: new Image.asset('assets/img/man1.png')
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: const Text('Pastikan QR code tidak terhalang noda, dan nyalakan lampu flash handphone Anda',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontFamily: Fonts.REGULAR,fontSize: 14)),
                  ),
                  Container(
                    // margin:  EdgeInsets.only(top: 20),
                    height: 60,
                    child: ButtonTheme(
                      minWidth: 300,
                      child: Container(
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              side: BorderSide(color: Coloring.mainColor)),
                          onPressed: () => Navigator.pop(context),
                          color: Coloring.mainColor,
                          textColor: Colors.white,
                          child: Text("Coba Lagi",
                              style: TextStyle(color: Colors.white, fontFamily: Fonts.BOLD,fontSize: 18)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}

///dialogSuccess
class dialogSuccess extends StatelessWidget {
  const dialogSuccess({Key? key, required this.barcode}) : super(key: key);
  final String barcode;

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
        onClosing: (){},
        builder: (context){
          return Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            height: MediaQuery.of(context).size.height ,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                      width: MediaQuery.of(context).size.width / 1.1,
                      height: 100,
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      margin: EdgeInsets.only(top: 10,bottom:10),
                      width: MediaQuery.of(context).size.width / 1.1,
                      height: 200,
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => scanRefueling()),
                            );
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
            ),);
        }
    );
  }
}







