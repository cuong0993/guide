package com.chaomao.guide

import android.app.NotificationManager
import android.content.Context
import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity() {
    override fun onResume() {
        super.onResume()
        // TODO Cancel notification on each channel
        // TODO Cancel notification on iOS
        cancelAllNotifications()
    }

    private fun cancelAllNotifications() {
        val notificationManager: NotificationManager =
            getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
        notificationManager.cancelAll()
    }
}
