package com.ifive.ifive_c_hrms

import android.content.Context
import android.content.Intent 
import android.os.BatteryManager
import android.widget.Toast
import androidx.core.content.ContextCompat
import com.ifive.ifive_c_hrms.helper.SharedHelper
import com.ifive.ifive_c_hrms.observer.VolumeListener
import com.ifive.ifive_c_hrms.observer.VolumeObserver
import com.ifive.ifive_c_hrms.service.LocationService
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.ifive.ifive_hrms/service"
    private val EVENT = "com.ifive.ifive_hrms/event"
 
    private var sharedHelper: SharedHelper? = SharedHelper()


//    private lateinit var context:Context
    private lateinit var volumeObserver: VolumeObserver 
    private lateinit var volumeListenerEventChannel: EventChannel
    private lateinit var volumeListenerStreamHandler: VolumeListener
    
 
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        volumeObserver = VolumeObserver(context) 
        volumeListenerEventChannel = EventChannel(flutterEngine.dartExecutor.binaryMessenger, EVENT)
        volumeListenerStreamHandler = VolumeListener(context)
        volumeListenerEventChannel.setStreamHandler(volumeListenerStreamHandler)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler(::onMethodCall) 
 
    }
  
    private fun getBatteryLevel(): Int {
        val batteryLevel: Int
        val batteryManager = getSystemService(Context.BATTERY_SERVICE) as BatteryManager
        batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)

        return batteryLevel
    }

    private fun startService() {
        val serviceIntent = Intent(this, LocationService::class.java)

        serviceIntent.putExtra("inputExtra", "iFive Location Capture Service")
        ContextCompat.startForegroundService(this, serviceIntent)
    }
 
    private fun stopService() {
        val serviceIntent = Intent(this, LocationService::class.java)
        stopService(serviceIntent)
    } 
    
    private fun showToast(context: Context, message: String) {
        Toast.makeText(context, message, Toast.LENGTH_SHORT).show()
    }
    
    private fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
      
        try {
            when (call.method) {
                "run" -> {
                    val argument: Map<String, Any>? = call.arguments()!!

                    startService()
                    result.success("Success")
                    val token = argument?.get("token") as String
                    sharedHelper?.setToken(context, "token", token)
                    showToast(context, "Have a nice day")
                }
 
                "battery" -> {
                    val argument: Map<String, Any>? = call.arguments()!!

                    val batteryLevel = getBatteryLevel()
                    if (batteryLevel != -1) {
                        result.success(batteryLevel)
                    } else {
                        result.error("UNAVAILABLE", "Battery level not available.", null)
                    }
                }
                
                "stop" -> {
                    val argument: Map<String, Any>? = call.arguments()!!

                    println(" Service Stop")
                    stopService()
                    result.success("Success")
                    showToast(context, "Good Job...!")
                }

                "setVolume" -> {
                    val volume:Double = call.argument("volume")!!
                    val showSystemUI:Boolean = call.argument("showSystemUI")!!
                    volumeObserver.setVolumeByPercentage(volume, showSystemUI)
                }
                
                "getVolume" -> result.success(volumeObserver.getVolume())
                
                else -> result.notImplemented()
            }
        } catch (_: Exception) {

        }
    }
}
 