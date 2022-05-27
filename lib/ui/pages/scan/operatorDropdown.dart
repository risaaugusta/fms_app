part of '../pages.dart';

class OperatorDropdown extends StatefulWidget {
  final StringCallback? callback;
  const OperatorDropdown({Key? key, this.callback}) : super(key: key);

  @override
  _OperatorDropdownState createState() => _OperatorDropdownState();
}

class _OperatorDropdownState extends State<OperatorDropdown> {
  var testing;
  final TextEditingController _controller = TextEditingController();
  String? dropdownvalue;
  List<String> items =  [];
  MsStorage? msStorage;

  @override
  void initState() {
    super.initState();
    setState(() {
      this.valueEmployee();
    });
  }

  @override
  valueEmployee() async {
     return await FmsDatabase.instance.readEmployee();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width/1.8,
        margin: EdgeInsets.only(top:15),
        decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(30)),
        child: TypeAheadField(
          direction: AxisDirection.up,
          textFieldConfiguration: TextFieldConfiguration(
              autofocus: true,
              controller: _controller,
              style: DefaultTextStyle.of(context).style.copyWith(
                  fontStyle: FontStyle.italic
              ),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: Colors.grey.shade200,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              fillColor: Color(0xffFFFFFF),
              filled: true,
              hintText: 'Cari nama operator...',
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            ),
          ),
          suggestionsCallback: (pattern) async {
            var data = await FmsDatabase.instance.readEmployee();
            final List<dynamic> operatorComputed = data.where((e) {
              if((e['EmployeeName'].toLowerCase()).contains(_controller.text.toLowerCase()) || (e['EmployeeID'].toString()).contains(_controller.text.toString()) ){
                return true;
              }else{
                return false;
            }
            }).toList();
            final List<dynamic> operator = operatorComputed.map((e) =>"${e['EmployeeID']} - ${e['EmployeeName']}" ).toList();
            return operator;
          },
          itemBuilder: (context, suggestion) {
            return ListTile(
              title: Text((suggestion).toString()),
            );
          },
          onSuggestionSelected: (suggestion) {
            setState(() {
             // testing = suggestion;
              _controller.text = suggestion.toString();
            });
            widget.callback!(suggestion as String);
          },
        )
      );
  }
}