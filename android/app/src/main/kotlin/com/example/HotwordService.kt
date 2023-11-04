

// package com.example.hotword_detection

// import android.app.Service
// import android.content.Intent
// import android.os.IBinder

// class HotwordService : Service() {
//     override fun onBind(intent: Intent?): IBinder? {
//         return null
//     }

//     override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
//         // TODO: Start hotword detection here

//         return START_STICKY
//     }

//     // TODO: When hotword detected, trigger Flutter app
//     fun onHotwordDetected() {
//         val launchIntent = packageManager.getLaunchIntentForPackage("com.example.hotword_detection")
//         startActivity(launchIntent)
//     }
// }
