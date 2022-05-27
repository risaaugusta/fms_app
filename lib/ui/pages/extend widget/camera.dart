part of '../pages.dart';

// A screen that allows users to take a picture using a given camera.
class TakePictureScreen extends StatefulWidget {
  final StringCallback callback;
  final Future<CameraDescription> camera;
  const TakePictureScreen({
    Key? key,
    required this.camera, required this.callback
  }) : super(key: key);


  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  String? imagePath;
  late CameraController _controller;
  Future<void>? _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    widget.camera.then((value) {
     initCamera(value);
    });
  }

  initCamera(CameraDescription value){
    setState(() {
      _controller = CameraController(
        // Get a specific camera from the list of available cameras.
        value,
        // Define the resolution to use.
        ResolutionPreset.high,
      );

      _initializeControllerFuture = _controller.initialize();
      // _initializeControllerFuture = _controller.initialize().then((_) { if (!mounted) { return; } setState(() {}); });
    });
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    // _controller.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _initializeControllerFuture == null ?
      Container(
        color: Colors.yellow,
      ) :
      FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            // return CameraPreview(_controller);
            return CameraPreview(_controller);
          } else {
            // Otherwise, display a loading indicator.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Coloring.mainColor,
        // Provide an onPressed callback.
        onPressed: () async {
          // Take the Picture in a try / catch block. If anything goes wrong,
          // catch the error.
          // if(_initializeControllerFuture == null) return;
          try {
            print("INITIAL" + _initializeControllerFuture.toString());
            await _initializeControllerFuture;
            print("CONTROLLER"+ _controller.toString());
            print("INITIAL==" + _initializeControllerFuture.toString());
            final image = await _controller.takePicture();
            print("TAKE PICT"+ image.toString());
            Navigator.of(context).pop(image.path);

            // If the picture was taken, display it on a new screen.
            // await Navigator.of(context).pushReplacement(
            //   MaterialPageRoute(
            //     builder: (context) => DisplayPictureScreen(
            //       // Pass the automatically generated path to
            //       // the DisplayPictureScreen widget.
            //       imagePath: image.path,
            //     ),
            //   ),
            // );

          } catch (e) {
            // If an error occurs, log the error to the console.
            print('CAMERA $e');
          }

        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}

// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;
  // File? image;
  const DisplayPictureScreen({Key? key, required this.imagePath})
      : super(key: key);

  // Future pickImage() async{
  //   try{
  //     final image
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Column(
        children: [
          Image.file(File(imagePath),
            width: MediaQuery.of(context).size.width,
            height: 200,
            fit: BoxFit.cover
          ),
        ],
      ),
    );
  }

  // Future<void> testing() async {
  //   // Ensure that plugin services are initialized so that `availableCameras()`
  //   // can be called before `runApp()`
  //   WidgetsFlutterBinding.ensureInitialized();
  //
  //   final cameras = await availableCameras();
  //   final firstCamera = cameras.first;
  //
  //   runApp(
  //     MaterialApp(
  //       theme: ThemeData.dark(),
  //       home: TakePictureScreen(
  //         // Pass the appropriate camera to the TakePictureScreen widget.
  //         camera: firstCamera,
  //       ),
  //     ),
  //   );
  // }

}



