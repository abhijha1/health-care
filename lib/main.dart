import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_care/service/procupine_service.dart';
import 'package:health_care/widgets/counntmodalscreen.dart';
import 'package:porcupine_flutter/porcupine_manager.dart';
import '../screens/home_screen.dart';
import '../utils/const.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
 
  runApp(MyApp());
}



class MyApp extends StatefulWidget {
    @override
    _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
   // static const platform = const MethodChannel('com.example.health_care/startService');
    @override
    void initState() {
        super.initState();
      PPService().init(context);
        //_startService();
    }

    // _startService() async {
    //   try{
    //     await platform.invokeMethod("startService");
    //   } on PlatformException catch (e) {
    //     print("Failed to start service");
    //   }
        
    // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      theme: Constants.lighTheme(context),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/counter': (context) => CountDownPage(),
      },
    );
  }
}
