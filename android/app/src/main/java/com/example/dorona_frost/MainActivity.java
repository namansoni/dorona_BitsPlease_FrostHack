package com.example.dorona_frost;

import android.content.Intent;
import android.os.Build;
import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

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
                });
    }
}
