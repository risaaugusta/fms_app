part of '../pages.dart';

class SignaturePad extends StatefulWidget {
  final StringCallback? callback;
  var signature;
  SignaturePad({Key? key, required this.signature, this.callback}) : super(key: key);

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
          BuildButtons(context),
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
         // Container(
         //   child: SignaturePreview(signature:signature)
         // );
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
  final StringCallback? callback;
  var signature;
  SignaturePreview({Key? key, required this.signature,this.callback }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CloseButton(),
        title: Text('Simpan Gambar'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () async {
              var store = await storeSignature(context);
              store = json.encode(store);
              store = json.decode(store);
              print('=========');
              print(store['filePath']);
            },
          ),
          const SizedBox(width: 8)
        ],
      ),
      body: Image.memory(signature)
    );
  }

  Future storeSignature(BuildContext context) async{
    final status = await Permission.storage.status;
    if(!status.isGranted){
      await Permission.storage.request();
    }

    final time = formatDate(DateTime.now(), [yyyy, '/', mm, '/', dd, ' ', HH, ':', nn,':',ss]);
    final name = "approval_$time.png";

    final result = await ImageGallerySaver.saveImage(signature,name:name);
    final isSuccess = result['isSuccess'];

    if(isSuccess){
      Navigator.pop(context);
      // print(result.filePath);,
      return result;
      // Text('Berhasil simpan!');
      // SnackBar(
      //   content: const Text('Berhasil disimpan!'),
      //   action: SnackBarAction(
      //     label: 'Oke',
      //     onPressed: () {
      //       // Code to execute.
      //     },
      //   ),
      // );
    }else{
      Text('Gagal simpan');
      // SnackBar(
      //   content: const Text('Oops! Silakan ulangi'),
      //   action: SnackBarAction(
      //     label: 'Oke',
      //     onPressed: () {
      //       // Code to execute.
      //     },
      //   ),
      // );
    }

  }
}

