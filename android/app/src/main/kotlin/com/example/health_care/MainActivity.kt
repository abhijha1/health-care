package com.example.hotword_detection

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example.hotword_detection/startService"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            call, result ->
            if (call.method == "startHotwordService") {
                val serviceIntent = Intent(this, HotwordService::class.java)
                startService(serviceIntent)
                result.success("Service Started")
            } else {
                result.notImplemented()
            }
        }
    }
}
