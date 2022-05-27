part of '../pages.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text('Lupa Password',
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
                    hintText: 'Email',
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  ),
                  onChanged: (value) {
                    Global.email = value;
                  },
                ),
              ),
            ),
            Container(
              margin:  EdgeInsets.symmetric(vertical: 50),
              height: 60,
              child: ButtonTheme(
                minWidth: 300,
                child: Container(
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(color: Coloring.mainColor)),
                    onPressed: () async {
                      LoadingBar.dialogLoading(context);
                      final response = await http
                          .post(Uri.parse('${Global.host}/backend-laravel-api/public/api/password/email'), body: {
                        "email": Global.email,
                      }).then((value) async
                      {
                        var res = jsonDecode(value.body);
                        if (res['status'] == "success") {
                          LoadingBar.hideLoadingDialog(context);
                          _dialogSuccessAlert();
                        }
                        else {
                          _dialogFailed();
                        }
                      });
                    },
                    color: Coloring.mainColor,
                    textColor: Colors.white,
                    child: Text("Kirim kode verifikasi",
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

  ///alert failed email
  Future<void> _dialogFailed() async {
    return showModalBottomSheet<void>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height / 1.5  ,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: const Text('Email tidak terdaftar!',
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
                  child: const Text('Pastikan email Anda terdaftar di sistem, hubungi atasan Anda'
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
                        onPressed: () {
                          LoadingBar.hideLoadingDialog(context);
                          Navigator.pop(context);
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
                  child: const Text('Kode berhasil terkirim!',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontFamily: Fonts.BOLD,fontSize: 18)),
                ),
                Icon(
                  Icons.check_circle_outline,
                  color: Coloring.mainColor,
                  size: 100.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: const Text('Silakan periksa pada email Anda!',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontFamily: Fonts.REGULAR,fontSize: 14)),
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
                              MaterialPageRoute(builder: (context) => Verification()),(route)=>false);
                        },
                        color: Coloring.mainColor,
                        textColor: Colors.white,
                        child: Text("Lanjut",
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
