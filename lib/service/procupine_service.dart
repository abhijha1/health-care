

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:porcupine_flutter/porcupine.dart';
import 'package:porcupine_flutter/porcupine_error.dart';
import 'package:porcupine_flutter/porcupine_manager.dart';
import 'package:porcupine_flutter/porcupine_manager.dart';

import '../screens/countdown.dart';
import '../widgets/counntmodalscreen.dart';

class PPService extends GetxController {
  static late PorcupineManager porcupineManager;
  late BuildContext context; 
  static RxInt b = 0.obs;
  static set setB(int value) => b.value = value;
  static int get getB => b.value;

  void init(BuildContext context){
    this.context = context;
    createPorcupineManager();
  }

void _wakeWordCallback(int keywordIndex) {
    if(keywordIndex == 0) {
      print("hello world");
      b.value = 1;
      // ShowModalBottomSheet(context);
      update();
        }
    else if (keywordIndex == 1) {
        print("hello");
    }
}


  void createPorcupineManager() async {
    try {
  porcupineManager = await PorcupineManager.fromKeywordPaths(
          "2nUaIFLFC+aQkBRGFTPmtF0j9dU0gXekj/ItyHOYjLPXYSMv1Hc3rw==",
          ["assets/model.ppn"],
          _wakeWordCallback, modelPath: "assets/hi.pv");
          porcupineManager.start();
    } on PorcupineException catch (err) {
      print(err.message);
      // handle porcupine init error
    }
  }
}