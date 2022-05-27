part of '../pages.dart';

class Verification extends StatefulWidget {
  const Verification({Key? key}) : super(key: key);

  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  bool _obscureText = true;
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController _currentPass = TextEditingController();
  final TextEditingController _newPass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
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
              child: Text('Verifikasi',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: Fonts.BOLD
                  ) ),
            ),
            Form(
              key: _form,
              child: Column(
                children: [
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
                          hintText: 'Masukkan kode',
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        ),
                        onChanged: (value) {
                          Global.kode = value;
                        },
                      ),
                    ),
                  ),
                  Container(
                    width: 300,
                    decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    margin: EdgeInsets.only(top: 30),
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
                          hintText: 'Password baru',
                          fillColor: Colors.white,
                          filled: true,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: _toggle,
                          ),
                          // contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        ),
                        controller: _confirmPass,
                        validator: (val){
                          if(val!.length < 8){
                            return 'Panjang karakter minimal 8!';
                          }else{
                            return null;
                          }
                        },
                        obscureText: _obscureText,
                        onChanged: (value)=> {
                          UpdatePassword.new_password = value
                        },
                      ),
                    ),
                  ),
                ],
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin:  EdgeInsets.symmetric(vertical: 50),
                  height: 40,
                  child: ButtonTheme(
                    minWidth: 130,
                    child: Container(
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: BorderSide(color: Coloring.mainColor)),
                        onPressed: () async {
                          LoadingBar.dialogLoading(context);
                          final response = await http
                              .post(Uri.parse('${Global.host}/backend-laravel-api/public/api/password/reset'), body: {
                            "code": Global.kode,
                            "new_password": UpdatePassword.new_password,
                          }).then((value) async
                          {
                            var res = jsonDecode(value.body);
                            if (res['status'] == "success" && _form.currentState!.validate()) {
                              LoadingBar.hideLoadingDialog(context);
                              _dialogSuccessAlert();
                            }else if(res['status'] == "failed" && res['message'] == "Code is expired"){
                              _dialogExpired();
                            }
                            else {
                              _dialogWrong();
                            }
                          });
                        },
                        color: Coloring.mainColor,
                        textColor: Colors.white,
                        child: Text("Simpan",
                            style: TextStyle(color: Colors.white, fontFamily: Fonts.BOLD,fontSize: 16)),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin:  EdgeInsets.symmetric(vertical: 50),
                  height: 40,
                  child: ButtonTheme(
                    minWidth: 130,
                    child: Container(
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: BorderSide(color: Coloring.secondaryColor)),
                        onPressed: () async {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),(route)=>false);
                        },
                        color: Coloring.secondaryColor,
                        textColor: Colors.white,
                        child: Text("Kembali",
                            style: TextStyle(color: Coloring.mainColor, fontFamily: Fonts.BOLD,fontSize: 16)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  ///alert wrong code
  Future<void> _dialogWrong() async {
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
                  child: const Text('Kode tidak valid!',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontFamily: Fonts.BOLD,fontSize: 18)),
                ),
                Icon(
                  Icons.announcement,
                  color: Coloring.secondColor,
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: const Text('Periksa kembali kode Anda,'
                      ' kemudian coba lagi!',
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

  ///alert expired code
  Future<void> _dialogExpired() async {
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
                  child: const Text('Kode kedaluwarsa!',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontFamily: Fonts.BOLD,fontSize: 18)),
                ),
                Icon(
                  Icons.announcement,
                  color: Coloring.secondColor,
                  size: 100.0,
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
                  child: const Text('Password berhasil diperbarui!',
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
                              MaterialPageRoute(builder: (context) => Login()),(route)=>false);
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
