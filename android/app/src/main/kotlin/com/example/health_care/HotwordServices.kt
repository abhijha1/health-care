// import android.app.Service
// import android.content.Intent
// import android.os.IBinder
// import ai.picovoice.porcupine.Porcupine
// import ai.picovoice.porcupine.PorcupineManager
// import ai.picovoice.porcupine.PorcupineException

// class HotwordService : Service() {
//     // private var porcupineManager: PorcupineManager? = null

//     // var wakeWordcallback: PorcupineManagerCallback = object : PorcupineManagerCallback() {
//     //     operator fun invoke(keywordIndex: Int) {
//     //         if (keywordIndex == 0) {
//     //             // porcupine detected
//     //         } else if (keywordIndex == 1) {
//     //             // bumblebee detected
//     //         }
//     //     }
//     // }

//     // override fun onCreate() {
//     //     super.onCreate()

//     //     // Initialize PorcupineManager
//     //         PorcupineMananger porcupineManager = new PorcupineManager.Builder()
//     //                 .setAccessKey("2nUaIFLFC+aQkBRGFTPmtF0j9dU0gXekj/ItyHOYjLPXYSMv1Hc3rw==")
//     //                 .setKeywords([Porcupine.BuiltInKeyword.PORCUPINE])
//     //                 .build(context, wakeWordCallback);

//     // }

//     // override fun onBind(intent: Intent?): IBinder? {
//     //     return null
//     // }

//     // override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
//     //     // Start Porcupine detection
//     //     startHotwordDetection()

//     //     return START_STICKY
//     // }

//     // fun startHotwordDetection() {
//     //     try {
//     //         porcupineManager?.start()
//     //     } catch (e: PorcupineException) {
//     //         e.printStackTrace()
//     //         // Handle start error
//     //     }
//     // }

//     // fun onHotwordDetected() {
//     //     // Stop Porcupine detection
//     //     stopHotwordDetection()

//     //     // Bring the Flutter app to the foreground
//     //     val launchIntent = packageManager.getLaunchIntentForPackage("com.example.health_care")
//     //     startActivity(launchIntent)
//     // }

//     // fun stopHotwordDetection() {
//     //     try {
//     //         porcupineManager?.stop()
//     //     } catch (e: PorcupineException) {
//     //         e.printStackTrace()
//     //         // Handle stop error
//     //     }
//     // }

// }
