part of '../pages.dart';

class homeTemplate extends StatefulWidget {
  const homeTemplate({Key? key}) : super(key: key);

  @override
  _homeTemplateState createState() => _homeTemplateState();
}

class _homeTemplateState extends State<homeTemplate> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    Home(),
    Text(
      'Index 1: Manual',
      style: optionStyle,
    ),
    Text(
      'Index 2: Notif',
      style: optionStyle,
    ),
    Text(
      'Index 3: Profile',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  ScrollController _controller = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.white,
              child: Image.asset("assets/img/scan.png"),
              onPressed: ()
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Scanner()),
                );
              },
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
                          minWidth:40,
                          onPressed: (){
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
                                  'Manual',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: _selectedIndex == 1 ? Coloring.mainColor : Colors.grey,
                                      fontFamily: Fonts.REGULAR,fontSize: 14)
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                    )
                  ],
                ),
              ),
            )

        );
  }
}
