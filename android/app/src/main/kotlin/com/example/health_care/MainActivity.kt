package com.example.health_care

import HotwordServices
import android.content.Intent
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

// import io.flutter.embedding.engine.FlutterEngine
// import io.flutter.plugin.common.MethodChannel
// import androidx.annotation.NonNull
// import android.content.Intent
class MainActivity: FlutterActivity() {

     private val CHANNEL = "com.example.health_care/lib/main.dart"
     override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
         super.configureFlutterEngine(flutterEngine)
         MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
             call, result ->
             if (call.method == "startServices") {
                 val serviceIntent = Intent(this, HotwordServices::class.java)
                 startService(serviceIntent)
                 result.success("Service Started")
             } else {
                 result.notImplemented()
             }
         }
     }

}
