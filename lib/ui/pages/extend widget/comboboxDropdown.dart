part of'../pages.dart';
typedef void StringCallback(String val);

class StorageDropdown extends StatefulWidget {
  final StringCallback? callback;
  const StorageDropdown({Key? key, this.callback}) : super(key: key);

  @override
  _StorageDropdownState createState() => _StorageDropdownState();
}

class _StorageDropdownState extends State<StorageDropdown> {
  String? dropdownvalue;
  List<String> items =  [];
  MsStorage? msStorage;

  @override
  void initState() {
    super.initState();
    setState(() {
      this.valueStorage();
    });
  }

  @override
   void valueStorage() async {
    this.items  = (await  FmsDatabase.instance.readStorage()).map((e) => e['storageCode'] as String).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child:
      DropdownButton(
        value: dropdownvalue,
        icon: Icon(Icons.keyboard_arrow_down),
        items: items.map((String items) {
          return DropdownMenuItem(
              value: items,
              child: Text(items)
          );
        }
        ).toList(),
        onChanged: (newValue){
          setState(() {
            dropdownvalue = newValue as String;
          });
          widget.callback!(newValue as String);
        },
      ),
    );
  }
}


