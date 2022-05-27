part of '../pages.dart';

class DisplayCamera extends StatefulWidget {
  const DisplayCamera({Key? key,required this.camera}) : super(key: key);
  final Future<CameraDescription> camera;
  @override
  _DisplayCameraState createState() => _DisplayCameraState();
}

class _DisplayCameraState extends State<DisplayCamera> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    widget.camera.then((value) {
      _controller = CameraController(
        value,
        ResolutionPreset.high,
      );
      _initializeControllerFuture = _controller.initialize();
    });
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return CameraPreview(_controller);
  }
}
