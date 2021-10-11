part of '../pages.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {


  void initState(){
    super.initState();
    splashScreenStart();
  }

  splashScreenStart() async{
    var duration = const Duration(seconds: 3);
    return Timer(duration, (){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=>Login()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(0),
              child: Text('Mobile FMS',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 36,
                      fontFamily: Fonts.BOLD
                  ) ),
            ),
            Container(
                height: 350,
                width: 350,
                child: new Image.asset('assets/img/logo_fms_1.png')
            ),
            Padding(
              padding: const EdgeInsets.all(0),
              child: Text('version 4.0',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: Fonts.LIGHT
                  ) ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(0),
              child: Text('Powered By:',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: Fonts.REGULAR
                  ) ),
            ),
            Padding(
              padding: const EdgeInsets.all(0),
              child: Text('PT Harmoni Panca Utama',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: Fonts.REGULAR
                  ) ),
            ),
          ],
        ),
      ),
    );
  }
}

