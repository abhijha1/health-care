

import 'package:porcupine_flutter/porcupine.dart';
import 'package:porcupine_flutter/porcupine_manager.dart';

class PPSrevice{

  var _porcupineManager;

void _wakeWordCallback(int keywordIndex) {
    if(keywordIndex == 0) {
        // porcupine detected
    }
    else if (keywordIndex == 1) {
        // bumblebee detected
    }
}


  void createPorcupineManager() async {
    try {
      _porcupineManager = await PorcupineManager.fromBuiltInKeywords(
          "{ACCESS_KEY}",
          [BuiltInKeyword.PORCUPINE, BuiltInKeyword.BUMBLEBEE],
          _wakeWordCallback);
    } on PorcupineException catch (err) {
      // handle porcupine init error
    }
  }
}