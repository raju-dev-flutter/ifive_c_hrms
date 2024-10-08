package com.ifive.ifive_c_hrms.retrofit

import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
 
object RetrofitClient {
    private const val BASE_URL = "https://i5erp.in/i5smarthr_c/"

    val retrofit: Retrofit by lazy {
        Retrofit.Builder()
                .baseUrl(BASE_URL)
                .addConverterFactory(GsonConverterFactory.create())
                .build()
    }
}

object ApiClient {
    val apiService: ApiService by lazy {
        RetrofitClient.retrofit.create(ApiService::class.java)
    }
}