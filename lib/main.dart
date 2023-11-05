import 'dart:math';

import 'package:android_intent/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_care/service/procupine_service.dart';
import 'package:health_care/widgets/counntmodalscreen.dart';
import 'package:package_info/package_info.dart';
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
   static const platform = const MethodChannel('com.example.health_care/startService');
    @override
    void initState() {
        super.initState();
      PPService().init(context);
        _startService();
        if(PPService.b.value == 1){
          print("hello");
          relaunchApp();
        }
        
    }

    Future<void> relaunchApp() async {
  final packageInfo = await PackageInfo.fromPlatform();
  final intent = AndroidIntent(
    action: 'android.intent.action.MAIN',
    package: packageInfo.packageName,
    componentName: packageInfo.packageName,
  );
  await intent.launch();
}

    _startService() async {
      try{
        await platform.invokeMethod("startService");
      } on PlatformException catch (e) {
        print("Failed to start service");
      }
        
    }


       

 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      theme: Constants.lighTheme(context),
      debugShowCheckedModeBanner: false,
      home: PPService.b.value == 0 ? HomeScreen() : CountDownPage(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/counter': (context) => CountDownPage(),
      },
    );
  }
}
