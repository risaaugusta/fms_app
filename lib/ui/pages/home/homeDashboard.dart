part of '../pages.dart';

class homeDashboard extends StatefulWidget {
  const homeDashboard({Key? key}) : super(key: key);

  @override
  _homeDashboardState createState() => _homeDashboardState();
}

class _homeDashboardState extends State<homeDashboard> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> screens = [Home(), searchBar(), Login(), Auth()];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget _currentScreen = Login();

  List<Widget> _widgetOptions = <Widget>[
    Home(),
    HomeManual(),
    Text(
      'Index 2: Notifkasi',
      style: optionStyle,
    ),
    Profile()
  ];

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
            appBar: _selectedIndex == 3
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
                    title: const Text('Profile Fuelman',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: Fonts.REGULAR,
                            fontSize: 18)),
                    backgroundColor: Colors.white,
                  ) : null,
            body: ListView(
              physics: const AlwaysScrollableScrollPhysics(), // new
              controller: _controller,
              children: [
                _selectedIndex == 0 ? searchBar() : Text(''),
                _widgetOptions.elementAt(_selectedIndex),
              ],
            ),
            // body: PageStorage(
            //   child: _currentScreen,
            //   bucket: bucket,
            // ),
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
                              Text('Home',
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
                              Text('Sync',
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
}

/// Search Bar
class searchBar extends StatefulWidget {
  const searchBar({Key? key}) : super(key: key);

  @override
  _searchBarState createState() => _searchBarState();
}

class _searchBarState extends State<searchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
        autofocus: false,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Color(0xffEFEFEF),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Color(0xffEFEFEF),
            ),
          ),
          // hintText: 'NIK',
          fillColor: Color(0xffEFEFEF),
          filled: true,
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        ),
        onChanged: (value) {},
      ),
    );
  }
}
