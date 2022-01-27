part of'../pages.dart';
typedef void StringCallback(String val);

class StorageDropdown extends StatefulWidget {
  final StringCallback? callback;
  const StorageDropdown({Key? key, this.callback}) : super(key: key);

  @override
  _StorageDropdownState createState() => _StorageDropdownState();
}

class _StorageDropdownState extends State<StorageDropdown> {
  late final StringCallback? callback;
  // _StorageDropdownState({Key? key, this.callback}) : super(key: key);
  // String dropdownvalue = 'AMO';
  List<String> items =  [];
  MsStorage? msStorage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ApiService().fetchStorage().then((value) {
      // items
      // print("halo");
      // print(value);
      List<String> dataComputed = [];
      value.map((e) {
        // print(e['auth_group']);
        dataComputed.add(e['auth_group']);
      }).toList();
      setState(() {
        items = dataComputed;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child:
      // FutureBuilder<List>(
      //   future: FmsDatabase.instance.readStorage(), // a previously-obtained Future<String> or null
      //   builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
      //     List<Widget> children;
      //     if (snapshot.hasData) {
      //       return ListView.builder(
      //           scrollDirection: Axis.vertical,
      //           shrinkWrap: true,
      //           padding: const EdgeInsets.all(8),
      //           itemCount: snapshot.data!.length < 1 ? snapshot.data!.length : 1,
      //           itemBuilder: (BuildContext context, int index) {
      //             return DropdownButton(
      //               value: dropdownvalue,
      //               icon: Icon(Icons.keyboard_arrow_down),
      //               items:items.map((String items) {
      //                 return DropdownMenuItem(
      //                     value: items,
      //                     // value: FmsDatabase.instance.findObjects($MsStorageFields.storageCode),
      //                     // child:   Text(snapshot.data![index]['siteID'].toString(),
      //                     child:   Text(snapshot.data![index]['siteID'].toString(),
      //                         textAlign: TextAlign.center,
      //                         style: TextStyle(
      //                             color: Colors.grey,
      //                             fontFamily: Fonts.REGULAR,
      //                             fontSize: 12)),
      //                 );
      //               }
      //               ).toList(),
      //
      //               onChanged: (newValue){
      //                callback!('${newValue}');
      //               },
      //             );
      //           });
      //     } else if (snapshot.hasError) {
      //       return Container(
      //         child: Text('Tidak ada data'),
      //       );
      //     } else {
      //       return Container();
      //     }
      //   },
      // ),
      DropdownButton(
        // value: '',
        icon: Icon(Icons.keyboard_arrow_down),
        items: items.map((String items) {
          return DropdownMenuItem(
              value: items,
              child: Text(items)
          );
        }
        ).toList(),
        onChanged: (newValue){
          callback!('$newValue');
        },
      ),
    );
  }
}


