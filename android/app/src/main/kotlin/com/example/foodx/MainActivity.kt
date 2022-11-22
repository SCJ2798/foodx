package com.example.foodx

import android.content.Intent
import android.net.Uri
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.lang.Exception

class MainActivity: FlutterActivity() {
    private val CHANNEL = "channel.flutter/whatsapp"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger,CHANNEL).setMethodCallHandler { call, result ->
            if(call.method == "sendMsg"){
                try{
                    val sendIntent = Intent().apply {
                        action = Intent.ACTION_VIEW
                        putExtra(Intent.EXTRA_TEXT,"HELLO")
                        type ="text/plain"
                        setPackage("com.whatsapp")
                        setData(Uri.parse("https://api.whatsapp.com/send?phone="+call.argument("contactNo")+"&text="+call.argument("msg")))
                    }
                    startActivity(sendIntent)
                  //  result.success("")
                   
                }catch (e:Exception){
                    e.printStackTrace()
                    val appPackageName = "com.whatsapp"
                    try {
                        startActivity(Intent(Intent.ACTION_VIEW, Uri.parse("market://details?id=$appPackageName")))
                    } catch (e :android.content.ActivityNotFoundException) {
                        startActivity(Intent(Intent.ACTION_VIEW, Uri.parse("https://play.google.com/store/apps/details?id=$appPackageName")))
                    }
                  //  result.error(e)
                
                }
            }
        }
    }

}
