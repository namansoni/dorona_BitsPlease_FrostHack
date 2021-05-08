package com.example.dorona_frost;

import android.content.Intent;
import android.location.Address;
import android.location.Geocoder;
import android.os.Build;
import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {
    static MainActivity instance;
    public String userId;
    public static MainActivity getInstance() {
        return instance;
    }
    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        instance = this;

    }
    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), "Location")
                .setMethodCallHandler((call, result) -> {
                    if (call.method.equals("startLocation")) {
                        
                        userId = call.argument("userId").toString();
                        System.out.println(userId);
                        Intent intent=new Intent(this,MyForegroundLocationService.class);
                        if(Build.VERSION.SDK_INT>=Build.VERSION_CODES.O){
                            startForegroundService(intent);
                        }else{
                            startService(intent);
                        }
                    }
                      if (call.method.equals("getAddressFromCoordinates")) {
                                    double latitude = Double.valueOf(call.argument("latitude"));
                                    double longitude = Double.valueOf(call.argument("longitude"));
                                    Map address = new HashMap();
                                    Geocoder geocoder;
                                    geocoder = new Geocoder(this, Locale.getDefault());
                                    List<Address> addresses;
                                    try {
                                        addresses = geocoder.getFromLocation(latitude, longitude, 1);
                                        System.out.println(addresses.get(0).getLocality());
                                        System.out.println(addresses.get(0).getPostalCode());
                                        address.put("adminArea", addresses.get(0).getAdminArea().toString());
                                        address.put("subAdminArea", addresses.get(0).getSubAdminArea().toString());
                                        address.put("pincode", addresses.get(0).getPostalCode().toString());
                                        result.success(address);

                                    } catch (IOException e) {
                                        e.printStackTrace();
                                    }

                                }
                });
    }
}
