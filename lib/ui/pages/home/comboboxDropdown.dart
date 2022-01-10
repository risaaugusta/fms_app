part of'../pages.dart';
typedef void StringCallback(String val);

class StorageDropdown extends StatelessWidget {
  final StringCallback? callback;
  StorageDropdown({Key? key, this.callback}) : super(key: key);
  String dropdownvalue = 'AMO';
  var items =  ['AMO','DMI','DTA','KLU', 'SGU', 'PDU', 'PGA','SMI','SKA'];
  MsStorage? msStorage;

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
        value: dropdownvalue,
        icon: Icon(Icons.keyboard_arrow_down),
        items:items.map((String items) {
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
