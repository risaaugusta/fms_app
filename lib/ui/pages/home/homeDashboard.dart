part of '../pages.dart';

class homeDashboard extends StatefulWidget {
  const homeDashboard({Key? key}) : super(key: key);

  @override
  _homeDashboardState createState() => _homeDashboardState();
}

class _homeDashboardState extends State<homeDashboard> {
  int _selectedIndex = 0;
  int? duration;
  String? token;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> screens = [Home(), searchBar(), Login(), ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget _currentScreen = Login();

  List<Widget> _widgetOptions = <Widget>[
    Home(),
    HomeManual(),
    homeNotifikasi(),
    Profile()
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getLocalStorage();

  }

  void getLocalStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    duration =  await prefs.getInt('duration');
    final today = DateTime.now().millisecondsSinceEpoch;
    if(today >= duration!){
      _dialogAlert();
    }
    print('HARI INI'+(today).toString());
    print('DURASINE '+duration.toString());
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  ScrollController _controller = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.white,
            appBar: _selectedIndex == 2
                ? AppBar(
                    leading: new IconButton(
                      icon: new Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => homeDashboard()),
                        );
                      },
                    ),
                    title: const Text('Notifikasi',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: Fonts.REGULAR,
                            fontSize: 18)),
                    backgroundColor: Colors.white,
                  ) : _selectedIndex == 3 ? AppBar(
                    leading: new IconButton(
                      icon: new Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => homeDashboard()),
                        );
                      },
                    ),
                    title: const Text('Profile Fuelman',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: Fonts.REGULAR,
                            fontSize: 18)),
                    backgroundColor: Colors.white,
            ) : null,
            body: ListView(
              physics: _selectedIndex == 1 ? NeverScrollableScrollPhysics() : AlwaysScrollableScrollPhysics(), // new
              controller: _controller,
              children: [
                _widgetOptions.elementAt(_selectedIndex),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.white,
              child: Icon(Icons.qr_code, color: Coloring.mainColor),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Scanner()),
                );
              },
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomAppBar(
              child: Container(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            setState(() {
                              // screens = searchBar();
                              _selectedIndex = 0;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.home,
                                color: _selectedIndex == 0
                                    ? Coloring.mainColor
                                    : Colors.grey,
                              ),
                              Text('Beranda',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: _selectedIndex == 0
                                          ? Coloring.mainColor
                                          : Colors.grey,
                                      fontFamily: Fonts.REGULAR,
                                      fontSize: 14)),
                            ],
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {
                            setState(() {
                              _selectedIndex = 1;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.article_rounded,
                                color: _selectedIndex == 1
                                    ? Coloring.mainColor
                                    : Colors.grey,
                              ),
                              Text('Sinkron',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: _selectedIndex == 1
                                          ? Coloring.mainColor
                                          : Colors.grey,
                                      fontFamily: Fonts.REGULAR,
                                      fontSize: 14)),
                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MaterialButton(
                          minWidth: 40,
                          onPressed: () {
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
                                color: _selectedIndex == 2
                                    ? Coloring.mainColor
                                    : Colors.grey,
                              ),
                              Text('Notifikasi',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: _selectedIndex == 2
                                          ? Coloring.mainColor
                                          : Colors.grey,
                                      fontFamily: Fonts.REGULAR,
                                      fontSize: 14)),
                            ],
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {
                            setState(() {
                              _selectedIndex = 3;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.account_circle,
                                color: _selectedIndex == 3
                                    ? Coloring.mainColor
                                    : Colors.grey,
                              ),
                              Text('Profil',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: _selectedIndex == 3
                                          ? Coloring.mainColor
                                          : Colors.grey,
                                      fontFamily: Fonts.REGULAR,
                                      fontSize: 14)),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
            ));
  }
  ///pop up status
  Future<void> _dialogAlert() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Oops!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("Sesi Anda berakhir. Silakan login kembali."),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Oke'),
              onPressed: () {
                // Navigator.pop(context);
                LoadingBar.dialogLoading(context);
                ApiService.logout().then((value) async {
                  Global.clearStorage();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),(route)=>false);
                }).onError((error, stackTrace) => null);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => Login()),
                // );
              },
            ),
          ],
        );
      },
    );
  }
}


