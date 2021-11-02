part of '../pages.dart';

class UploaderDropdown extends StatefulWidget {
  const UploaderDropdown({Key? key}) : super(key: key);

  @override
  _UploaderDropdownState createState() => _UploaderDropdownState();
}

class _UploaderDropdownState extends State<UploaderDropdown> {
  File? file;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 50),
        child: ElevatedButton(
            onPressed: selectFile,
            style: ElevatedButton.styleFrom(
                primary: Colors.grey),
            child: Text(
              'Unggah foto',
                style: TextStyle(color: Colors.black,
                    fontFamily: Fonts.REGULAR,fontSize: 12)
            )));
  }

  ///upload foto
  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if(result == null) return;
    final path = result.files.single.path!;

    setState(() => file = File(path));
  }
}

