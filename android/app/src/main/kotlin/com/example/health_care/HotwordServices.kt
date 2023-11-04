package com.example.health_care
import android.app.Service
import android.content.Intent
import android.os.IBinder

class HotwordServices: Service() {
    override fun onBind(intent: Intent?): IBinder? {
        return null
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        // TODO: Start hotword detection here

        return START_STICKY
    }

    // TODO: When hotword detected, trigger Flutter app
    fun onHotwordDetected() {
        val launchIntent = packageManager.getLaunchIntentForPackage("com.example.health_care")
        startActivity(launchIntent)
    }
}