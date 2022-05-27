part of '../pages.dart';

class ShiftDropdown extends StatefulWidget {
  final Function(MsShift)? callback;
  const ShiftDropdown({Key? key, this.callback}) : super(key: key);

  @override
  _ShiftDropdownState createState() => _ShiftDropdownState();
}

class _ShiftDropdownState extends State<ShiftDropdown> {
  int? dropdownvalue;
  List<MsShift> items =  [];
  MsShift? msShift;

  @override
  void initState() {
    super.initState();
    setState(() {
      this.valueShift();
    });
  }

  @override
  void valueShift() async {
    this.items  = await  FmsDatabase.instance.readShift();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child:
      DropdownButton(
        value: dropdownvalue,
        icon: Icon(Icons.keyboard_arrow_down),
        items: items.map((value) {
          return DropdownMenuItem(
              value: value.ShiftId,
              child: Text(value.ShiftName + " (" +value.ShiftStartTime + " - " + value.ShiftEndTime+") ")
          );
        }
        ).toList(),
        onChanged: (newValue){
          setState(() {
            msShift = items.where((element) => element.ShiftId == newValue).toList()[0];
            dropdownvalue = msShift!.ShiftId ;
          });
          widget.callback!(msShift!);
        },
      ),
    );
  }
}

///testing
//DropdownButton(
//         value: dropdownvalue,
//         icon: Icon(Icons.keyboard_arrow_down),
//         items: items.map(( dynamic item) {
//           print('=== ITEMS' + item);
//           return DropdownMenuItem(
//               value: (item['shift_id']).toString(),
//               child: Text(item['ShiftName'].toString())
//           );
//         }
//         ).toList(),
//         onChanged: (newValue){
//           // setState(() {
//           //   dropdownvalue = newValue as String;
//           // });
//           // widget.callback!(newValue as String);
//         },
//       ),