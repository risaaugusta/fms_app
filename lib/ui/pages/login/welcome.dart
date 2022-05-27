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
    return Timer(duration, () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = await prefs.getString('token');
      if(token == null || token.isEmpty){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context)=>Login()),
        );
      }else{
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context)=>homeDashboard()),
        );
      }
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
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Text('Logistic Interactive',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontFamily: Fonts.BOLD
                  ) ),
            ),
            Container(
                height: 200,
                width: 200,
                margin: EdgeInsets.symmetric(vertical: 50),
                child: new Image.asset('assets/img/excellent_services.png')
            ),
            // SizedBox(height: MediaQuery.of(context).size.height/10),
            Padding(
              padding: const EdgeInsets.all(0),
              child: Text('version 1.0',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: Fonts.LIGHT
                  ) ),
            ),
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
              child: Text('@2022 PT Harmoni Panca Utama',
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

