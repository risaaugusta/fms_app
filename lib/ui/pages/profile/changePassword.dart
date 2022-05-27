part of '../pages.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key,  this.apiService}) : super(key: key);
  final ApiService? apiService;
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  int _selectedIndex = 0;
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
  ScrollController _controller = new ScrollController();
  List<Widget> _widgetOptions = <Widget>[
    homeLansiran(),
    HomeManual(),
    homeNotifikasi(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _selectedIndex == 0
            ? AppBar(
              leading: new IconButton(
                icon: new Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => homeDashboard()),
                  );
            },
          ),
                title: const Text('Ubah Password',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: Fonts.REGULAR,
                        fontSize: 18)),
                backgroundColor: Colors.white,
              ) :
        _selectedIndex == 1
            ? AppBar(
                leading: new IconButton(
                  icon: new Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeManual()),
                    );
                  },
                ),
                title: const Text('Synchronize',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: Fonts.REGULAR,
                        fontSize: 18)),
                backgroundColor: Colors.white,
        ) :
        _selectedIndex == 2
            ? AppBar(
              leading: new IconButton(
                icon: new Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => homeNotifikasi()),
                  );
                },
              ),
              title: const Text('Notifikasi',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: Fonts.REGULAR,
                      fontSize: 18)),
              backgroundColor: Colors.white,
            ) :
        _selectedIndex == 3
            ? AppBar(
              leading: new IconButton(
                icon: new Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profile()),
                  );
                },
              ),
              title: const Text('Profil',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: Fonts.REGULAR,
                      fontSize: 18)),
              backgroundColor: Colors.white,
        )
            : null,
        body: _selectedIndex == 0
            ? SingleChildScrollView(
                child: Form(
                  key: _form,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left:30, top: 20),
                        child: Text(
                            'Password lama',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.black,
                                fontFamily: Fonts.REGULAR,fontSize: 16)
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal:20, vertical: 20),
                        decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                        child: TextFormField(
                          autofocus: false,
                          obscureText: true,
                          controller: _currentPass,
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
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          ),
                          onChanged: (value)=> {
                            UpdatePassword.current_password = value
                          }, //dummy value
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left:30,bottom: 20),
                        child: Text(
                            'Password baru',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.black,
                                fontFamily: Fonts.REGULAR,fontSize: 16)
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal:20),
                        decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                        child: TextFormField(
                          autofocus: false,
                          obscureText: true,
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
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          ),
                          controller: _newPass,
                          onChanged: (value)=> {
                            UpdatePassword.new_password = value
                          }, //dummy value
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left:30, top: 20),
                        child: Text(
                            'Konfirmasi password baru',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.black,
                                fontFamily: Fonts.REGULAR,fontSize: 16)
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal:20, vertical: 20),
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
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                              onPressed: _toggle,
                            ),
                          ),
                          controller: _confirmPass,
                          validator: (val){
                            if(val != _newPass.text){
                              return 'Password tidak cocok!';
                            }else{
                              return null;
                            }
                          },
                          obscureText: _obscureText,
                          onChanged: (value)=> {
                            UpdatePassword.password_confirmation = value
                          }, //dummy value
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        child: Divider(
                          color: Color(0xffF5F5F5),
                          thickness: 30,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        height: 50,
                        child: ButtonTheme(
                          minWidth: MediaQuery.of(context).size.width,
                          child: Container(
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  side: BorderSide(color: Coloring.mainColor)),
                              onPressed: () async {
                                if(_form.currentState!.validate()){
                                  widget.apiService!.changePassword_(_currentPass.text, _newPass.text, _confirmPass.text).then((value) {
                                    setState(() {
                                      _dialogAlert();
                                    });
                                  });
                                }else{
                                  print('Periksa jaringan!');
                                }
                              },
                              color: Coloring.mainColor,
                              textColor: Colors.white,
                              child: Text("Kirim",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: Fonts.REGULAR,
                                      fontSize: 18)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
              : ListView(
                physics: const AlwaysScrollableScrollPhysics(), // new
                controller: _controller,
                children: [
                  _selectedIndex == 0 ? searchBar() : Text(''),
                  _widgetOptions.elementAt(_selectedIndex),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  minWidth:40,
                  onPressed: (){
                    Navigator.pop(
                      context,
                      MaterialPageRoute(builder: (context) => homeDashboard()),);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home,
                        color: _selectedIndex == 0 ? Coloring.mainColor : Colors.grey,
                      ),
                      Text(
                          'Home',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: _selectedIndex == 0 ? Coloring.mainColor : Colors.grey,
                              fontFamily: Fonts.REGULAR,fontSize: 14)
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: (){
                    setState(() {
                      _selectedIndex = 1;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.article_rounded,
                        color: _selectedIndex == 1 ? Coloring.mainColor : Colors.grey,
                      ),
                      Text(
                          'Sync',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: _selectedIndex == 1 ? Coloring.mainColor : Colors.grey,
                              fontFamily: Fonts.REGULAR,fontSize: 14)
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth:40,
                  onPressed: (){
                    setState(() {
                      // screens = searchBar();
                      _selectedIndex = 2;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.notifications,
                        color: _selectedIndex == 2 ? Coloring.mainColor : Colors.grey,
                      ),
                      Text(
                          'Notifikasi',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: _selectedIndex == 2 ? Coloring.mainColor : Colors.grey,
                              fontFamily: Fonts.REGULAR,fontSize: 14)
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: (){
                    setState(() {
                      _selectedIndex = 3;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.account_circle,
                        color: _selectedIndex == 3 ? Coloring.mainColor : Colors.grey,
                      ),
                      Text(
                          'Profil',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: _selectedIndex == 3 ? Coloring.mainColor : Colors.grey,
                              fontFamily: Fonts.REGULAR,fontSize: 14)
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  ///pop up status
  Future<void> _dialogAlert() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Info!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(widget.apiService!.msg!),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Oke'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
