part of '../pages.dart';

class SignaturePad extends StatefulWidget {
  const SignaturePad({Key? key}) : super(key: key);

  @override
  _SignaturePadState createState() => _SignaturePadState();
}

class _SignaturePadState extends State<SignaturePad> {
  late SignatureController controller;

  @override
  initState()
  {
    super.initState();
    controller = SignatureController(
      penStrokeWidth: 3,
      penColor: Colors.black
    );
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/3,
      child: Column(
        children: [
          Signature(
            controller: controller,
            backgroundColor: Colors.grey.shade200,
            height: MediaQuery.of(context).size.height/4,
          ),
          BuildButtons(context)
        ],
      ),
    );
  }
  Widget BuildButtons(BuildContext context) => Container(
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildCheck(context),
          buildClear()
        ],
      )
  );

  Widget buildCheck(BuildContext context)=> IconButton(
    iconSize: 24,
    icon: Icon(Icons.check,color: Coloring.mainColor),
    onPressed: ()async{
      if(controller.isNotEmpty){
         final signature = await exportSignature();
         await Navigator.of(context).push(MaterialPageRoute(
           builder: (context) =>  SignaturePreview(signature:signature),
         ));
      }
    },
  );

  Widget buildClear() => IconButton(
    iconSize: 24,
    icon: Icon(Icons.clear,color: Coloring.mainColor),
    onPressed: () => controller.clear(),
  );

  Future<Uint8List?> exportSignature() async {
    final exportController = SignatureController(
      penStrokeWidth: 2,
      penColor: Colors.black,
      exportBackgroundColor: Colors.white,
      points: controller.points
    );

    final signature = await exportController.toPngBytes();
    exportController.dispose();

    return signature;
  }
}

class SignaturePreview extends StatelessWidget {
  var signature;
  SignaturePreview({Key? key, required this.signature}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.memory(signature)
    );
  }
}

