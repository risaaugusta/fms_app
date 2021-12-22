part of '../pages.dart';

class UploaderDropdown extends StatefulWidget {
  final StringCallback? callback;
  UploaderDropdown({Key? key, this.callback}) : super(key: key);

  @override
  _UploaderDropdownState createState() => _UploaderDropdownState();
}

class _UploaderDropdownState extends State<UploaderDropdown> {
  File? file;
  String path = '';
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            ElevatedButton(
                onPressed:  ()async{
                  widget.callback!(await this.selectFile());
                },
                style: ElevatedButton.styleFrom(
                    primary: Coloring.mainColor),
                child: Text(
                  'Unggah foto',
                    style: TextStyle(color: Colors.white,
                        fontFamily: Fonts.REGULAR,fontSize: 12)
                )),
            this.path != '' ? Image.file(File(this.path)) : Container()
          ],
        ));
  }

  ///upload foto
  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    print(result);

    if(result == null) return;
    final resPath = result.files.single.path!;


    file = File(resPath);
    String basename = filePath.basename(file!.path);

    // getting a directory path for saving
    Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();
    String appDocumentsPath = appDocumentsDirectory.path;

    // copy the file to a new path
    final File newImage = await file!.copy('$appDocumentsPath/$basename');
    this.path= '$appDocumentsPath/$basename';
    return '$appDocumentsPath/$basename';
  }
}

