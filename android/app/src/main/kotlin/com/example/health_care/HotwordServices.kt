<<<<<<< HEAD:android/app/src/main/kotlin/com/example/HotwordService.kt


// package com.example.hotword_detection

// import android.app.Service
// import android.content.Intent
// import android.os.IBinder

// class HotwordService : Service() {
//     override fun onBind(intent: Intent?): IBinder? {
//         return null
//     }
=======
package com.example.health_care
import android.app.Service
import android.content.Intent
import android.os.IBinder

class HotwordServices: Service() {
    override fun onBind(intent: Intent?): IBinder? {
        return null
    }
>>>>>>> 2892205b82ab4c76c97787461e1b27868b6fe031:android/app/src/main/kotlin/com/example/health_care/HotwordServices.kt

//     override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
//         // TODO: Start hotword detection here

//         return START_STICKY
//     }

<<<<<<< HEAD:android/app/src/main/kotlin/com/example/HotwordService.kt
//     // TODO: When hotword detected, trigger Flutter app
//     fun onHotwordDetected() {
//         val launchIntent = packageManager.getLaunchIntentForPackage("com.example.hotword_detection")
//         startActivity(launchIntent)
//     }
// }
=======
    // TODO: When hotword detected, trigger Flutter app
    fun onHotwordDetected() {
        val launchIntent = packageManager.getLaunchIntentForPackage("com.example.health_care")
        startActivity(launchIntent)
    }
}
>>>>>>> 2892205b82ab4c76c97787461e1b27868b6fe031:android/app/src/main/kotlin/com/example/health_care/HotwordServices.kt
