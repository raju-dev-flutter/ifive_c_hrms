package com.ifive.ifive_c_hrms.service

import android.Manifest
import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.app.Service
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.content.pm.PackageManager
import android.location.Geocoder
import android.location.Location
import android.location.LocationListener
import android.location.LocationManager
import android.os.BatteryManager
import android.os.Build
import android.os.Handler
import android.os.IBinder
import androidx.core.app.ActivityCompat
import androidx.core.app.NotificationCompat
import com.ifive.ifive_c_hrms.MainActivity
import com.ifive.ifive_c_hrms.R
import com.ifive.ifive_c_hrms.helper.SharedHelper
import com.ifive.ifive_c_hrms.retrofit.ApiClient
import com.ifive.ifive_c_hrms.retrofit.model.LocationPostRequest
import com.ifive.ifive_c_hrms.retrofit.model.Message
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response
import java.util.Locale

class LocationService : Service(), LocationListener {

    private var locationManager: LocationManager? = null

    private var sharedHelper: SharedHelper? = null
 
    private var gpsLocationListener: LocationListener? = null


    override fun onCreate() {
        super.onCreate()
        locationManager = getSystemService(LOCATION_SERVICE) as LocationManager
        gpsLocationListener = LocationService()
        sharedHelper = SharedHelper()
        if (ActivityCompat.checkSelfPermission(this, Manifest.permission.ACCESS_FINE_LOCATION) != PackageManager.PERMISSION_GRANTED && ActivityCompat.checkSelfPermission(this, Manifest.permission.ACCESS_COARSE_LOCATION) != PackageManager.PERMISSION_GRANTED) {
            return
        }
        locationManager?.requestLocationUpdates(LocationManager.GPS_PROVIDER, 10 * 1000L, 0f, gpsLocationListener as LocationService)

    }


    override fun onStartCommand(intent: Intent, flags: Int, startId: Int): Int {
        val input = intent.getStringExtra("inputExtra")
        createNotificationChannel()
        val notificationIntent = Intent(this, MainActivity::class.java)
        val pendingIntent = PendingIntent.getActivity(this,
                0, notificationIntent, PendingIntent.FLAG_IMMUTABLE)

        val notification: Notification = NotificationCompat.Builder(this, NOTIFICATION_CHANNEL_ID)
                .setContentTitle("iFive Location Service")
                .setContentText(input)
                .setSmallIcon(R.drawable.notification_icon_push)
                .setContentIntent(pendingIntent)
                .build()
        startForeground(NOTIFICATION_ID, notification)


        val handler = Handler()
        val delay = 1200000   // 20 min
//        val delay = 60000   // 1 min
//        val delay = 15 * 60 * 1000L  // 15 minutes in milliseconds
        
        handler.postDelayed(object : Runnable {
            override fun run() {
                getLocation()
                handler.postDelayed(this, delay.toLong())
            }
        }, delay.toLong())

        return START_STICKY
    }

    private fun createNotificationChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val serviceChannel = NotificationChannel(
                    NOTIFICATION_CHANNEL_ID,
                    "Foreground Service Channel",
                    NotificationManager.IMPORTANCE_DEFAULT
            )
            val manager = getSystemService(NotificationManager::class.java)
            manager.createNotificationChannel(serviceChannel)
        }
    }


    private fun getLocation() {
        if (ActivityCompat.checkSelfPermission(
                        applicationContext, Manifest.permission.ACCESS_FINE_LOCATION
                ) != PackageManager.PERMISSION_GRANTED && ActivityCompat.checkSelfPermission(
                        applicationContext, Manifest.permission.ACCESS_COARSE_LOCATION
                ) != PackageManager.PERMISSION_GRANTED
        ) {
            locationUpdate((0).toString(), (0).toString(), getBatteryPercentage(this).toString(), "Location permissions are not granted")
            // Handle the case when location permissions are not granted
        } else {
            val locationGPS: Location? =
                    locationManager?.getLastKnownLocation(LocationManager.GPS_PROVIDER)
            if (locationGPS != null) {
                val lat = locationGPS.latitude
                val long = locationGPS.longitude
                println("Lat: $lat, Long: $long ")
                val address = getCompleteAddressString(lat, long)
                locationUpdate(lat.toString(), long.toString(), getBatteryPercentage(this).toString(), address)
            } else {
                locationUpdate((0).toString(), (0).toString(), getBatteryPercentage(this).toString(), "Location is not available")
                // Handle the case when the location is not available
            }
        }
    }

    private fun getCompleteAddressString(lat: Double, long: Double): String {
        var strAdd = ""
        val geocoder = Geocoder(applicationContext, Locale.getDefault())

        try {
            val addresses = geocoder.getFromLocation(lat, long, 1)
            if (addresses!!.isNotEmpty()) {
                val returnedAddress = addresses[0]
                val strReturnedAddress = StringBuilder("")
                for (i in 0..returnedAddress.maxAddressLineIndex) {
                    strReturnedAddress.append(returnedAddress.getAddressLine(i)).append("\n")
                }
                strAdd = strReturnedAddress.toString().trim()
                // println("My Current location address: $strAdd")
            } else {
                println("My Current location address is not available")
            }
        } catch (e: Exception) {
            println("Error getting address: ${e.message}")
        }
        return strAdd
    }

    private fun getBatteryPercentage(context: Context): Int {
        // Use applicationContext to avoid potential memory leaks
        val iFilter = IntentFilter(Intent.ACTION_BATTERY_CHANGED)
        val batteryStatus = context.registerReceiver(null, iFilter)
        val level = batteryStatus?.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) ?: -1
        val scale = batteryStatus?.getIntExtra(BatteryManager.EXTRA_SCALE, -1) ?: -1

        val batteryPct = if (scale != 0) (level.toFloat() / scale.toFloat()) else 0.0f

        println("${(batteryPct * 100).toInt()}  Battery")
        return (batteryPct * 100).toInt()
    }

    override fun onLocationChanged(location: Location) {
        println("Location: $location")
    }

    private fun locationUpdate(lat: String, long: String, battery: String, address: String) {
        println("POST DATA: ${sharedHelper?.getToken(this, "token")}")

        val locationRequest: LocationPostRequest = LocationPostRequest()
        locationRequest.setLatitude(lat)
        locationRequest.setLongitude(long)
        locationRequest.setAddress(address)
        locationRequest.setBattery(battery)
        println("POST DATA: ${locationRequest.getAddress()} ${sharedHelper?.getToken(this, "token")}")
        val callEnqueue = ApiClient.apiService.postLocation(sharedHelper?.getToken(this, "token"), locationRequest)
        callEnqueue.enqueue(object : Callback<Message?> {
            override fun onResponse(call: Call<Message?>, response: Response<Message?>) {
                println(response)
                if (response.body() != null) {
                    println(response.body())
                    if (response.body()!!.getMessage().equals("1")) {
                        println(response.body()!!.getMessage())
                    }
                    if (response.body()!!.getMessage().equals("2")) {
                        println(response.body()!!.getMessage())
                    }
                } else {
                    println(response.body()) // Handle error 
                }
            }

            override fun onFailure(call: Call<Message?>, t: Throwable) {
                println(t) // Handle failure  
            }
        })

    }

    override fun onBind(intent: Intent?): IBinder? {
        return null
    }

    override fun onDestroy() {
        super.onDestroy()
        gpsLocationListener?.let { locationManager?.removeUpdates(it) }
    }

    companion object {
        const val NOTIFICATION_CHANNEL_ID = "ForegroundServiceChannel"

        const val NOTIFICATION_ID = 1

    }

}
 

