part of '../pages.dart';

class HomeManual extends StatelessWidget {
  late final int index;
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

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
           Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed '
              'o eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad '
              'minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex '
              'ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit '
              'esse cillum dolore eu fugiat nulla pariatur. Excepteur '
              'sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt'
              ' mollit anim id est laborum. ',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: Fonts.REGULAR,
                  fontSize: 12)),
        ],
      )
    );
  }
}

