part of '../pages.dart';

class scanFailed extends StatelessWidget {
  const scanFailed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Scanner()),
                      );
                    },
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
}
