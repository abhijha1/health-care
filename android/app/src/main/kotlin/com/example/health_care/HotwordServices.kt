
import ai.picovoice.porcupine.*
import android.app.Service
import android.content.Intent
import android.os.IBinder
import androidx.core.content.ContextCompat.startActivity
import java.security.Provider


class HotwordServices : Service(){
    private var porcupineManager: PorcupineManager? = null
    val API_token = "2nUaIFLFC+aQkBRGFTPmtF0j9dU0gXekj/ItyHOYjLPXYSMv1Hc3rw=="
    var wakeWordcallback = PorcupineManagerCallback { keywordIndex ->
        if (keywordIndex == 0) {
            print("hello world")
            val launchIntent = packageManager.getLaunchIntentForPackage("com.example.health_care/startService")
            startActivity(launchIntent)
        } else if (keywordIndex == 1) {
            print("hello")
        }
    }

    override fun onCreate(){
        super.onCreate()
        porcupineManager = PorcupineManager.Builder()
                .setAccessKey(API_token)
                .setKeywordPath("android/app/src/main/assets/model.ppn")
                .setModelPath("android/app/src/main/assets/hi.pv")
                .build(this, wakeWordcallback)

        porcupineManager?.start()
    }

    override fun onBind(intent: Intent?): IBinder? {
        return null
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        porcupineManager = PorcupineManager.Builder()
        .setAccessKey(API_token)
        .setKeywordPath("android/app/src/main/assets/model.ppn")
        .setModelPath("android/app/src/main/assets/hi.pv")
        .build(this, wakeWordcallback)

        porcupineManager?.start()

        return START_STICKY
    }


}