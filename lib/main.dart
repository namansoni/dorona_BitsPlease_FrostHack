import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'colors1.dart';
import 'styles.dart';
import 'my_custom_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';
import 'Providers/bottomBarProvider.dart';
import 'Providers/floatingActionButtonProvider.dart';
import 'Providers/userProvider.dart';
import 'Screens/Home/home.dart';
import 'Screens/Login/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isBluetoothOn = true;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: UserProvider(),
        ),
        ChangeNotifierProvider.value(
          value: BottomBarProvider(),
        ),
        ChangeNotifierProvider.value(
          value: FloatingActionButtonProvider(),
        )
      ],
      child: MaterialApp(
          home: SplashScreen(
        seconds: 2,
        backgroundColor: Colors.white,
        navigateAfterSeconds: OnBoarding(),
        title: Text(
          "Dorona",
          style: splashtitle,
        ),
        loadingText: Text(
          "Door Raho Na!",
          style: splashtitle,
        ),
        loaderColor: Colors.red,
        image: Image.asset('assets/images/coronavirus.png'),
        photoSize: 120,
      )),
    );
  }
}

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  bool isDialogOpen = false;
  bool isRegistered = false;
  @override
  void initState() {
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    if (!isRegistered) {
      print("listening");
      isRegistered = true;
      userProvider.registerUserChange();
    }
    return userProvider.issignedIn ? Home(userProvider.user) : Login();
  }

  void getPermissions() async {
    await requestPermission();
  }

}
