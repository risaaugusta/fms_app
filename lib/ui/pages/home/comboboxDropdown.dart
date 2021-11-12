part of'../pages.dart';
typedef void StringCallback(String val);

class StorageDropdown extends StatelessWidget {
  final StringCallback? callback;
  StorageDropdown({Key? key, this.callback}) : super(key: key);
  String dropdownvalue = 'Storage 1';
  var items =  ['Storage 1','Storage 2','Storage 3','Storage 4','Storage 5'];
  MsStorage? msStorage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child:
      DropdownButton(
        value: dropdownvalue,
        icon: Icon(Icons.keyboard_arrow_down),
        items:items.map((String items) {
          return DropdownMenuItem(
              value: items,
              // value: FmsDatabase.instance.findObjects($MsStorageFields.storageCode),
              child: Text(items)
          );
        }
        ).toList(),

        onChanged: (newValue){
         callback!('${newValue}');
        },
      ),
    );
  }
}
