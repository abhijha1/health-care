

import 'package:flutter/cupertino.dart';
import 'package:porcupine_flutter/porcupine.dart';
import 'package:porcupine_flutter/porcupine_error.dart';
import 'package:porcupine_flutter/porcupine_manager.dart';
import 'package:porcupine_flutter/porcupine_manager.dart';

class PPService{
  static late PorcupineManager porcupineManager;
  late BuildContext context; 

  void init(BuildContext context){
    this.context = context;
    createPorcupineManager();
  }

void _wakeWordCallback(int keywordIndex) {
    if(keywordIndex == 0) {
       Navigator.pushNamed(context, '/home');
    }
    else if (keywordIndex == 1) {
        print("hello");
    }
}


  void createPorcupineManager() async {
    try {
  porcupineManager = await PorcupineManager.fromKeywordPaths(
          "2nUaIFLFC+aQkBRGFTPmtF0j9dU0gXekj/ItyHOYjLPXYSMv1Hc3rw==",
          ["assets/model.ppn",],
          _wakeWordCallback);
          porcupineManager.start();
    } on PorcupineException catch (err) {
      print(err.message);
      // handle porcupine init error
    }
  }
}