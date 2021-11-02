part of'../pages.dart';
typedef void StringCallback(String val);

// class DropDownDemo extends StatefulWidget {
//   final StringCallback? callback;
//   DropDownDemo({this.callback});
//
//   @override
//   _DropDownDemoState createState() => _DropDownDemoState();
// }
//
// class _DropDownDemoState extends State<DropDownDemo> {
//
//   String dropdownvalue = 'Storage 1';
//   var items =  ['Storage 1','Storage 2','Storage 3','Storage 4','Storage 5'];
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         margin: EdgeInsets.symmetric(horizontal: 15),
//         child:
//               DropdownButton(
//                 value: dropdownvalue,
//                 icon: Icon(Icons.keyboard_arrow_down),
//                 items:items.map((String items) {
//                   return DropdownMenuItem(
//                       value: items,
//                       child: Text(items)
//                   );
//                 }
//                 ).toList(),
//
//                 onChanged: (newValue){
//                   setState(() {
//                     // dropdownvalue = '$newValue';
//                     homeLansiran();
//                     print(newValue);
//                   });
//                 },
//
//               ),
//       );
//   }
// }

class StorageDropdown extends StatelessWidget {
  final StringCallback? callback;
  StorageDropdown({Key? key, this.callback}) : super(key: key);
  String dropdownvalue = 'Storage 1';
  var items =  ['Storage 1','Storage 2','Storage 3','Storage 4','Storage 5'];
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
