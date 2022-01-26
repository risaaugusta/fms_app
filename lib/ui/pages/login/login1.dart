part of '../pages.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText = true;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Future.delayed(Duration.zero, () => showAlert(context));

    return Scaffold(
      body: Center(
       child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(0),
              child: Text('Sign in',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: Fonts.BOLD
                  ) ),
            ),
            Container(
              width: 300,
              decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(20)),
              margin: EdgeInsets.only(top: 70),
              child: Material(
                elevation: 20.0,
                shadowColor: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    hintText: 'NIK',
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  ),
                  onChanged: (value) {
                    Global.nik = value;
                  },
                ),
              ),
            ),
            Container(
              width: 300,
              decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(20)),
              margin: EdgeInsets.only(top: 20),
              child: Material(
                elevation: 20.0,
                shadowColor: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
                child: TextFormField(
                  autofocus: false,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    hintText: 'Password',
                    fillColor: Colors.white,
                    filled: true,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Theme.of(context).primaryColorDark,
                      ),
                          onPressed: _toggle,
                    ),
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  ),
                  onChanged: (text)=> Global.password = text , //dummy value
                ),
              ),
            ),
            Container(
              margin:  EdgeInsets.only(top: 70,bottom: 60),
              height: 60,
              child: ButtonTheme(
                minWidth: 300,
                child: Container(
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(color: Coloring.mainColor)),
                    onPressed: () async {
                        String test = '${Global.host}/backendapimaster/public/api/login';
                        print(test);
                        final response = await http
                            .post(Uri.parse('${Global.host}/backendapimaster/public/api/login'), headers: {
                          'Content-Type': 'application/json'
                        }, body: jsonEncode(<String, String>{
                                "nik": Global.nik,
                                "password": Global.password
                              })).then((value) async
                        {
                          print(value.body);
                          print(value.request);
                          print(value.statusCode);
                          var res = jsonDecode(value.body);
                          if (res['status'] == "success") {
                            print(value.body);
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            await prefs.setString('token', res['content']['access_token']);
                            _dialogSuccessAlert();
                          } else {
                            print(value.body);
                              _dialogFailedAlert();
                          }
                        });

                      // _dialogSuccessAlert();
                    },
                    color: Coloring.mainColor,
                    textColor: Colors.white,
                    child: Text("Get Started",
                        style: TextStyle(color: Colors.white, fontFamily: Fonts.BOLD,fontSize: 18)),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Text('Belum mempunyai akun?  ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xff9F9F9F),
                          fontSize: 18,
                          fontFamily: Fonts.REGULAR,
                      ) ),
                ),
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Text(' SignUp',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Coloring.secondColor,
                        fontSize: 18,
                        fontFamily: Fonts.BOLD,
                      ) ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> _dialogFailedAlert() async {
    return showModalBottomSheet<void>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height / 2  ,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: const Text('User tidak ditemukan!',
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
                  child: const Text('Pastikan NIK Anda terdaftar di sistem, hubungi atasan Anda'
                      ' untuk mendapatkan Akses!',
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
      },
    );
  }

  Future<void> _dialogSuccessAlert() async {
    return showModalBottomSheet<void>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height / 2  ,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: const Text('Berhasil login!',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontFamily: Fonts.BOLD,fontSize: 18)),
                ),
                Icon(
                  Icons.check_circle_outline,
                  color: Coloring.mainColor,
                  size: 100.0,
                ),
                Container(
                  margin:  EdgeInsets.only(top: 20),
                  height: 60,
                  child: ButtonTheme(
                    minWidth: 300,
                    child: Container(
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: BorderSide(color: Coloring.mainColor)),
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => homeDashboard()),(route)=>false);
                        },
                        color: Coloring.mainColor,
                        textColor: Colors.white,
                        child: Text("Oke",
                            style: TextStyle(color: Colors.white, fontFamily: Fonts.BOLD,fontSize: 18)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }


}
