part of '../pages.dart';


class TestingInsert extends StatefulWidget {
  const TestingInsert({Key? key}) : super(key: key);

  @override
  _TestingInsertState createState() => _TestingInsertState();
}

class _TestingInsertState extends State<TestingInsert> {
  late List<Lansiran> lansiran;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    refreshLansiran();
  }

  @override
  void dispose() {
    FmsDatabase.instance.close();
    super.dispose();
  }

  Future refreshLansiran() async {
    setState(() => isLoading = true);
    this.lansiran = await FmsDatabase.instance.readAllLansiran();
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          // Text( '${FmsDatabase.instance.readAllLansiran(lansiran)}'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.add),
        onPressed: () async{
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (context)=>Login())
          );
        },
      ),
    );
  }

}

