part of '../pages.dart';

class Component {
  const Component({
    required this.title,
    required this.onTap,
  });

  final String title;
  final Function onTap;

  @override
  String toString() {
    return '$title';
  }
}


class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  final TextEditingController controller = TextEditingController();
  List<Component> _kOptions = <Component>[
    // Component(
    //     title: 'OB Removal Hourly Produksi OB Perjam',
    //     onTap: () => Navigator.pushAndRemoveUntil(
    //         context,
    //         MaterialPageRoute(builder: (context) => Profile()),(route)=>false)),
    // Component(
    //     title: 'OB Removal Hourly Produksi OB Setiap Bulan',
    //     onTap: () => Navigator.pushAndRemoveUntil(
    //         context,
    //         MaterialPageRoute(builder: (context) => Profile()),(route)=>false)),
    // Component(
    //     title: 'Ini Menu Test',
    //     onTap: () => Navigator.pushAndRemoveUntil(
    //         context,
    //         MaterialPageRoute(builder: (context) => Profile()),(route)=>false)),
    // Component(
    //     title: 'Ini Menu Test Faisal',
    //     onTap: () => Navigator.pushAndRemoveUntil(
    //         context,
    //         MaterialPageRoute(builder: (context) => Profile()),(route)=>false))
  ];
  var items = [];
  // final List<Search> _kOptions = controllerAplikasi.searchList.value;
  @override
  void initState() {
    super.initState();
    this.initializeSearchData();
  }

  @override
  Widget build(BuildContext context) {

    var search = '';

    var searchList = <Component>[];

    return Column(
      children: [
        Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Autocomplete<Component>(
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text == '') {
                  return List.empty();
                }
                // print("=================");
                // print(textEditingValue.text);
                return _kOptions
                    .where((list) => list.title
                    .toLowerCase()
                    .contains(textEditingValue.text.toLowerCase()))
                    .toList();
                // return _kOptions.where((String option) {
                //   return option
                //       .contains(textEditingValue.text.toLowerCase());
                // });
              },
              fieldViewBuilder: (BuildContext context,
                  TextEditingController fieldTextEditingController,
                  FocusNode fieldFocusNode,
                  VoidCallback onFieldSubmitted) {
                // return TextField(
                //   controller: fieldTextEditingController,
                //   focusNode: fieldFocusNode,
                //   style: const TextStyle(fontWeight: FontWeight.bold),
                // );
                return TextFormField(
                  controller: fieldTextEditingController,
                  focusNode: fieldFocusNode,
                  autofocus: false,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Color(0xffEFEFEF),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Color(0xffEFEFEF),
                          ),
                        ),
                        hintText: "Cari refueling...",
                        fillColor: Color(0xffEFEFEF),
                        filled: true,
                        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      ),
                  onChanged: (text) {
                    search = text;
                  },
                );
              },
              onSelected: (Component selection) => selection.onTap(),
              optionsViewBuilder: (BuildContext context,
                  AutocompleteOnSelected<Component> onSelected,
                  Iterable options) {
                return Align(
                    alignment: Alignment.topLeft,
                    child: Material(
                      child: Container(
                        width: 300,
                        height: MediaQuery.of(context).size.height/3,
                        color: Coloring.mainColor,
                        child: ListView.builder(
                          padding: EdgeInsets.all(10.0),
                          itemCount: options.length,
                          itemBuilder: (BuildContext context, int index) {
                            final option = options.elementAt(index);

                            return GestureDetector(
                              onTap: () {
                                onSelected(option);
                              },
                              child: ListTile(
                                title: Text(option.toString(),
                                    style: const TextStyle(
                                        color: Colors.white)),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
              },
            )),

        // Container(
        //   margin: EdgeInsets.all(10),
        //   child: TextFormField(
        //     autofocus: false,
        //     decoration: InputDecoration(
        //       prefixIcon: Icon(Icons.search),
        //       enabledBorder: OutlineInputBorder(
        //         borderRadius: BorderRadius.circular(20),
        //         borderSide: BorderSide(
        //           color: Color(0xffEFEFEF),
        //         ),
        //       ),
        //       border: OutlineInputBorder(
        //         borderRadius: BorderRadius.circular(20),
        //         borderSide: BorderSide(
        //           color: Color(0xffEFEFEF),
        //         ),
        //       ),
        //       // hintText: 'Cari..',
        //       fillColor: Color(0xffEFEFEF),
        //       filled: true,
        //       contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        //     ),
        //     onChanged: searchData,
        //   )
        // ),
        // FutureBuilder<List>(
        //   future: FmsDatabase.instance.readHistoryRefueling(), // a previously-obtained Future<String> or null
        //   builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        //     List<Widget> children;
        //     if (snapshot.hasData) {
        //       return ListView.builder(
        //           scrollDirection: Axis.vertical,
        //           shrinkWrap: true,
        //           padding: const EdgeInsets.all(8),
        //           itemCount: snapshot.data!.length ,
        //           itemBuilder: (BuildContext context, int index) {
        //             return Card(
        //               elevation: 0.8,
        //               shadowColor: Colors.grey,
        //               shape: RoundedRectangleBorder(
        //                 borderRadius: BorderRadius.circular(10),
        //               ),
        //               child: InkWell(
        //                   onTap: () {
        //                     Navigator.push(
        //                         context,
        //                         MaterialPageRoute(
        //                             builder: (context) => DetailHistoryTransaksi(index:index))
        //                     );
        //                   },
        //                   child:
        //                       Column(
        //                         mainAxisAlignment: MainAxisAlignment.start,
        //                         crossAxisAlignment: CrossAxisAlignment.start,
        //                         children: [
        //                           Text(snapshot.data![index]['unit_code'],
        //                               textAlign: TextAlign.left,
        //                               style: TextStyle(
        //                                   color: Colors.black,
        //                                   fontFamily: Fonts.REGULAR,
        //                                   fontSize: 18)),
        //                           Text(snapshot.data![index]['fuel_consumption'].toString() + ' L',
        //                               textAlign: TextAlign.center,
        //                               style: TextStyle(
        //                                   color: Colors.grey,
        //                                   fontFamily: Fonts.REGULAR,
        //                                   fontSize: 12)),
        //                           Text(snapshot.data![index]['created_at'],
        //                               textAlign: TextAlign.center,
        //                               style: TextStyle(
        //                                   color: Colors.grey,
        //                                   fontFamily: Fonts.REGULAR,
        //                                   fontSize: 12)),
        //                         ],
        //                       )
        //               ),
        //             );
        //           });
        //     } else if (snapshot.hasError) {
        //       return Container(
        //         child: Text('Tidak ada data'),
        //       );
        //     } else {
        //       return Text('Tidak ada data');
        //     }
        //   },
        // ),
        // Container(
        //   height: 80,
        //   decoration: BoxDecoration(
        //     border: Border.all(
        //       color: Colors.black,
        //
        //     )
        //   ),
        // )
      ],
    );
  }

  void initializeSearchData() async {
    // // List<Map> data = FmsDatabase.instance.readHistoryRefueling();
    // var data = await Global.getSuggestion();
    // print("=== $data");
    // final suggestions = data.where((element) {
    //   final unitCode = element['unit_code'].toLowerCase();
    //   final input = query.toLowerCase();
    //   return unitCode.contains(input);
    // }).toList();
    //
    // setState(() {
    //   items = suggestions;
    // });
    var data = await FmsDatabase.instance.readHistoryRefueling();
    var computed = <Component>[];
    data.map((e){
      computed.add(Component(title: e['unit_code'],
          onTap: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => homeTransaksi()), (
                route) => false);
          }
      ));
    }).toList();

    setState(() {
      _kOptions = computed;
    });

  }

}


