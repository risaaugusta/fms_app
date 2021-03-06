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
        children: [
          buildQrView(context),
          FutureBuilder(
            future: Future.value(barcode),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                /// Success
                return dialogSuccess(barcode: barcode!.code);
              } else if (snapshot.hasError) {
                /// Failed
                return dialogFail();
              }
              /// Idle
              return selectedScanner();
            },
          ),
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
    return Stack(
            children: [
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.only(bottom:30),
                    height: MediaQuery.of(context).size.height/6,
                    width: MediaQuery.of(context).size.width/1.2,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                  )),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width/2,
                  margin: EdgeInsets.only(bottom:75),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(color: Colors.grey)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => inputField()),
                      );
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
        ),
              ),

            ],
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
                                      '$barcode ',
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
                                      'Unit Type ',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(color: Colors.grey,
                                          fontFamily: Fonts.REGULAR,fontSize: 18)
                                  ),
                                  Text(
                                      Equipment.eModelNumber,
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
                                      'Budget ',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(color: Colors.grey,
                                          fontFamily: Fonts.REGULAR,fontSize: 18)
                                  ),
                                  Text(
                                      Equipment.eTankCapacity.toString(),
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
                                  Attendance.operator_id.toString(),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(color: Colors.black,
                                      fontFamily: Fonts.REGULAR,fontSize: 18)
                              ),
                              Text(
                                  Equipment.category_desc,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(color: Colors.black,
                                      fontFamily: Fonts.REGULAR,fontSize: 18)
                              ),
                              Text(
                                  Equipment.company_code,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(color: Colors.black,
                                      fontFamily: Fonts.REGULAR,fontSize: 18)
                              ),
                              Text(
                                  Equipment.auth_group,
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
                              MaterialPageRoute(builder: (context) => scanRefueling(barcode_id: barcode,)),
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

///inputField
class inputField extends StatelessWidget {
  const inputField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/5,
                  margin: EdgeInsets.symmetric(horizontal: 20),
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
                      hintText: "Masukkan kode unit",
                      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    ),
                    onChanged: (value)=> {}, //dummy value
                  ),
                ),
                Container(
                  margin:  EdgeInsets.symmetric(horizontal: 20),
                  height: 60,
                  child: ButtonTheme(
                    minWidth: 300,
                    child: Container(
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: BorderSide(color: Coloring.mainColor)),
                        onPressed: () { print('on click');},
                        color: Coloring.mainColor,
                        textColor: Colors.white,
                        child: Text("Kirim",
                            style: TextStyle(color: Colors.white, fontFamily: Fonts.BOLD,fontSize: 18)),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
    );
  }
}







