part of '../pages.dart';

class TestingDetail extends StatefulWidget {
  final int lansiranId;

  const TestingDetail({
    Key? key,
    required this.lansiranId,
  }) : super(key:key);

  @override
  _TestingDetailState createState() => _TestingDetailState();
}

class _TestingDetailState extends State<TestingDetail> {
  late Lansiran? lansiran;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    refreshLansiran();
  }


  Future refreshLansiran() async {
    setState(() => isLoading = true);
    // this.lansiran = await FmsDatabase.instance.readLansiran(widget.lansiranId);
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}

