part of '../pages.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:  PopupMenuButton(
            icon: Icon(
              Icons.account_circle,
              color: Coloring.mainColor,
              size: 30,
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: MenuItems.firstItems,
                  child:  TextButton.icon(     // <-- TextButton
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChangePassword(apiService: ApiService(),)),
                      );
                    },
                    icon: Icon(
                      Icons.settings,
                      size: 14,
                      color: Colors.grey,
                    ),
                    label: Text('Ubah password',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: Fonts.REGULAR,
                            fontSize: 14)),
                  )
              ),
              PopupMenuItem(
                value: MenuItems.secondItems,
                child:  TextButton.icon(     // <-- TextButton
                  onPressed: () async {
                    _dialogAlert();
                  },
                  icon: Icon(
                    Icons.logout,
                    size: 14,
                    color: Colors.grey,
                  ),
                  label: Text('Logout',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: Fonts.REGULAR,
                          fontSize: 14)),
                )
              )
            ],
          ),
    );
  }

  ///pop up status
  Future<void> _dialogAlert() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Perhatian!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("Apakah Anda yakin ingin keluar aplikasi?"),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ya'),
              onPressed: () async{
                LoadingBar.dialogLoading(context);
                ApiService.logout().then((value) async {
                  Global.clearStorage();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),(route)=>false);
                  // LoadingBar.hideLoadingDialog(context);
                }).onError((error, stackTrace) => null);

                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => Login()),
                // );
              },

            ),
            TextButton(
              child: const Text('Tidak'),
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

class MenuItem {
  final String text;
  final IconData icon;

  const MenuItem({
    required this.text,
    required this.icon,
  });
}

class MenuItems {
  static const List<MenuItem> firstItems = [ settings];
  static const List<MenuItem> secondItems = [logout];

  static const settings = MenuItem(text: 'Ubah Password', icon: Icons.settings);
  static const logout = MenuItem(text: 'Log Out', icon: Icons.logout);

}
