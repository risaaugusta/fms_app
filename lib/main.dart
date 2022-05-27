import 'package:flutter/material.dart';
import 'package:fms_app/ui/pages/pages.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fms_app/bloc/blocs.dart';
import 'package:camera/camera.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final cameras = await availableCameras();
  final firstCamera = cameras.first;
  runApp(MyApp());

}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PageBloc()),
      ],
      child: MaterialApp(
          title: 'FMS App',
          debugShowCheckedModeBanner: false,
          home: Wrapper()),
    );

    // return MaterialApp(
    //   initialRoute: '/splash',
    //   routes: {
    //     '/login': (context)=>Login(),
    //     '/home': (context)=>homeDashboard(),
    //     '/profile': (context)=>Profile(),
    //   },
    // );
  }
}



