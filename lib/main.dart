import 'package:application/route/route_class_builder.dart';
import 'package:application/view/screen/splash_screen.dart';
import 'package:application/view/style/k_color.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

List<CameraDescription> cameras;

void main() async {
  RouteClassBuilder.registerClasses();
  WidgetsFlutterBinding.ensureInitialized();

  print(cameras);
  cameras = await availableCameras();
  print(cameras);
  runApp(MyApp());
}

/// for camera

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'JobGo App',
      // ignore: deprecated_member_use
      theme: ThemeData(accentColor: KColor.primary),
      home: SplashScreen(),
    );
  }
}
